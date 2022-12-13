using System;
using System.Collections.Generic;
using System.Text;

namespace ZiplineTour.Common
{
    public class Constants
    {
    }
    public class StoredProc
    {
        public class User
        {
            public const string UserLogin = "usp_User_Login";
            public const string Users = "usp_User_GetUsers";

        }

        public class Event
        {
            public const string FetchEvents = "usp_Event_FetchEvents";
            public const string Events = "usp_Event_GetAllEvents";
            public const string EventById = "usp_Event_GetEventById";
            public const string EventDetails = "usp_Event_EventDetails";
            public const string EventDetailsById = "usp_Event_EventDetailsById";
            public const string SaveEvent = "usp_Event_SaveEvent";

            // Event Schedules
            public const string SaveEventSchedule = "usp_Event_SaveEventSchedule";
            public const string GetDateId = "usp_Event_SaveEventDates";
            public const string SaveTime = "usp_Event_SaveEventTimeSlot";
            public const string EventSchedule = "usp_Event_FetchScheduleDetails";
            public const string ScheduleById = "usp_Event_ScheduleById";
            public const string RemoveAlreadyExists = "usp_Event_RemoveScheduleDateAndTime";

        }

        public class Booking
        {
            public const string EventBooking = "usp_Booking_SaveEventBooking";
            public const string BookingDetails = "usp_Booking_BookingById";
            public const string FetchAll = "usp_Booking_FetchBookingDetails";
            public const string Payment = "usp_Booking_SavePayment";

        }


    }
}
