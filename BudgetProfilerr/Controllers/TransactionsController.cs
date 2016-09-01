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
            List<UserModel> selectedUsers = getSelectedUsersList();
            TransactionViewModel transactionViewModel = new TransactionViewModel
            {
                Transactions = getUsersGroupedTransactionList(getSelectedUsersList()),
                SelectedUsers = getSelectedUsersList()
            };
            updateCategoryDropDownList();
            updateUserDropDownList();

            return View(transactionViewModel);
        }

        private List<TransactionModel> getUsersGroupedTransactionList(List<UserModel> selectedUsers)
        {
            var neededTransactions = getUserTransactions(selectedUsers[0]);
            for (int i = 1; i < selectedUsers.Count; i++)
            {
                neededTransactions = neededTransactions.Union(getUserTransactions(selectedUsers[i]));

            }
            var neededTransactionsList = neededTransactions.OrderBy(m => m.TimeStamp).ToList<TransactionModel>();
            return neededTransactionsList;
        }

        private IQueryable<TransactionModel> getUserTransactions(UserModel usr)
        {
            var transactions = from transaction in db.Transactions.Include("User").Include("Category")
                               where transaction.User.ID == usr.ID
                               select transaction;
            return transactions;
        }

        private List<UserModel> getSelectedUsersList()
        {
            return Session["SelectedUsers"] as List<UserModel>;
        }

        private bool isTransactionModuleOperating()
        {
            if (Session["SelectedUsers"] == null)
                return false;
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

        private void updateCategoryDropDownList()
        {
            // TODO: Implement ->  Display only user/s preferenced Categories
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
        public ActionResult PublishTransaction([Bind(Include = "Amount,isExpense,OwnerID,Description,Category,TransactionDate")]  TransactionViewModel transaction)
        {
            if (ModelState.IsValid)
            {
                db.Transactions.Add(new TransactionModel()
                {
                    Amount = transaction.Amount,
                    isExpense = transaction.isExpense,
                    User = db.Users.Find(transaction.OwnerID),
                    Description = transaction.Description,
                    Category = db.Categories.Find(transaction.Category),
                    TimeStamp = transaction.TransactionDate
                });
                db.SaveChanges();
            }
            return RedirectToAction("Index", "Transactions");
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

        public ActionResult UpdateUserInformationPView(int id)
        {
            ModelState.Clear();
            var user = from usr in getSelectedUsersList()
                       where usr.ID == id
                       select usr;

            //if (id == 5)
            //    return new HttpStatusCodeResult(HttpStatusCode.Found);


            List<UserModel> userSingleListItem = new List<UserModel>();

            foreach (var usr in user)
            {
                userSingleListItem.Add(usr);
            }

            TransactionViewModel model = new TransactionViewModel()
            {
                SelectedUsers = userSingleListItem,
                FirstName = userSingleListItem.Single<UserModel>().FirstName,
                LastName = userSingleListItem.Single<UserModel>().LastName,
            };
    
            return PartialView("_transactionUserInformation",model);
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
