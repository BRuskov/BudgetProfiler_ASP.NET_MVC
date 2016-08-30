using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BudgetProfilerr.Models.ModelViews
{
    public class CreateTransactionViewModel
    {
        public double Amount { get; set; }
        public int OwnerID { get; set; }
        public int CategoryID { get; set; }
        public string Description { get; set; }
        public DateTime TransactionDate { get; set; }
        public Boolean isExpense { get; set; }
    }
}