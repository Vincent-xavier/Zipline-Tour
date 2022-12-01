using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using ZiplineTour.Models.Input;
using ZiplineTour.Models;
using ZiplineTour.Repository;

namespace ZiplineTour.Services
{
    public interface IBookingService
    {
        Task<ResultArgs> SaveEventBooking(BookingModel bookingModel);
        Task<ResultArgs> BookingDetails(int id);
        Task<ResultArgs> FetchBooking();

    }
    public class BookingService : IBookingService
    {
        private readonly IBookingRepository _bookingRepository;
        public BookingService(IBookingRepository bookingRepository)
        {
            _bookingRepository = bookingRepository;
        }

        public async Task<ResultArgs> SaveEventBooking(BookingModel bookingModel)
        {
            var args = new ResultArgs();

            var result = await _bookingRepository.SaveEventBooking(bookingModel);

            if (result != null)
            {
                args.StatusCode = 200;
                args.StatusMessage = "Saved Successfully";
            }
            else
            {
                args.StatusCode = 500;
                args.StatusMessage = "failed";
            }

            return args;
        }

        public async Task<ResultArgs> BookingDetails(int id)
        {
            var args = new ResultArgs();

            var result = await _bookingRepository.BookingDetails(id);

            if (result != null)
            {
                args.StatusCode = 200;
                args.StatusMessage = "Success";
                args.ResultData = result;
            }
            else
            {
                args.StatusCode = 500;
                args.StatusMessage = "failed";
            }

            return args;
        }

        public async Task<ResultArgs> FetchBooking()
        {
            var args = new ResultArgs();

            var result = await _bookingRepository.FetchBooking();

            if (result != null)
            {
                args.StatusCode = 200;
                args.StatusMessage = "Success";
                args.ResultData = result;
            }
            else
            {
                args.StatusCode = 500;
                args.StatusMessage = "failed";
            }

            return args;
        }
    }
}
