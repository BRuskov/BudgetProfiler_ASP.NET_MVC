using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BudgetProfilerr.Models;
using BudgetProfilerr.Models.Entities;
using BudgetProfilerr.Models.ModelViews;

namespace BudgetProfilerr.Controllers
{
    public class TransactionsController : Controller
    {
        private BudgetDBContext db = new BudgetDBContext();
        public IEnumerable<UserModel> users;

        // GET
        public ActionResult Index()
        {
            if (!isTransactionModuleOperating())
            {
                return RedirectToAction("Index", "Users");
            }

            List<UserModel> selectedUsers = Session["SelectedUsers"] as List<UserModel>;

            IQueryable<TransactionModel> queryTransactions = null;
            queryTransactions = PopulateTransactions(queryTransactions, selectedUsers);

            DisplayTransactionViewModel displayTransactions = new DisplayTransactionViewModel();
            displayTransactions.Transactions = new List<TransactionModel>();
            displayTransactions.Transactions = queryTransactions.ToList<TransactionModel>();
            displayTransactions.SelectedUsers = selectedUsers;

            return View(displayTransactions);
        }

        private IQueryable<TransactionModel> PopulateTransactions(IQueryable<TransactionModel> Transaction, List<UserModel> selectedUsers)
        {
            // Transaction = new TransactionModel() as IQueryable<TransactionModel>;
            var b = GetUserTransactions(selectedUsers[0]);
            for (int i = 1; i < selectedUsers.Count; i++)
            {
                b = b.Union(GetUserTransactions(selectedUsers[i]));

            }
            return b = b.OrderBy(m => m.TimeStamp);

        }

        private IQueryable<TransactionModel> GetUserTransactions(UserModel usr)
        {
            var transactions = from transaction in db.Transactions.Include("User").Include("CategoryID")
                               where transaction.User.ID == usr.ID
                               select transaction;
            return transactions;
        }

        private bool isTransactionModuleOperating()
        {
            if (Session["SelectedUsers"] == null)
                return false;
            return true;
        }

        private bool IsNeededTransaction()
        {
            return true;
        }

        [HttpPost]
        public ActionResult DeleteTransaction([Bind(Include = "deleteID")] string deleteID)
        {
            int m = Convert.ToInt32(deleteID);
            if (deleteID == null)
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            TransactionModel eraseTrans = db.Transactions.Find(m);
            if (eraseTrans == null)
            {
                return HttpNotFound();
            }
            db.Transactions.Remove(eraseTrans);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Transactions/Details/5
        [Authorize]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TransactionModel transactionModel = db.Transactions.Find(id);
            if (transactionModel == null)
            {
                return HttpNotFound();
            }
            return View(transactionModel);
        }

        // GET: Transactions/Create
        public ActionResult Create()
        {
            updateCategoryDropDownList();
            updateUserDropDownList();
            return View();
        }

        private void updateCategoryDropDownList()
        {
            //Implement ->  Display only user/s preferenced Categories
            List<SelectListItem> CategoryList = new List<SelectListItem>();

            foreach (var category in db.Categories)
            {
                if (category == null) break;
                SelectListItem categoryListItem = new SelectListItem()
                {
                    Value = category.ID.ToString(),
                    Text = category.Name
                };
                CategoryList.Add(categoryListItem);
            }
            ViewBag.CategoryList = CategoryList;
        }

        private void updateUserDropDownList()
        {
            var users = Session["SelectedUsers"] as List<UserModel>;
            List<SelectListItem> UserList = new List<SelectListItem>();
            foreach (var user in users)
            {
                if (user == null) break;
                SelectListItem userItem = new SelectListItem()
                {
                    Value = user.ID.ToString(),
                    Text = user.FirstName + " " + user.LastName
                };

                UserList.Add(userItem);
            }
            ViewBag.UserList = UserList;
        }

        [HttpPost]
        public ActionResult PublishTransaction(CreateTransactionViewModel transaction)
        {
            db.Transactions.Add(new TransactionModel()
            {
                Amount = transaction.Amount,
                isExpense = transaction.isExpense,
                User = db.Users.Find(transaction.OwnerID),
                Description = transaction.Description,
                CategoryID = db.Categories.Find(transaction.CategoryID),
                TimeStamp = DateTime.Now
            });
            db.SaveChanges();

            return RedirectToAction("Index", "Transactions");
        }

        // POST: Transactions/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,Description,Amount,TimeStamp,isExpense")] TransactionModel transactionModel)
        {
            if (ModelState.IsValid)
            {
                Console.WriteLine("NONNE");
                db.Transactions.Add(transactionModel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(transactionModel);
        }

        // GET: Transactions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TransactionModel transactionModel = db.Transactions.Find(id);
            if (transactionModel == null)
            {
                return HttpNotFound();
            }
            return View(transactionModel);
        }

        // POST: Transactions/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,Description,Amount,TimeStamp,Direction")] TransactionModel transactionModel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(transactionModel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(transactionModel);
        }

        // GET: Transactions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TransactionModel transactionModel = db.Transactions.Find(id);
            if (transactionModel == null)
            {
                return HttpNotFound();
            }
            return View(transactionModel);
        }

        // POST: Transactions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TransactionModel transactionModel = db.Transactions.Find(id);
            db.Transactions.Remove(transactionModel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
