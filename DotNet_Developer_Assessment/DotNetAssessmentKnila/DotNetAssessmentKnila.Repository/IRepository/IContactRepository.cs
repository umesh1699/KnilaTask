using DotNetAssessmentKnila.Data.Models;
using DotNetAssessmentKnila.Repository.StoredProcs;
using DotNetAssessmentKnila.Repository.ViewModels;
using System;
using System.Collections.Generic;
using System.Text;

namespace DotNetAssessmentKnila.Repository.IRepository
{
    public interface IContactRepository 
    {
        public List<GetAllContactsDataResult> GetAllContactData();

        public GetAllContactsDataResult GetContactDataById(int contactId);
        
        public bool CreateNewContactData(GetAllContactsDataResult data);
        public bool UpdateContactData(GetAllContactsDataResult data);
    }
}
