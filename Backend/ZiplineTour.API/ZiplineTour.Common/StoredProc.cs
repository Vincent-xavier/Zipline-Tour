namespace ZiplineTour.Framework
{
    public class StoredProc
    {
        public class User
        {
            public const string UserLogin = "zipline.zipline.usp_User_Login";
            public const string Users = "zipline.zipline.usp_User_GetUsers";
            public const string UserRights = "zipline.zipline.usp_User_UserRights";
        }

        public class Event
        {
            public const string FetchEvents = "zipline.usp_Event_FetchEvents";
            public const string Events = "zipline.usp_Event_GetAllEvents";
            public const string EventById = "zipline.usp_Event_GetEventById";
            public const string EventDetails = "zipline.usp_Event_EventDetails";
            public const string EventDetailsById = "zipline.usp_Event_EventDetailsById";
            public const string SaveEvent = "zipline.usp_Event_SaveEvent";
            public const string FetchEventForRoster = "zipline.usp_Event_FetchEventRosterView";

            // Event Schedules
            public const string SaveEventSchedule = "zipline.usp_Event_SaveEventSchedule";

            public const string GetDateId = "zipline.usp_Event_SaveEventDates";
            public const string SaveTime = "zipline.usp_Event_SaveEventTimeSlot";
            public const string EventSchedule = "zipline.usp_Event_FetchScheduleDetails";
            public const string ScheduleById = "zipline.usp_Event_ScheduleById";
            public const string DeleteEventDates = "zipline.usp_Event_DeleteEventDates";

            //testing
            public const string delete = "zipline.test_RemoveScheduleDateAndTime";
        }

        public class Booking
        {
            public const string EventBooking = "zipline.usp_Booking_SaveEventBooking";
            public const string BookingDetails = "zipline.usp_Booking_BookingById";
            public const string FetchAll = "zipline.usp_Booking_FetchBookingDetails";
            public const string BookingListBySlotId = "zipline.usp_Booking_FetchBookingListBySlotId";
            public const string Payment = "zipline.usp_Booking_SavePayment";
            public const string FetchOrders = "zipline.usp_Booking_FetchOrderList";
            public const string FetchOrderById = "zipline.usp_Booking_FetchOrderById";
        }
    }
}