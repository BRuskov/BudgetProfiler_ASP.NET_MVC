using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using BudgetProfilerr.Models.Entities;

namespace BudgetProfilerr.Models
{
    public class BudgetDBContext : DbContext
    {
        public BudgetDBContext() : base("name=BudgetDBContext")
        {
            // this.Configuration.LazyLoadingEnabled = false;
        }

        public DbSet<CategoryModel> Categories { get; set; }
        public DbSet<TransactionModel> Transactions { get; set; }
        public DbSet<UserModel> Users { get; set; }
        public DbSet<UserCategory> UserCategory { get; set; }   
    }
}