using System;
using System.Collections.Generic;
using System.Text;

namespace ZiplineTour.Models.Input
{
    public class BookingModel
    {
        public UserModel UserData { get; set; }
        public int BookingId { get; set; }
        public int UserId { get; set; }
        public int EventId { get; set; }
        public int ScheduleId { get; set; }
        public int DateId { get; set; }
        public int SlotId { get; set; }
        public int Guests { get; set; }
        public decimal TotalPrice { get; set; }
        public DateTime EventTime { get; set; }
        public DateTime EventDate { get; set; }
    }


}
