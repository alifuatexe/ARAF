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
    
    public partial class ITEMS
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ITEMS()
        {
            this.ITEM_TREE = new HashSet<ITEM_TREE>();
            this.ITEM_TREE1 = new HashSet<ITEM_TREE>();
            this.ITEM_OPERATIONS = new HashSet<ITEM_OPERATIONS>();
            this.PLANNING = new HashSet<PLANNING>();
        }
    
        public int ITEM_ID { get; set; }
        public string ITEM_CODE { get; set; }
        public string ITEM_NAME { get; set; }
        public Nullable<int> UNIT { get; set; }
        public Nullable<double> STATUS { get; set; }
        public string TYPE { get; set; }
        public Nullable<int> ERP_ID { get; set; }
        public Nullable<int> ITEM_GRP_ID { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ITEM_TREE> ITEM_TREE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ITEM_TREE> ITEM_TREE1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ITEM_OPERATIONS> ITEM_OPERATIONS { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PLANNING> PLANNING { get; set; }
    }
}
