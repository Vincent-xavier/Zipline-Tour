using Dapper;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
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
    public class EventRepository : ControllerBase, IEventRepository
    {
        private readonly IServerHandler _serverHandler;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public EventRepository(IServerHandler serverHandler, IWebHostEnvironment webHostEnvironment)
        {
            _serverHandler = serverHandler;
            _webHostEnvironment = webHostEnvironment;
        }

        #region Fetch Events
        public async Task<List<Result>> FetchEvents()
        {
            List<Result> objResult = new List<Result>();
            ListDateAndTime list = new ListDateAndTime();
            try
            {
                var Events = await _serverHandler.QueryMultipleAsync(_serverHandler.Connection, StoredProc.Event.FetchEvents, System.Data.CommandType.StoredProcedure);
                if (Events != null)
                {

                    list.listDate = (await Events.ReadAsync<DateModel>()).ToList();
                    list.listtime = (await Events.ReadAsync<TimeModel>()).ToList();

                    objResult = (from d in list.listDate
                                 select new Result
                                 {
                                     Date = d.Date,
                                     LstModal = (from lt in list.listtime
                                                 where lt.Date == d.Date
                                                 select new TimeModel
                                                 {
                                                     EventId = lt.EventId,
                                                     ScheduleId = lt.ScheduleId,
                                                     DateId = lt.DateId,
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
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.WriteErrorToText(ex);
            }

            return objResult;
        }
        #endregion

        public async Task<List<Result>> FetchEventsBySlotId(int SlotId)
        {
            List<Result> objResult = new List<Result>();
            ListDateAndTime list = new ListDateAndTime();
            var param = new DynamicParameters();
            try
            {
                param.Add("@pSlotId", SlotId, DbType.Int32, ParameterDirection.Input);
                var Events = await _serverHandler.QueryMultipleAsync(_serverHandler.Connection, StoredProc.Event.FetchEventForRoster, System.Data.CommandType.StoredProcedure, param);

                list.listDate = (await Events.ReadAsync<DateModel>()).ToList();
                list.listtime = (await Events.ReadAsync<TimeModel>()).ToList();

                objResult = (from d in list.listDate
                             select new Result
                             {
                                 Date = d.Date,
                                 LstModal = (from lt in list.listtime
                                             where lt.Date == d.Date
                                             select new TimeModel
                                             {
                                                 EventId = lt.EventId,
                                                 ScheduleId = lt.ScheduleId,
                                                 DateId = lt.DateId,
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
                log.WriteErrorToText(ex);
            }

            return objResult;
        }


        public async Task<TimeModel> EventById(int eventId)
        {
            var result = new TimeModel();
            try
            {
                var param = new DynamicParameters();
                param.Add("@id", eventId, DbType.Int32, ParameterDirection.Input);
                result = await _serverHandler.QueryFirstOrDefaultAsync<TimeModel>(_serverHandler.Connection, StoredProc.Event.EventById, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
            }
            return result;
        }

        public async Task<List<EventModel>> EventDetails()
        {
            var events = new List<EventModel>();
            try
            {
                events = (await _serverHandler.QueryAsync<EventModel>(_serverHandler.Connection, StoredProc.Event.EventDetails, CommandType.StoredProcedure)).ToList();
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
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
                result = await _serverHandler.QueryFirstOrDefaultAsync<EventModel>(_serverHandler.Connection, StoredProc.Event.EventDetailsById, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
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
                await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.Event.SaveEvent, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
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
            int scheduleId, Result = 0;

            try
            {

                param.Add("@pScheduleId", schedule.ScheduleId, DbType.Int32, ParameterDirection.Input);
                param.Add("@pName", schedule.Name, DbType.String, ParameterDirection.Input);
                param.Add("@pDateFrom", schedule.DateFrom, DbType.Date, ParameterDirection.Input);
                param.Add("@pDateTo", schedule.DateTo, DbType.Date, ParameterDirection.Input);
                param.Add("@pTimes", schedule.Times, DbType.String, ParameterDirection.Input);
                param.Add("@pEventId", schedule.EventId, DbType.Int32, ParameterDirection.Input);
                param.Add("@preturnVal", dbType: DbType.Int32, direction: ParameterDirection.Output);
                await _serverHandler.ExecuteScalarAsync<EventSchedule>(_serverHandler.Connection, StoredProc.Event.SaveEventSchedule, CommandType.StoredProcedure, param);
                scheduleId = param.Get<int>("@preturnVal");

                if (scheduleId > 0)
                {
                    await DeleteScheduleDate(schedule.EventId, scheduleId);

                    var DateIds = await SaveScheduleDate(schedule.DateFrom, schedule.DateTo, schedule.EventId, scheduleId);
                    Result = await SaveScheduleTimeSlot(schedule.Times, DateIds, schedule.EventId, scheduleId);
                }

            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
            }

            return Result;
        }

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
                    param1.Add("@singleDate", item, DbType.Date, ParameterDirection.Input);
                    param1.Add("@eid", EventId, DbType.Int32, ParameterDirection.Input);
                    param1.Add("@sId", scheduleId, DbType.Int32, ParameterDirection.Input);
                    param1.Add("@dateId", dbType: DbType.Int32, direction: ParameterDirection.Output);
                    await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.Event.GetDateId, CommandType.StoredProcedure, param1);
                    int DateId = param1.Get<int>("@dateId");
                    DateIds.Add(DateId);
                }

            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
            }

            return DateIds;
        }
        public async Task DeleteScheduleDate(int EventId, int scheduleId)
        {
            var param1 = new DynamicParameters();
            try
            {
                param1.Add("@i_eventId", EventId, DbType.Int32, ParameterDirection.Input);
                param1.Add("@i_scheduleId", scheduleId, DbType.Int32, ParameterDirection.Input);
                await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.Event.DeleteEventDates, CommandType.StoredProcedure, param1);
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
            }

        }
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

        #endregion

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
                        timeParam.Add("@returnval", dbType: DbType.Int32, direction: ParameterDirection.Output);
                        await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.Event.SaveTime, CommandType.StoredProcedure, timeParam);
                    }
                }
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);

            }

            return timeParam.Get<int>("@returnval");
        }

        #region Split Times
        public List<string> SplitTimes(string times)
        {

            var Times = times.Split(',').ToList();

            return Times;
        }
        #endregion

        #endregion

        #endregion

        public async Task<List<EventSchedule>> GetEventSchedule(int EventId)
        {
            List<EventSchedule> schedule = new List<EventSchedule>();
            try
            {
                var param = new DynamicParameters();
                param.Add("@id", EventId, DbType.Int32, ParameterDirection.Input);
                schedule = (await _serverHandler.QueryAsync<EventSchedule>(_serverHandler.Connection, StoredProc.Event.EventSchedule, CommandType.StoredProcedure, param)).ToList();
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
            }

            return schedule;
        }

        public async Task<EventSchedule> ScheduleById(int ScheduleId)
        {
            EventSchedule schedule = new EventSchedule();
            var param = new DynamicParameters();
            try
            {
                param.Add("@id", ScheduleId, DbType.Int32, ParameterDirection.Input);
                schedule = await _serverHandler.QueryFirstOrDefaultAsync<EventSchedule>(_serverHandler.Connection, StoredProc.Event.ScheduleById, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                var log = new ErrorLog();
                log.WriteErrorToText(ex);
            }
            return schedule;
        }
    }
}
