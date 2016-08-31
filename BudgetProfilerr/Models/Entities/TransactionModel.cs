using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BudgetProfilerr.Models.Entities
{   [Table("Transactions")]
    public class TransactionModel
    {
        public TransactionModel() { }
        [Key]
        public int ID { get; set; }

        [StringLength(50)]
        [Display(Name="Memo")]
        public string Description { get; set; }

        [Range(0,1000000)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:c}")]
        public double Amount { get; set; }

        [Display(Name="Owner")]
        public UserModel User { get; set; }

        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        [Required]
        public DateTime TimeStamp { get; set; }

        [Display(Name="Is Expense : ")]
        public bool isExpense { get; set; }

        public CategoryModel Category { get; set; }
    }
}