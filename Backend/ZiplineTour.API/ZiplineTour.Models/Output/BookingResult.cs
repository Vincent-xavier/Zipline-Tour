using System;
using System.Collections.Generic;
using System.Text;
using ZiplineTour.Models.Input;

namespace ZiplineTour.Models.Output
{
   public class BookingResult
    {
        public List<BookingModel> listBooking  { get; set; }
        public List<UserModel> listUser  { get; set; }

    }
}
