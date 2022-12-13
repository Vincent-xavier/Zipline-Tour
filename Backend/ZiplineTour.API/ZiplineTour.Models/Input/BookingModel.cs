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
        public decimal Price { get; set; }
        public decimal TotalPrice { get; set; }
        public string EventTime { get; set; }
        public DateTime EventDate { get; set; }
        public string EventName { get; set; }
    }
       
    public class Payment
    {
        public int PaymentId { get; set; } = 0;
        public string PayerName { get; set; }
        public Int64 CardNumber { get; set; }
        public string ExpiryDate { get; set; }
        public Int16 Cvv { get; set; }
        public int BookingId { get; set; }
    }

}
