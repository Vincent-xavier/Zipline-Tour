using System;
using System.Collections.Generic;
using System.Text;
using ZiplineTour.Models.Input;

namespace ZiplineTour.Models.Output
{
    public class EventResult
    {
        public List<EventModel> ListeventModels { get; set; }
        public List<EventSchedule> ListeventSchedules { get; set; }
        public List<EventScheduleDate> ListeventScheduleDates { get; set; }
        public List<EventScheduleTimeSlots> ListeventScheduleTimeSlots { get; set; }
    }
}
