using System;
using System.Collections.Generic;
using System.Text;

namespace ZiplineTour.Common
{
   public class Constants
    {
    }
    public class  StoredProc
    {
        // Users
        //public const string UserLogin = "usp_User_Login";
        //public const string Users = "usp_User_GetUsers";

        //public const string TestEvents = "test_MultipleTable";

        //// Events
        ////public const string TestEvents = "testing_returnobj";
        //public const string Events = "usp_Event_GetEvents";
        //public const string EventById = "usp_Event_GetEventById";
        //public const string EventDetails = "usp_Event_EventDetails";
        //public const string EventDetailsById = "usp_Event_EventDetailsById";
        //public const string SaveEvent = "usp_Event_SaveEvent";


        //// Event Schedules
        //public const string SaveEventSchedule = "usp_Event_SaveEventSchedule";
        //public const string GetDateId = "usp_Event_SaveEventDates";
        //public const string SaveTime = "test_SaveTimeSolt";

        //// Booking
        //public const string EventBooking = "usp_Booking_SaveEventBooking";



        // Users
        public const string UserLogin = "login";
        public const string Users = "getUser";


        // Events
        public const string AllEvents = "getallevents";
        public const string Events = "getevents";
        public const string EventById = "geteventId";
        public const string EventDetails = "eventDetails";
        public const string EventDetailsById = "eventdetailsId";
        public const string SaveEvent = "Saveevent";
        public const string TestEvents = "test_MultipleTable";

        // Event Schedules
        public const string SaveEventSchedule = "saveEventschedule";
        public const string GetDateId = "saveEventdates";
        public const string SaveTime = "saveTimeslot";
        public const string EventSchedule = "getScheduledetails";
        public const string ScheduleById = "GetScheduleById";

        // Booking
        public const string EventBooking = "saveeventbooking";
        public const string BookingDetails = "bookingdetailsId";
        public const string FetchAll = "Bookingdetails";

    }
}
