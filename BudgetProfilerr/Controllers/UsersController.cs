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
    public class UsersController : Controller
    {
        private BudgetDBContext db = new BudgetDBContext();
        private UserViewModel userCrObj = new UserViewModel();

        // GET: UserModels
        public ActionResult Index()
        {
            List<SelectListItem> selectItemsList = new List<SelectListItem>();
            foreach (var user in db.Users)
            {
                if (user != null)
                {
                    SelectListItem selectItem = new SelectListItem()
                    {
                        Text = user.FirstName + " " + user.LastName,
                        Value = user.ID.ToString()
                    };
                    selectItemsList.Add(selectItem);
                }
            }
            ViewBag.UsersList = selectItemsList;

            return View(userCrObj);
        }

        //Post:
        [HttpPost]
        public ActionResult Management([Bind(Include = "SelectedUser,UserAction")] UserViewModel usr)
        {
            if (usr.SelectedUser == null)
                return RedirectToAction("Index", "Users");

            List<UserModel> selectedUsers = new List<UserModel>();
            foreach (int user in usr.SelectedUser)
            {
                UserModel usrMdl = db.Users.Find(user);
                selectedUsers.Add(usrMdl);
            }
            Session["SelectedUsers"] = selectedUsers;

            switch (usr.UserAction)
            {
                case "Use":
                    {
                        return RedirectToAction("Index", "Transactions");
                    }
                case "Delete":
                    {
                        return View("Delete", selectedUsers);
                    }
                case "Info":
                    {
                        return View("Details", selectedUsers);
                    }
                case "Edit":
                    {
                        return View("Edit", selectedUsers);
                    }
            }

            return View();
        }

        // GET: UserModels/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserModel userModel = db.Users.Find(id);
            if (userModel == null)
            {
                return HttpNotFound();
            }
            return View(userModel);
        }

        // GET: UserModels/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserModels/Create
        //[ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult Create([Bind(Include = "FirstName,LastName")] UserViewModel userViewModel)
        {
            if (ModelState.IsValid)
            {
                var userAdd = new UserModel();
                userAdd.FirstName = userViewModel.FirstName;
                userAdd.LastName = userViewModel.LastName;
                db.Users.Add(userAdd);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View();
        }

        // GET: UserModels/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserModel userModel = db.Users.Find(id);
            if (userModel == null)
            {
                return HttpNotFound();
            }
            return View(userModel);
        }

        // POST: UserModels/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,FirstName,LastName")] UserModel userModel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userModel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(userModel);
        }

        //// GET: UserModels/Delete/5
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    UserModel userModel = db.Users.Find(id);
        //    if (userModel == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(userModel);
        //}

        //// POST: UserModels/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    UserModel userModel = db.Users.Find(id);
        //    db.Users.Remove(userModel);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}

        //Post
        [HttpPost]
        public ActionResult DeleteUsers()
        {
            //
            if (!isSelectedUserListInit())
                return RedirectToAction("Index", "Users");

            List<UserModel> selectedUsers = new List<UserModel>();
            selectedUsers = Session["SelectedUsers"] as List<UserModel>;
            //Session["SelectedUsers"] = null; //Transaction Module Protection

            //Deleting corresponding transactions
            foreach (var user in selectedUsers)
            {
                var transQuery = from trans in db.Transactions
                                 where trans.User.ID == user.ID
                                 select trans;
                db.Transactions.RemoveRange(transQuery);
                var usrDel = db.Users.Find(user.ID);
                db.Users.Remove(usrDel);
            }
            db.SaveChanges();

            return RedirectToAction("Index", "Users");
        }

        //Post
        [HttpPost]
        public ActionResult UpdateUsers([Bind(Include = "FirstName,LastName")]string[] FirstName, string[] LastName)
        {
            //Session with selectedUsers check
            if (!isSelectedUserListInit())
                return RedirectToAction("Index", "Users");

            List<UserModel> selectedUsers = Session["SelectedUsers"] as List<UserModel>;
            for (int i = 0; i < selectedUsers.Count; i++)
            {
                UserModel usr = db.Users.Find(selectedUsers[i].ID);
                usr.FirstName = FirstName[i];
                usr.LastName = LastName[i];
                db.Entry(usr).State = EntityState.Modified;
            }

            db.SaveChanges();
            return RedirectToAction("Index", "Users");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool isSelectedUserListInit()
        {
            if (Session["SelectedUsers"] == null)
                return false;
            return true;
        }
    }
}
