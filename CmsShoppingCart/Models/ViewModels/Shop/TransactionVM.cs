using CmsShoppingCart.Models.Data;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CmsShoppingCart.Models.ViewModels.Shop
{
    public class TransactionVM
    {
        public TransactionVM()
        {
        }

        public TransactionVM(TransactionDTO row)
        {
            TransactionId = row.TransactionId;
            NameOnTheCard = row.NameOnTheCard;
            ExpireDate = row.ExpireDate;
            CreditCardNumber = row.CreditCardNumber;
            CVV = row.CVV;
        }

        public int TransactionId { get; set; }
        [Required]
        public String NameOnTheCard { get; set; }
        [Required]
        public String ExpireDate { get; set; }
        [Required]
        public String CreditCardNumber { get; set; }
        [Required]
        public int CVV { get; set; }
        
    }
}