using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CmsShoppingCart.Models.Data;

namespace CmsShoppingCart.Controllers
{
    public class TransactionController : Controller
    {           // GET: Transaction
        
        public ActionResult Index()
        {
            return Redirect("~/account/login");
        }
    }
}