using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DotNetAssessmentKnila.Models
{
    public class GetLookUpDataVM
    {
        //public List<CityVM> CityList { get; set; }
        //public List<StateVM> StateList { get; set; }
        //public List<CountryVM> CountryList { get; set; }

        public GetLookUpDataVM()
        {
            this.Countries = new List<SelectListItem>();
            this.States = new List<SelectListItem>();
            this.Cities = new List<SelectListItem>();
        }
        public List<SelectListItem> Countries { get; set; }
        public List<SelectListItem> States { get; set; }
        public List<SelectListItem> Cities { get; set; }

        public int CountryId { get; set; }
        public int StateId { get; set; }
        public int CityId { get; set; }
    }

    //public class CityVM
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //    public int StateId { get; set; }
    //}
    //public class StateVM
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //    public int CountryId { get; set; }
    //}
    //public class CountryVM
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}
}
