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
            List<UserModel> selectedUsers = new List<UserModel>();
            foreach (int user in usr.SelectedUser)
            {
                UserModel usrMdl = db.Users.Find(user);
                selectedUsers.Add(usrMdl);
            }

            switch (usr.UserAction)
            {
                case "Use":
                    {
                        Session["SelectedUsers"] = selectedUsers;
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
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
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

        // GET: UserModels/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: UserModels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            UserModel userModel = db.Users.Find(id);
            db.Users.Remove(userModel);
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
