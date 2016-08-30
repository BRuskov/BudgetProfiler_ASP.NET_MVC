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
        [RegularExpression(@"([a-zA-Z\d]+[\w\d]*|)[a-zA-Z]+[\w\d.]*", ErrorMessage = "Invalid username")]
        public string FirstName { get; set; }

        [StringLength(20)]
        [Required]
        [RegularExpression(@"([a-zA-Z\d]+[\w\d]*|)[a-zA-Z]+[\w\d.]*", ErrorMessage = "Invalid username")]
        public string LastName { get; set; }
    }
}