using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BudgetProfilerr.Models.Entities;
using System.ComponentModel.DataAnnotations;

namespace BudgetProfilerr.Models.ModelViews
{
    public class TransactionViewModel
    {
        public TransactionViewModel() { }

        public List<TransactionModel> Transactions { get; set; }

        public List<UserModel> SelectedUsers { get; set; }

        public List<CategoryModel> UsersCategories { get; set; }

        [Range(0, 1000000000, ErrorMessage = "Amount range[0,1000000000]")]
        [Required(ErrorMessage = "Amount is Required")]
        public double Amount { get; set; }

        [Required]
        public int OwnerID { get; set; }

        [Required]
        public int Category { get; set; }

        [Required]
        public string Description { get; set; }

        [Required(ErrorMessage = " Date Needed")]
        [DataType(DataType.Date)]
        public DateTime TransactionDate { get; set; }

        public Boolean isExpense { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }
    }
}