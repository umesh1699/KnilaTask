using DotNetAssessmentKnila.Data.Models;
using DotNetAssessmentKnila.Repository.IRepository;
using DotNetAssessmentKnila.Repository.StoredProcs;
using Microsoft.AspNetCore.Mvc;
using System;

namespace DotNetAssessmentKnila.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactController : ControllerBase
    {
        #region Private Members     
        private readonly IContactRepository _contactRepository;

        #endregion
        #region Constructor 
        public ContactController(IContactRepository contactRepository)
        {
            _contactRepository = contactRepository;
        }
        #endregion

        [HttpGet]
        [Route("GetAllContact")]
        public IActionResult GetAllContact()
        {
            try
            {
                var result = _contactRepository.GetAllContactData();
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpGet]
        [Route("GetContactById/{contactId}")]
        public IActionResult GetContactById(int contactId)
        {
            try
            {
                var result = _contactRepository.GetContactDataById(contactId);
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpPut]
        [Route("UpdateContactData")]
        public IActionResult UpdateContactData(GetAllContactsDataResult data)
        {
            try
            {
                var result = _contactRepository.UpdateContactData(data);
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

     
      
        [HttpPost]
        [Route("CreateNewContact")]
        public IActionResult CreateNewContact(GetAllContactsDataResult data)
        {
            try
            {
                var result = _contactRepository.CreateNewContactData(data);
                if (result)
                    return Ok();
                return BadRequest();
            }
            catch (Exception ex)
            {
                throw;
            }
        }


    }
}
