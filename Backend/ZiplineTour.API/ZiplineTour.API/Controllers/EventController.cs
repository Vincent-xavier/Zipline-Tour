using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZiplineTour.Common;
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
        private readonly IServerHandler _serverHandler;
        public EventController(IEventService eventService, IServerHandler serverHandler)
        {
            _eventService = eventService;
            _serverHandler = serverHandler;
        }


        [HttpGet]
        [Route("fetchEvent")]
        public async Task<IActionResult> FetchEvent()
        {
            List<Result> objResult = new List<Result>();
            try
            {
                var list = new ListDateAndTime();
                var Events = await _serverHandler.QueryMultipleAsync(_serverHandler.Connection, StoredProc.FetchEvents, System.Data.CommandType.StoredProcedure);

                list.listDate = (await Events.ReadAsync<DateModel>()).ToList();
                list.listtime = (await Events.ReadAsync<timeModel>()).ToList();

                objResult = (from d in list.listDate
                             select new Result
                             {
                                 Date = d.Date,
                                 LstModal = (from lt in list.listtime
                                             where lt.Date == d.Date
                                             select new timeModel
                                             {
                                                 SlotId = lt.SlotId,
                                                 EventName = lt.EventName,
                                                 Price = lt.Price,
                                                 Time = lt.Time,
                                                 Date = lt.Date,
                                                 EventCapacity = lt.EventCapacity,
                                                 Min_Booking = lt.Min_Booking,
                                                 Max_Booking = lt.Max_Booking,
                                                 EventImage = lt.EventImage,
                                                 Bookings = lt.Bookings,
                                                 Available = lt.Available
                                             }).ToList()

                             }).ToList();
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.SendErrorToText(ex);
            }

            return Ok(objResult);
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
