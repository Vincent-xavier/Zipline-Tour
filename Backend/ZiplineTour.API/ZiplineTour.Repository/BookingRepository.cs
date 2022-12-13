using System;
using Dapper;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using ZiplineTour.Common;
using ZiplineTour.DBEngine;
using ZiplineTour.Models;
using ZiplineTour.Models.Input;
using ZiplineTour.Models.Output;
using System.Collections.Generic;

namespace ZiplineTour.Repository
{
    public interface IBookingRepository
    {
        Task<List<BookingModel>> FetchBooking();
        Task<BookingResult> SaveEventBooking(BookingModel bookingModel);
        Task<BookingResult> BookingDetailsById(int id);
        Task<int> Payment(Payment pay);
    }
    public class BookingRepository : IBookingRepository
    {
        private readonly IServerHandler _serverHandler;

        public BookingRepository(IServerHandler serverHandler)
        {
            _serverHandler = serverHandler;
        }

        #region Save Event Booking Details
        public async Task<BookingResult> SaveEventBooking(BookingModel bookingModel)
        {
            DynamicParameters param = new DynamicParameters();
            BookingResult result = new BookingResult();
            int BookingId;
            try
            {
                param.Add("@firstname", bookingModel.UserData.FirstName, DbType.String, ParameterDirection.Input);
                param.Add("@lastname", bookingModel.UserData.LastName, DbType.String, ParameterDirection.Input);
                param.Add("@email", bookingModel.UserData.Email, DbType.String, ParameterDirection.Input);
                param.Add("@phone", bookingModel.UserData.Phone, DbType.String, ParameterDirection.Input);
                param.Add("@eventid", bookingModel.EventId, DbType.Int32, ParameterDirection.Input);
                param.Add("@scheduleid", bookingModel.ScheduleId, DbType.Int32, ParameterDirection.Input);
                param.Add("@dateid", bookingModel.DateId, DbType.Int32, ParameterDirection.Input);
                param.Add("@slotid", bookingModel.SlotId, DbType.Int32, ParameterDirection.Input);
                param.Add("@guest", bookingModel.Guests, DbType.Int32, ParameterDirection.Input);
                param.Add("@totalprice", bookingModel.TotalPrice, DbType.Decimal, ParameterDirection.Input);
                param.Add("@eventtime", bookingModel.EventTime, DbType.String, ParameterDirection.Input);
                param.Add("@eventdate", bookingModel.EventDate, DbType.Date, ParameterDirection.Input);
                param.Add("@returnVal", dbType: DbType.Int32, direction: ParameterDirection.Output);
                await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.Booking.EventBooking, CommandType.StoredProcedure, param);
                BookingId = param.Get<int>("@returnVal");
                result = await BookingDetailsById(BookingId);
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.WriteErrorToText(ex);

            }
            return result;
        }
        #endregion

        #region Fetching All Booking Details

        public async Task<List<BookingModel>> FetchBooking()
        {
            List<BookingModel> bookings = new List<BookingModel>();

            try
            {
                bookings = (await _serverHandler.QueryAsync<BookingModel>(_serverHandler.Connection, StoredProc.Booking.FetchAll, CommandType.StoredProcedure, null)).ToList();
            }
            catch (Exception ex)
            {

                ErrorLog log = new ErrorLog();
                log.WriteErrorToText(ex);
            }
            return bookings;
        }
        #endregion

        #region Fetch One Record By Booking Id
        public async Task<BookingResult> BookingDetailsById(int id)
        {
            var booking = new BookingResult();
            var param = new DynamicParameters();
            try
            {
                param.Add("@id", id, DbType.Int32, ParameterDirection.Input);
                var mutiple = await _serverHandler.QueryMultipleAsync(_serverHandler.Connection, StoredProc.Booking.BookingDetails, CommandType.StoredProcedure, param);

                if (mutiple != null)
                {
                    booking.listBooking = (await mutiple.ReadAsync<BookingModel>()).ToList();
                    booking.listUser = (await mutiple.ReadAsync<UserModel>()).ToList();
                }
            }
            catch (Exception ex)
            {

                ErrorLog log = new ErrorLog();
                log.WriteErrorToText(ex);
            }
            return booking;
        }
        #endregion

        public async Task<int> Payment(Payment pay)
        {
            var param = new DynamicParameters();
            try
            {
                param.Add("@pPaymentId", pay.PaymentId, DbType.Int32, ParameterDirection.Input);
                param.Add("@pPayerName", pay.PayerName, DbType.String, ParameterDirection.Input);
                param.Add("@pCardNumber", pay.CardNumber, DbType.Int64, ParameterDirection.Input);
                param.Add("@pExpiryDate", pay.ExpiryDate, DbType.String, ParameterDirection.Input);
                param.Add("@pCvv", pay.Cvv, DbType.Int32, ParameterDirection.Input);
                param.Add("@pBookingId", pay.BookingId, DbType.Int32, ParameterDirection.Input);
                param.Add("@ReturnVal", dbType: DbType.Int32, direction: ParameterDirection.Output);
                await _serverHandler.ExecuteAsync(_serverHandler.Connection, StoredProc.Booking.Payment, CommandType.StoredProcedure, param);
            }
            catch (Exception ex)
            {
                ErrorLog log = new ErrorLog();
                log.WriteErrorToText(ex);
            }

            return param.Get<int>("@ReturnVal");

        }
    }

    
}
