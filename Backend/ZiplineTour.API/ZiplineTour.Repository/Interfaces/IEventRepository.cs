using System.Collections.Generic;
using System.Threading.Tasks;
using ZiplineTour.Models.Input;

namespace ZiplineTour.Repository.Interfaces
{
    public interface IEventRepository
    {
        Task<List<Result>> FetchEvents();

        Task<List<Result>> FetchEventsBySlotId(int SlotId);

        Task<TimeModel> EventById(int eventId);

        Task<List<EventModel>> EventDetails();

        Task<EventModel> EventDetailsById(int eventId);

        Task<int> SaveEvent(EventModel eventModel);

        Task<int> SaveEventSchedule(EventSchedule schedule);

        Task<List<EventSchedule>> GetEventSchedule(int EventId);

        Task<EventSchedule> ScheduleById(int ScheduleId);
    }
}