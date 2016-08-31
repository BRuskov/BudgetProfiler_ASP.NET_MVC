using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BudgetProfilerr.Models.ModelViews
{
    public class UserViewModel
    {
        public string UserAction { get; set; }
        public int []SelectedUser { get; set; }

        [StringLength(20)]
        [Required]
        //[RegularExpression(@"[A-Za-z]", ErrorMessage = "Incorret format")]
        public string FirstName { get; set; }

        [StringLength(20)]
        [Required]
        //[RegularExpression(@"[A-Za-z]", ErrorMessage = "Incorrect format")]
        public string LastName { get; set; }
    }
}