using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BudgetProfilerr.Models.Entities
{
    [Table("Categories")]
    public class CategoryModel
    {
        public int ID { get; set; }
        
        [Display(Name="Category Name")]
        [StringLength(35)]
        [Required]
        public string Name { get; set; }
       
    }
}