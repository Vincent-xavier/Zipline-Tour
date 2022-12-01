using Dapper;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using ZiplineTour.Common;
using ZiplineTour.DBEngine;
using ZiplineTour.Models.Input;

namespace ZiplineTour.Repository
{
    public interface IEventRepository
    {

        Task<DisplayEvent> EventById(int eventId);

        Task<List<EventModel>> EventDetails();

        Task<EventModel> EventDetailsById(int eventId);

        Task<int> SaveEvent(EventModel eventModel);

        Task<int> SaveEventSchedule(EventSchedule schedule);

        Task<List<EventSchedule>> GetEventSchedule(int EventId);

        Task<EventSchedule> ScheduleById(int ScheduleId);
    }
    public class EventRepository : ControllerBase, IEventRepository
    {
        private readonly IServerHandler _serverHandler;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public EventRepository(IConfiguration configuration, IServerHandler serverHandler, IWebHostEnvironment webHostEnvironment)
        {
            _serverHandler = serverHandler;
            _webHostEnvironment = webHostEnvironment;
        }

        public async Task<DisplayEvent> EventById(int eventId)
        {
            var result = new DisplayEvent();
            try
            {
                var param = new DynamicParameters();
                param.Add("@id", eventId, DbType.Int32, ParameterDirection.Input);
                result = await _serverHandler.QueryFirstOrDefaultAsync<DisplayEvent>(_serverHandler.Connection, StoredProc.EventById, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.SendErrorToText(ex);
            }
            return result;
        }

        public async Task<List<EventModel>> EventDetails()
        {
            var events = new List<EventModel>();
            try
            {
                events = (await _serverHandler.QueryAsync<EventModel>(_serverHandler.Connection, StoredProc.EventDetails, CommandType.StoredProcedure)).ToList();
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.SendErrorToText(ex);
            }
            return events;
        }

        public async Task<EventModel> EventDetailsById(int eventId)
        {
            var result = new EventModel();
            try
            {
                var param = new DynamicParameters();
                param.Add("@eId", eventId, DbType.Int32, ParameterDirection.Input);
                result = await _serverHandler.QueryFirstOrDefaultAsync<EventModel>(_serverHandler.Connection, StoredProc.EventDetailsById, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.SendErrorToText(ex);
            }
            return result;
        }

        #region Save Event
        public async Task<int> SaveEvent(EventModel eventModel)
        {
            var param = new DynamicParameters();
            string EventImage = string.Empty;
            try
            {
                if (eventModel.ImgFile != null)
                {
                     // upload Image and get Image Name
                    EventImage = await UploadEventImage(eventModel.ImgFile);
                }
                else
                {
                    EventImage = eventModel.EventImage;
                }
                param.Add("@eId", eventModel.EventId, DbType.Int32, ParameterDirection.Input);
                param.Add("@eName", eventModel.EventName, DbType.String, ParameterDirection.Input);
                param.Add("@eDiscri", eventModel.EventDiscription, DbType.String, ParameterDirection.Input);
                param.Add("@e_price", eventModel.Price, DbType.Decimal, ParameterDirection.Input);
                param.Add("@eCapacity", eventModel.EventCapacity, DbType.Int32, ParameterDirection.Input);
                param.Add("@maxBook", eventModel.Max_Booking, DbType.Int32, ParameterDirection.Input);
                param.Add("@minBook", eventModel.Min_Booking, DbType.Int32, ParameterDirection.Input);
                param.Add("@eImg", EventImage, DbType.String, ParameterDirection.Input);
                param.Add("@returnVal", dbType: DbType.Int32, direction: ParameterDirection.Output);
                await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.SaveEvent, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.SendErrorToText(ex);
            }
            return param.Get<int>("@returnVal");
        }

        #region Upload Image
        public async Task<string> UploadEventImage(IFormFile ImageFile)
        {
            try
            {
                if (ImageFile != null)
                {
                    string ImageName = new String(Path.GetFileNameWithoutExtension(ImageFile.FileName).Take(10).ToArray()).Replace(' ', '-');
                    ImageName = ImageName + DateTime.Now.ToString("yymmssfff") + Path.GetExtension(ImageFile.FileName);
                    var ImagePath = Path.Combine(_webHostEnvironment.ContentRootPath, "wwwroot", "EventImage", ImageName);

                    var fileInfo = new FileInfo(ImageName);

                    using (var fileStream = new FileStream(ImagePath, FileMode.Create))
                    {

                        await ImageFile.CopyToAsync(fileStream);
                    }
                    return ImageName;
                }
                else
                {
                    return "Failed";
                }
            }
            catch (Exception ex)
            {
                return ex.Message.ToString();
            }
        }

        #endregion
        #endregion

        #region Save Event Schedule
        public async Task<int> SaveEventSchedule(EventSchedule schedule)
        {

            var param = new DynamicParameters();
            int scheduleId;

            try
            {
                param.Add("@ScheduleId", schedule.ScheduleId, DbType.Int32, ParameterDirection.Input);
                param.Add("@Name", schedule.Name, DbType.String, ParameterDirection.Input);
                param.Add("@DateFrom", schedule.DateFrom, DbType.Date, ParameterDirection.Input);
                param.Add("@DateTo", schedule.DateTo, DbType.Date, ParameterDirection.Input);
                param.Add("@Times", schedule.Times, DbType.String, ParameterDirection.Input);
                param.Add("@EventId", schedule.EventId, DbType.Int32, ParameterDirection.Input);
                param.Add("@returnVal", dbType: DbType.Int32, direction: ParameterDirection.Output);
                await _serverHandler.ExecuteScalarAsync<EventSchedule>(_serverHandler.Connection, StoredProc.SaveEventSchedule, CommandType.StoredProcedure, param);
                scheduleId = param.Get<int>("@returnVal");
                if (scheduleId > 0)
                {
                    var DateIds = await SaveScheduleDate(schedule.DateFrom, schedule.DateTo, schedule.EventId, scheduleId);
                    int Result = await SaveScheduleTimeSlot(schedule.Times, DateIds, schedule.EventId, scheduleId);
                    return Result;
                }

            }
            catch (Exception ex)
            {

                var log = new ErrorLog();
                log.SendErrorToText(ex);
            }

            return 0;
        }

        #region Save Schedule Time Slots
        public async Task<int> SaveScheduleTimeSlot(string times, List<int> DateIds, int EventId, int scheduleId)
        {
            var Times = SplitTimes(times);
            var timeParam = new DynamicParameters();

            try
            {
                foreach (var dateid in DateIds)
                {

                    foreach (var time in Times)
                    {
                        timeParam.Add("@ScheduleTime", time, DbType.String, ParameterDirection.Input);
                        timeParam.Add("@eId", EventId, DbType.Int32, ParameterDirection.Input);
                        timeParam.Add("@sId", scheduleId, DbType.Int32, ParameterDirection.Input);
                        timeParam.Add("@dId", dateid, DbType.Int32, ParameterDirection.Input);
                        await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.SaveTime, CommandType.StoredProcedure, timeParam);
                    }

                }
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.SendErrorToText(ex);

            }
            return 1;
        }
        #endregion

        #region Save Schedule Date
        public async Task<List<int>> SaveScheduleDate(DateTime DateFrom, DateTime DateTo, int EventId, int scheduleId)
        {
            var dates = GetDates(DateFrom, DateTo);
            var DateIds = new List<int>();
            var param1 = new DynamicParameters();

            try
            {
                foreach (var item in dates)
                {
                    param1.Add("@singleDate", item, DbType.DateTime, ParameterDirection.Input);
                    param1.Add("@eid", EventId, DbType.Int32, ParameterDirection.Input);
                    param1.Add("@sId", scheduleId, DbType.Int32, ParameterDirection.Input);
                    param1.Add("@dateId", dbType: DbType.Int32, direction: ParameterDirection.Output);
                    await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.GetDateId, CommandType.StoredProcedure, param1);
                    int DateId = param1.Get<int>("@dateId");
                    DateIds.Add(DateId);
                }

            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.SendErrorToText(ex);

            }

            return DateIds;
        }

        #endregion

        #region Get Dates
        public Array GetDates(DateTime start, DateTime end)
        {
            var dates = new List<DateTime>();

            for (DateTime date = start; date <= end; date = date.AddDays(1))
            {
                dates.Add(date);
            }

            return dates.ToArray();
        }
        #endregion

        #region Split Times
        public List<string> SplitTimes(string times)
        {

            var Times = times.Split(',').ToList();

            return Times;
        }
        #endregion

        #endregion

        public async Task<List<EventSchedule>> GetEventSchedule(int EventId)
        {
            var schedule = new EventSchedule();
            var param = new DynamicParameters();
            param.Add("@id", EventId, DbType.Int32, ParameterDirection.Input);
            return (await _serverHandler.QueryAsync<EventSchedule>(_serverHandler.Connection, StoredProc.EventSchedule, CommandType.StoredProcedure, param)).ToList();

        }

        public async Task<EventSchedule> ScheduleById(int ScheduleId)
        {
            var schedule = new EventSchedule();
            var param = new DynamicParameters();
            param.Add("@id", ScheduleId, DbType.Int32, ParameterDirection.Input);
            return await _serverHandler.QueryFirstOrDefaultAsync<EventSchedule>(_serverHandler.Connection, StoredProc.ScheduleById, CommandType.StoredProcedure, param);

        }
    }
}
