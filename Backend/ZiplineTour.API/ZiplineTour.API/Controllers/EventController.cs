using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using ZiplineTour.Models.Input;
using ZiplineTour.Models.Output;
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


        public EventController(IEventService eventService)
        {
            _eventService = eventService;
        }

        [HttpGet]
        [Route("events")]
        public async Task<IActionResult> Events()
        {
            return Ok(await _eventService.Events());
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
    }
}
