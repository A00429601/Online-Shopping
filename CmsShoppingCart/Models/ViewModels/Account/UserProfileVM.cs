using CmsShoppingCart.Models.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CmsShoppingCart.Models.ViewModels.Account
{
    public class UserProfileVM
    {
        public UserProfileVM()
        {
        }

        public UserProfileVM(UserDTO row)
        {
            Id = row.Id;
            FirstName = row.FirstName;
            LastName = row.LastName;
            EmailAddress = row.EmailAddress;
            Username = row.Username;
            Password = row.Password;
            CardNumber = row.CardNumber;
            CardType = row.CardType;
            ExpireDate = row.ExpireDate;
            NameOnTheCard = row.NameOnTheCard;
            CVV = row.CVV;
        }

        //public int Id { get; set; }
        //[Required]
        //public string FirstName { get; set; }
        //[Required]
        //public string LastName { get; set; }
        //[Required]
        //[DataType(DataType.EmailAddress)]
        //public string EmailAddress { get; set; }
        //[Required]
        //public string Username { get; set; }
        //public string Password { get; set; }
        //public string ConfirmPassword { get; set; }
        public int Id { get; set; }
        [Required(ErrorMessage = "First name is required and no special Characters are allowed")]
        [RegularExpression(@"^[^<>.,?;:'()!~%\-_@#/*""\s]+$")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Last Name is required and no special Characters are allowed")]
        [RegularExpression(@"^[^<>.,?;:'()!~%\-_@#/*""\s]+$")]
        public string LastName { get; set; }
        [Required(ErrorMessage = "Email Address is required")]
        [DataType(DataType.EmailAddress)]
        public string EmailAddress { get; set; }
        [Required(ErrorMessage = "User Name is required and no special Characters are allowed")]
        [RegularExpression(@"^[^<>.,?;:'()!~%\-_@#/*""\s]+$")]
        public string Username { get; set; }
        [Required(ErrorMessage = "Card Type is required")]
        public string CardType { get; set; }
        [Required(ErrorMessage = "Card Number is required and no special Characters are allowed")]
        [RegularExpression(@"^[^<>.,?;:'()!~%\-_@#/*""\s]+$")]
        public string CardNumber { get; set; }
        [Required(ErrorMessage = "Name on the card is required and no special Characters are allowed")]
        [RegularExpression(@"^[^<>.,?;:'()!~%\-_@#/*""\s]+$")]
        public string NameOnTheCard { get; set; }
        [Required(ErrorMessage = "Expire Date is required")]
        public string ExpireDate { get; set; }
        [Required(ErrorMessage = "CVV is required and no special Characters are allowed")]
        [RegularExpression(@"^[^<>.,?;:'()!~%\-_@#/*""\s]+$")]
        public string CVV { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
    }

    public enum CardTypeList
    {
        MasterCard,
        Visa,
        AmericanExpress
    }
}