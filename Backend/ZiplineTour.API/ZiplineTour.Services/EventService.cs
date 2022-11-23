using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading.Tasks;
using ZiplineTour.Models;
using ZiplineTour.Models.Input;
using ZiplineTour.Repository;

namespace ZiplineTour.Services
{
    public interface IEventService
    {
        Task<ResultArgs> Events();
        Task<ResultArgs> EventById(int eventId);
        Task<ResultArgs> EventDetails();
        Task<ResultArgs> EventDetailsById(int eventId);

        Task<ResultArgs> SaveEvent(EventModel eventModel);
        Task<ResultArgs> SaveEventSchedule(EventSchedule schedule);
    }
    public class EventService : IEventService
    {
        private readonly IEventRepository _eventRepository;
        public EventService(IEventRepository eventRepository)
        {
            _eventRepository = eventRepository;
        }

        public async Task<ResultArgs> Events()
        {
            ResultArgs args = new ResultArgs();

            var events = await _eventRepository.Events();

            if (events != null)
            {
                args.StatusCode = 200;
                args.StatusMessage = "success";
                args.ResultData = events;
            }
            else
            {
                args.StatusCode = 201;
                args.StatusMessage = "error";
                args.ResultData = null;
            }

            return args;
        }
        public async Task<ResultArgs> EventById(int eventId)
        {
            ResultArgs args = new ResultArgs();

            var events = await _eventRepository.EventById(eventId);

            if (events != null)
            {
                args.StatusCode = 200;
                args.StatusMessage = "success";
                args.ResultData = events;
            }
            else
            {
                args.StatusCode = 201;
                args.StatusMessage = "error";
                args.ResultData = null;
            }

            return args;
        }

        public async Task<ResultArgs> EventDetails()
        {
            var args = new ResultArgs();
            var events = await _eventRepository.EventDetails();

            if (events != null)
            {
                args.StatusCode = 200;
                args.StatusMessage = "success";
                args.ResultData = events;
            }else
            {
                args.StatusCode = 404;
                args.StatusMessage = "error";
            }    

            return args;
        }

        public async Task<ResultArgs> EventDetailsById(int eventId)
        {
            ResultArgs args = new ResultArgs();

            var events = await _eventRepository.EventDetailsById(eventId);

            if (events != null)
            {
                args.StatusCode = 200;
                args.StatusMessage = "success";
                args.ResultData = events;
            }
            else
            {
                args.StatusCode = 201;
                args.StatusMessage = "error";
                args.ResultData = null;
            }

            return args;
        }

        public async Task<ResultArgs> SaveEvent(EventModel eventModel)
        {
            var args = new ResultArgs();
            var result = await _eventRepository.SaveEvent(eventModel);

            if (result != 0)
            {
                args.StatusCode = 200;
                args.StatusMessage = "Saved Successfully";
            }
            else
            {
                args.StatusCode = 202;
                args.StatusMessage = "Error";
            }

            return args;
        }

        public async Task<ResultArgs> SaveEventSchedule(EventSchedule schedule)
        {
            var args = new ResultArgs();
            int Success = 1;

            int result = await _eventRepository.SaveEventSchedule(schedule);

            if (result == Success)
            {
                args.StatusCode = 200;
                args.StatusMessage = "Saved Successfully";
            }

            return args;
        }

    }
}
