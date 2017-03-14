using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;

namespace Hellofrom.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Random coin = new Random();

            int cointoss = coin.Next(0, 9);

            switch (cointoss)
            {
                case 0:
                    // I have a bug where the page is slow....
                    Thread.Sleep(2000);
                    break;
                case 1:
                    // I have a bug where the page is slow....
                    Thread.Sleep(2000);
                    break;
                case 2:
                    // I have a bug where the page is slow....
                    Thread.Sleep(2000);
                    break;
                case 3:
                    // I have a bug where the page throws 500
                    throw new Exception("Cointoss = " + cointoss);
                    break;
                case 4:
                    // I have a bug where the page throws 500
                    throw new Exception("Cointoss = 1" + cointoss);
                    break;

                default:
                    //if the value is >= 5 then tere is no bug :)
                    break;
            }



            return View();
        }
    }
}