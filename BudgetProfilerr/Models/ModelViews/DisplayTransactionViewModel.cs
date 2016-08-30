using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BudgetProfilerr.Models.Entities;

namespace BudgetProfilerr.Models.ModelViews
{
    public class DisplayTransactionViewModel
    {
        public DisplayTransactionViewModel() { }

        public List<TransactionModel> Transactions { get; set; }
        public List<UserModel> SelectedUsers { get; set; }
        public List<CategoryModel> UsersCategories { get; set; }

    }
}