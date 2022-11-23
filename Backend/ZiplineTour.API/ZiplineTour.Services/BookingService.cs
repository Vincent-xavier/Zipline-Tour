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

            if (result > 0)
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
    }
}
