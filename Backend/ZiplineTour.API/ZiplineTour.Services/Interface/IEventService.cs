using System.Threading.Tasks;
using ZiplineTour.Models;
using ZiplineTour.Models.Input;

namespace ZiplineTour.Services.Interface
{
    public interface IEventService
    {
        Task<ResultArgs> FetchEvents();

        Task<ResultArgs> FetchEventsBySlotId(int SlotId);

        Task<ResultArgs> EventById(int eventId);

        Task<ResultArgs> EventDetails();

        Task<ResultArgs> EventDetailsById(int eventId);

        Task<ResultArgs> SaveEvent(EventModel eventModel);

        Task<ResultArgs> SaveEventSchedule(EventSchedule schedule);

        Task<ResultArgs> GetEventSchedule(int EventId);

        Task<ResultArgs> ScheduleById(int ScheduleId);
    }
}