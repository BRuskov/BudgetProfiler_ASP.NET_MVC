using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace BudgetProfilerr.Models.Entities
{
    public class UserCategory
    {
        [Key]
        public int ID { get; set; }
        public UserModel User { get; set; }
        public CategoryModel Category { get; set; }
    }
}