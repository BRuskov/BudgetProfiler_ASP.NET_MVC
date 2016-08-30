using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;

namespace BudgetProfilerr.Models.Entities
{
    [System.ComponentModel.DataAnnotations.Schema.Table("Users")]
    public class UserModel
    {
        [Key]
        public int ID { get; set; }
        
        [Display(Name="First Name")]
        [StringLength(20)]
        [Required]
        [RegularExpression(@"([a-zA-Z\d]+[\w\d]*|)[a-zA-Z]+[\w\d.]*", ErrorMessage = "Invalid username")]
        public string FirstName { get; set; }

        [Display(Name="Last Name")]
        [StringLength(20)]
        [Required]
        [RegularExpression(@"([a-zA-Z\d]+[\w\d]*|)[a-zA-Z]+[\w\d.]*", ErrorMessage = "Invalid username")]
        public string LastName { get; set; }
    }
}
