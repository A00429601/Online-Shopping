using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace CmsShoppingCart.Models.Data
{
    [Table("tblTransaction")]
    public class TransactionDTO
    {
        [Key]
        public int TransactionId { get; set; }
        public String NameOnTheCard { get; set; }
        public String ExpireDate { get; set; }
        public String CreditCardNumber { get; set; }
        public int CVV { get; set; }
    }
}