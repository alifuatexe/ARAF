//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ARAF_OPERATOR_PANEL
{
    using System;
    using System.Collections.Generic;
    
    public partial class WORKSTATION
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public WORKSTATION()
        {
            this.PLANNING = new HashSet<PLANNING>();
            this.PRODUCTION_PLANNING = new HashSet<PRODUCTION_PLANNING>();
            this.ITEM_OPERATIONS = new HashSet<ITEM_OPERATIONS>();
            this.PRODUCTION = new HashSet<PRODUCTION>();
        }
    
        public int WS_ID { get; set; }
        public Nullable<int> WSG_ID { get; set; }
        public string WS_CODE { get; set; }
        public string WS_NAME { get; set; }
        public string COMPUTER_NAME { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PLANNING> PLANNING { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PRODUCTION_PLANNING> PRODUCTION_PLANNING { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ITEM_OPERATIONS> ITEM_OPERATIONS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PRODUCTION> PRODUCTION { get; set; }
    }
}
