using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CmsShoppingCart.Models.ViewModels.Account
{
    public class UserNavPartialVM
    {
        public string FirstName{ get; set; }
        public string LasttName { get; set; }

        public static implicit operator UserNavPartialVM(UserProfileVM v)
        {
            throw new NotImplementedException();
        }
    }
}