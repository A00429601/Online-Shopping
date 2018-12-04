using CmsShoppingCart.Models.Data;
using CmsShoppingCart.Models.ViewModels.Account;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace CmsShoppingCart.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return Redirect("~/account/login");
        }
       
        // GET: /Account/login
        [HttpGet]
        public ActionResult Login()
        {
            //Confirm user is not logged in
            string username = User.Identity.Name;

            if (!string.IsNullOrEmpty(username))
                return RedirectToAction("user-profile");

            //Return View
            return View();
        }


        // POST: /Account/login
        [HttpPost]
        public ActionResult Login(LoginUserVM model)
        {
            //Check model state
            if(!ModelState.IsValid)
            {
                return View(model);
            }

            //Check if the user is valid
            bool isValid = false;
            using (Db db = new Db())
            {
                if (db.Users.Any(x=> x.Username.Equals(model.Username)&& x.Password.Equals(model.Password)))
                {
                    isValid = true;

                }
            }
            if(!isValid)
            {
                ModelState.AddModelError("", "Invalid Username or password.");
                return View(model);
            }
            else
            {
                FormsAuthentication.SetAuthCookie(model.Username, model.RememberMe);
                return Redirect(FormsAuthentication.GetRedirectUrl(model.Username, model.RememberMe));
            }
            //

        }
        // GET: /Account/create-account
        [ActionName("CreateAccount")]
        [HttpGet]
        public ActionResult CreateAccount()
        {
            return View("CreateAccount");
        }
        // Post: /Account/create-account
        [ActionName("CreateAccount")]
        [HttpPost]
        public ActionResult CreateAccount(UserVM model)
        {
           //check model state
           if(!ModelState.IsValid)
            {
                return View("CreateAccount", model);

            }

            //check if psswords match
            if(!model.Password.Equals(model.ConfirmPassword))
            {
                ModelState.AddModelError("", "PAsswords do not match");
                return View("CreateAccount", model);

            }

            using (Db db = new Db())
            {

                if (db.Users.Any(x=>x.Username.Equals(model.Username)))
                {
                    ModelState.AddModelError("", "Username" + model.Username +"is taken.");
                    model.Username = "";
                    return View("CreateAccount", model);
                }
                //Make sure username is unique

                //create userDTO
                UserDTO userDTO = new UserDTO()
                {
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    EmailAddress = model.EmailAddress,
                    Username = model.Username,
                    Password = model.Password


                };


                //Add DTO
                db.Users.Add(userDTO);

                //Save
                db.SaveChanges();

                //Add to UserRolesDTO
                int id = userDTO.Id;
                UserRoleDTO userRolesDTO = new UserRoleDTO()
                {
                    UserId = id,
                    RoleId =  2
                };

                db.UserRoles.Add(userRolesDTO);
                db.SaveChanges();

            }
            //Cretate a TempData message
            TempData["SM"] = "You are now registered and can login";

            //Redirect
            return Redirect("~/account/login");

        }

        //Get: /account/logout
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return Redirect("~/account/login");
    

        }

      
        public ActionResult UserNavPartial()
        {

            //Get username
            string username = User.Identity.Name;

            //Declare model
            UserNavPartialVM model;

            using (Db db = new Db())
                {
                //Get the user

                UserDTO dto = db.Users.FirstOrDefault(x => x.Username == username);

                //Build the Model
                model = new UserNavPartialVM()
                {
                    FirstName=dto.FirstName,
                    LasttName=dto.LastName,


                };


            }




            //Return partial View with model
            return PartialView(model);





        }

        [HttpGet]
        [ActionName("user-profile")]
        public ActionResult UserProfile ()
        {
            //Get Username
            string username = User.Identity.Name;


            //Declare model
            UserNavPartialVM model;

            using (Db db = new Db())
            {
                //Get user

                UserDTO dto = db.Users.FirstOrDefault(x => x.Username == username);
                //Build model
                model = new UserProfileVM(dto);
            }




            // Return View with model

            return View("UserProfile", model);

        }

        //POST : /account/user-profile
        [HttpPost]
        [ActionName("user-profile")]
        public ActionResult UserProfile(UserProfileVM model)
        {
            //Check model state

            if (!ModelState.IsValid)
            {
                return View("UserProfile", model);

            }
            //check if passwords match if need be

            if (!string.IsNullOrWhiteSpace(model.Password))
            {
                if(!model.Password.Equals(model.ConfirmPassword))
                {
                    ModelState.AddModelError("", "Passwords do not match");
                    return View("UserProfile", model);

                }
            }


            using (Db db = new Db())
            {


                //Get username
                string username = User.Identity.Name;
                //Make sure Username is unique
                if (db.Users.Where(x=>x.Id != model.Id).Any(x=>x.Username == username))
                {
                    ModelState.AddModelError("", "Username" +model.Username +"alreasy exists");
                    model.Username = "";
                    return View("UserProfile", model);
                }

                //Edit DTO
                UserDTO dto = db.Users.Find(model.Id);

                dto.FirstName = model.FirstName;
                dto.LastName = model.LastName;
                dto.EmailAddress = model.EmailAddress;
                dto.Username = model.Username;

                if (!string.IsNullOrWhiteSpace(model.Password))
                {
                    dto.Password = model.Password;
                }


                //Save
                db.SaveChanges();
            }
            //Set TempData message
            TempData["SM"] = "You have edited your profile.";


                //Redirect
                return Redirect("~/account/user-profile");

        }
    }
}