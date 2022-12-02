using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using ZiplineTour.DBEngine;
using ZiplineTour.Models.Input;
using ZiplineTour.Services;

namespace ZiplineTour.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    //[Authorize(Roles ="Admin")]
    //[Authorize(Roles ="User")]
    public class EventController : ControllerBase
    {
        private readonly IEventService _eventService;
        public EventController(IEventService eventService, IServerHandler serverHandler)
        {
            _eventService = eventService;
        }

        [HttpGet]
        [Route("fetchEvent")]
        public async Task<IActionResult> FetchEvent()
        {
            var events = await _eventService.FetchEvents();

            if (events.StatusCode == 200)
            {
                return Ok(events);
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpGet("eventById/{eventId}")]
        public async Task<IActionResult> EventById(int eventId)
        {
            return Ok(await _eventService.EventById(eventId));
        }

        [HttpGet]
        [Route("eventDetails")]
        public async Task<IActionResult> EventDetails()
        {
            var events = await _eventService.EventDetails();


            if (events.StatusCode == 200)
            {
                return Ok(events);
            }
            else
            {
                return BadRequest();
            }
        }

        [HttpGet("eventDetailsById/{eventId}")]
        public async Task<IActionResult> EventDetailsById(int eventId)
        {
            return Ok(await _eventService.EventDetailsById(eventId));
        }

        [HttpPost]
        [Route("saveEvent")]
        public async Task<IActionResult> SaveEvent([FromForm] EventModel eventModel)
        {
            return Ok(await _eventService.SaveEvent(eventModel));
        }

        [HttpPost]
        [Route("saveSchedule")]
        public async Task<IActionResult> SaveEventSchedule(EventSchedule schedule)
        {
            return Ok(await _eventService.SaveEventSchedule(schedule));
        }

        [HttpGet("getSchedules/{EventId}")]
        public async Task<IActionResult> GetScheduleDetails(int EventId)
        {
            var Schedule = await _eventService.GetEventSchedule(EventId);

            if (Schedule == null)
            {
                return BadRequest();
            }
            else if (Schedule != null && Schedule.StatusCode == 200)
            {
                return Ok(Schedule);
            }
            return BadRequest();

        }

        [HttpGet("getScheduleById/{ScheduleId}")]
        public async Task<IActionResult> ScheduleById(int ScheduleId)
        {
            var Schedule = await _eventService.ScheduleById(ScheduleId);

            if (Schedule == null)
            {
                return BadRequest();
            }
            else if (Schedule != null && Schedule.StatusCode == 200)
            {
                return Ok(Schedule);
            }
            return BadRequest();

        }

    }
}
