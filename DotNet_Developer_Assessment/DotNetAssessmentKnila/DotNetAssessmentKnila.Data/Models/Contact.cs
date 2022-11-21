using System;
using System.Collections.Generic;

namespace DotNetAssessmentKnila.Data.Models
{
    public partial class Contact
    {
        public Contact()
        {
            ContactAddress = new HashSet<ContactAddress>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public int? CityId { get; set; }
        public int? StateId { get; set; }
        public int? CountryId { get; set; }

        public virtual City City { get; set; }
        public virtual Country Country { get; set; }
        public virtual StateTbl State { get; set; }
        public virtual ICollection<ContactAddress> ContactAddress { get; set; }
    }
}
