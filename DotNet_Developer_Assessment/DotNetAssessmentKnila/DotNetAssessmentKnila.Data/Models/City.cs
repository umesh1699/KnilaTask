using System;
using System.Collections.Generic;

namespace DotNetAssessmentKnila.Data.Models
{
    public partial class City
    {
        public City()
        {
            Contact = new HashSet<Contact>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int? StateId { get; set; }

        public virtual StateTbl State { get; set; }
        public virtual ICollection<Contact> Contact { get; set; }
    }
}
