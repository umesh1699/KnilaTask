using DotNetAssessmentKnila.Data.Models;
using DotNetAssessmentKnila.Models;
using DotNetAssessmentKnila.Repository.StoredProcs;
using GoogleMaps.LocationServices;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace DotNetAssessmentKnila.Controllers
{
    public class HomeController : Controller
    {
        private readonly string _apiBaseUrl = "https://localhost:44317/api";
        private readonly KnilaTaskDBContext _context;

        public HomeController(KnilaTaskDBContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            List<GetAllContactsDataResult> responseList = new List<GetAllContactsDataResult>();
            using (HttpClient client = new HttpClient())
            {
                string endpoint = _apiBaseUrl + "/Contact/GetAllContact";
                using (var Response = await client.GetAsync(endpoint))
                {
                    if (Response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        string apiResponse = await Response.Content.ReadAsStringAsync();
                        responseList = JsonConvert.DeserializeObject<List<GetAllContactsDataResult>>(apiResponse);
                    }
                }
            }
            return View(responseList);
        }

        public IActionResult Privacy()
        {
            return View();
        }


        [HttpGet]
        public IActionResult CreateContact()
        {
            ContactDataVM model = new ContactDataVM();
            model.Countries = (from Country in _context.Country
                               select new SelectListItem
                               {
                                   Value = Country.Id.ToString(),
                                   Text = Country.Name
                               }).ToList();
            return View(model);
        }


        //[HttpGet]
        //public IActionResult EditContact()
        //{

        //    return View();
        //}

       
        public async Task<IActionResult> EditContact(int Id)
        {
            var result = new GetAllContactsDataResult();
            using (HttpClient client = new HttpClient())
            {
                string endpoint = _apiBaseUrl + "/Contact/GetContactById/";
                using (var Response = await client.GetAsync(endpoint + Id)) 
                {
                    if (Response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        string apiResponse = await Response.Content.ReadAsStringAsync();
                        result = JsonConvert.DeserializeObject<GetAllContactsDataResult>(apiResponse);
                    }
                }
            }
            return View(result);
        }

        [HttpPost]
        public JsonResult GetLookUpData(string type, int value)
        {
            GetLookUpDataVM model = new GetLookUpDataVM();
            switch (type)
            {
                case "ddlCountries":
                    model.States = (from state in this._context.StateTbl
                                    where state.CountryId == value
                                    select new SelectListItem
                                    {
                                        Value = state.Id.ToString(),
                                        Text = state.Name
                                    }).ToList();
                    break;
                case "ddlStates":
                    model.Cities = (from city in this._context.City
                                    where city.StateId == value
                                    select new SelectListItem
                                    {
                                        Value = city.Id.ToString(),
                                        Text = city.Name
                                    }).ToList();
                    break;
            }
            return Json(model);
        }


        [HttpPost]
        public async Task<IActionResult> CreateContact(ContactDataVM contactData)
        {
            using (HttpClient client = new HttpClient())
            {
                string endpoint = _apiBaseUrl + "/Contact/CreateNewContact";
                StringContent content = new StringContent(JsonConvert.SerializeObject(contactData), Encoding.UTF8, "application/json");
                using (var Response = await client.PostAsync(endpoint, content))
                {
                    if (Response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        return RedirectToAction("Index");
                    }
                }
                return RedirectToAction("EditContact");
            }
        }


        [HttpGet]
        public async Task<IActionResult> MapAddressData(int Id)
        {
            var result = new GetAllContactsDataResult();
            using (HttpClient client = new HttpClient())
            {
                string endpoint = _apiBaseUrl + "/Contact/GetContactById/";
                using (var Response = await client.GetAsync(endpoint + Id))
                {
                    if (Response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        string apiResponse = await Response.Content.ReadAsStringAsync();
                        result = JsonConvert.DeserializeObject<GetAllContactsDataResult>(apiResponse);
                    }
                }
            }
            if (result != null)
            {
                var address = result.AddressLine1 + " " + result.AddressLine2 + " "
                   + result.Landmark + ", " + result.City + ", " + result.State + ", " + result.Country;

                string url = "https://maps.google.com/maps/api/geocode/xml?address=" + address + "&sensor=false&key=AIzaSyAV89Dot7OnbIJmy7_Pz5blaYdJysGNECc";
                WebRequest request = WebRequest.Create(url);
                using (WebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    using (StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8))
                    {

                    }
                }



                //var locationService = new GoogleLocationService("AIzaSyAV89Dot7OnbIJmy7_Pz5blaYdJysGNECc");

                //var point = locationService.GetLatLongFromAddress(address);

                //var latitude = point.Latitude;
                //var longitude = point.Longitude;
            }



            return View();
        }



        [HttpPut]
        public async Task<IActionResult> UpdateContact(ContactDataVM contactData)
        {
            using (HttpClient client = new HttpClient())
            {
                string endpoint = _apiBaseUrl + "/Contact/UpdateContactData";
                StringContent content = new StringContent(JsonConvert.SerializeObject(contactData), Encoding.UTF8, "application/json");
                using (var Response = await client.PostAsync(endpoint, content))
                {
                    if (Response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        return RedirectToAction("Index");
                    }
                }
                return RedirectToAction("EditContact");
            }
        }


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
