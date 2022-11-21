using DotNetAssessmentKnila.Data.Models;
using DotNetAssessmentKnila.Repository.IRepository;
using DotNetAssessmentKnila.Repository.StoredProcs;
using DotNetAssessmentKnila.Repository.ViewModels;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;

namespace DotNetAssessmentKnila.Repository
{
    public class ContactRepository : IContactRepository
    {
        #region Private Vars
        private readonly string _connectionString;
        private readonly KnilaTaskDBContext _context;
        #endregion

        #region Constractor
        public ContactRepository(KnilaTaskDBContext context)
        {
            _context = context;
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json")
                .Build();
            _connectionString = builder.GetConnectionString("KnilaDb");
        }

        public bool CreateNewContactData(GetAllContactsDataResult data)
        {
            var contactData = new Contact()
            {
                CityId = data.CityId,
                CountryId = data.CountryId,
                StateId = data.StateId,
                Email = data.Email,
                FirstName = data.FirstName,
                LastName = data.LastName,
                PhoneNumber = data.PhoneNumber
            };
            _context.Contact.Add(contactData);
            _context.SaveChanges();

            if (contactData.Id > 0)
            {
                var createAddress = new ContactAddress()
                {
                    AddressLine1 = data.AddressLine1,
                    AddressLine2 = data.AddressLine2,
                    Landmark = data.Landmark,
                    PostalCode = data.PostalCode,
                    ContactId=contactData.Id
                };
                _context.ContactAddress.Add(createAddress);
                _context.SaveChanges();
            }
            if (contactData.Id > 0)
                return true;
            return false;
        }
        #endregion

       
        public List<GetAllContactsDataResult> GetAllContactData()
        {
            var result = new List<GetAllContactsDataResult>();

            using (var conn = new SqlConnection(_connectionString))
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();

                var cmd = new SqlCommand("p_GetAllContactsData", conn)
                {
                    CommandType = System.Data.CommandType.StoredProcedure,
                    Connection = conn
                };

                cmd.Connection.Open();

                using (var dr = cmd.ExecuteReader())
                {

                    while (dr.Read())
                    {
                        var record = new GetAllContactsDataResult()
                        {
                            Id = Convert.ToInt32(dr["Id"]),
                            FirstName = dr["FirstName"].ToString(),
                            LastName = dr["LastName"].ToString(),
                            Email = dr["Email"].ToString(),
                            AddressLine1 = dr["AddressLine1"].ToString(),
                            AddressLine2 = dr["AddressLine2"].ToString(),
                            Landmark = dr["Landmark"].ToString(),
                            City = dr["CityName"].ToString(),
                            PhoneNumber = dr["PhoneNumber"].ToString(),
                            Country = dr["CountryName"].ToString(),
                            PostalCode = dr["PostalCode"].ToString(),
                            State = dr["StateName"].ToString(),
                        };

                        result.Add(record);
                    }
                }
            }

            return result;
        }
      
        public GetAllContactsDataResult GetContactDataById(int contactId)
        {

            using (var conn = new SqlConnection(_connectionString))
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();

                var cmd = new SqlCommand("p_GetContactsDataById", conn)
                {
                    CommandType = System.Data.CommandType.StoredProcedure,
                    Connection = conn
                };

                cmd.Parameters.AddWithValue("ContactId", contactId);
                cmd.Connection.Open();

                using (var dr = cmd.ExecuteReader())
                {

                    while (dr.Read())
                    {
                        var record = new GetAllContactsDataResult()
                        {
                            FirstName = dr["FirstName"].ToString(),
                            LastName = dr["LastName"].ToString(),
                            Email = dr["Email"].ToString(),
                            AddressLine1 = dr["AddressLine1"].ToString(),
                            AddressLine2 = dr["AddressLine2"].ToString(),
                            Landmark = dr["Landmark"].ToString(),
                            City = dr["CityName"].ToString(),
                            PhoneNumber = dr["PhoneNumber"].ToString(),
                            Country = dr["CountryName"].ToString(),
                            PostalCode = dr["PostalCode"].ToString(),
                            State = dr["StateName"].ToString(),
                        };
                        return record;
                    }
                }
            }
            return null;
        }

        public bool UpdateContactData(GetAllContactsDataResult data)
        {
            if (data.Id <= 0)
                return false;

            var chkExisting = _context.Contact.Where(x => x.Id.Equals(data.Id)).FirstOrDefault();
            if (chkExisting == null)
                return false;
            chkExisting.FirstName = data.FirstName;
            chkExisting.LastName = data.LastName;
            chkExisting.CountryId = data.CountryId;
            chkExisting.StateId = data.StateId;
            chkExisting.CityId = data.CityId;
            chkExisting.PhoneNumber = data.PhoneNumber;
            chkExisting.Email = data.Email;
            _context.Contact.Update(chkExisting);
            _context.SaveChanges();

            var chkExistingAddress = _context.ContactAddress.Where(x => x.ContactId.Equals(data.Id)).FirstOrDefault();
            if (chkExistingAddress != null)
            {
                chkExistingAddress.AddressLine1 = data.AddressLine1;
                chkExistingAddress.AddressLine2 = data.AddressLine2;
                chkExistingAddress.Landmark = data.Landmark;
                chkExistingAddress.PostalCode = data.PostalCode;
                _context.ContactAddress.Update(chkExistingAddress);
                _context.SaveChanges();
            }



            return true;

        }
    }
}
