using System;
using System.Collections.Generic;

namespace DotNetAssessmentKnila.Data.Models
{
    public partial class Country
    {
        public Country()
        {
            Contact = new HashSet<Contact>();
            StateTbl = new HashSet<StateTbl>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Contact> Contact { get; set; }
        public virtual ICollection<StateTbl> StateTbl { get; set; }
    }
}
