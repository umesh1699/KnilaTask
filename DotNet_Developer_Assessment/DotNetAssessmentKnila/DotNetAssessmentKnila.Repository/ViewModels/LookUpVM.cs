using DotNetAssessmentKnila.Data.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace DotNetAssessmentKnila.Repository.ViewModels
{
    public class LookUpVM
    {
        public List<City> CityList { get; set; }
        public List<StateTbl> StateList { get; set; }
        public List<Country> CountryList { get; set; }
    }
}
