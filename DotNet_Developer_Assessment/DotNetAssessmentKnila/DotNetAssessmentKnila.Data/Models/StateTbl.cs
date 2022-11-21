using System;
using System.Collections.Generic;

namespace DotNetAssessmentKnila.Data.Models
{
    public partial class StateTbl
    {
        public StateTbl()
        {
            City = new HashSet<City>();
            Contact = new HashSet<Contact>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int? CountryId { get; set; }

        public virtual Country Country { get; set; }
        public virtual ICollection<City> City { get; set; }
        public virtual ICollection<Contact> Contact { get; set; }
    }
}
