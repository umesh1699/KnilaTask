using System;
using System.Collections.Generic;

namespace DotNetAssessmentKnila.Data.Models
{
    public partial class ContactAddress
    {
        public int Id { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string Landmark { get; set; }
        public string PostalCode { get; set; }
        public int? ContactId { get; set; }

        public virtual Contact Contact { get; set; }
    }
}
