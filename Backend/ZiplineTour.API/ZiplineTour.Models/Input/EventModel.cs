using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;

namespace ZiplineTour.Models.Input
{
    public class EventModel
    {
        public int EventId { get; set; } = 0;
        public string EventName { get; set; }
        public string EventDiscription { get; set; }
        public int EventCapacity { get; set; }
        public decimal Price { get; set; }
        public int Min_Booking { get; set; }
        public int Max_Booking { get; set; }
        public string EventImage { get; set; } = "";
        public IFormFile ImgFile { get; set; }
    }

    public class EventSchedule
    {
        public int EventId { get; set; }
        public int ScheduleId { get; set; }
        public string Name { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public string Times { get; set; }
    }

    public class EventScheduleDate
    {
        public int DateId { get; set; }
        public DateTime Date { get; set; }
        public int EventId { get; set; }
        public int ScheduleId { get; set; }
        public bool IsDeleted { get; set; }
    }

    public class EventScheduleTimeSlots
    {
        public int SlotId { get; set; }
        public DateTime Time { get; set; }
        public int EventCapacity { get; set; }
        public bool IsDeleted { get; set; }
        public int EventId { get; set; }
        public int ScheduleId { get; set; }
        public int DateId { get; set; }
    }

    public class TimeModel
    {
        public int EventId { get; set; }
        public string EventName { get; set; }
        public decimal Price { get; set; }
        public DateTime Date { get; set; }
        public string Time { get; set; }
        public int Min_Booking { get; set; }
        public int Max_Booking { get; set; }
        public string EventImage { get; set; }
        public string EventDiscription { get; set; }
        public int EventCapacity { get; set; }
        public int Bookings { get; set; }
        public int Available { get; set; }
        public int ScheduleId { get; set; }
        public int DateId { get; set; }
        public int SlotId { get; set; }
    }

    public class DateModel
    {
        public int DateId { get; set; }
        public DateTime Date { get; set; }
    }

    public class ListDateAndTime
    {
        public List<DateModel> listDate { get; set; }
        public List<TimeModel> listtime { get; set; }
    }

    public class Result
    {
        public DateTime Date { get; set; }
        public List<TimeModel> LstModal { get; set; }
    }
}