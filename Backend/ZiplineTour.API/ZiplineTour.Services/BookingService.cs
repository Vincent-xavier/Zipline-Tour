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
        Task<ResultArgs> BookingDetailsById(int id);
        Task<ResultArgs> FetchBooking();
        Task<ResultArgs> FetchOrders();
        Task<ResultArgs> BookingListBySlotId(int slotId);
        Task<ResultArgs> Payment(Payment pay);

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
                args.ResultData = result;
            }
            else
            {
                args.StatusCode = 500;
                args.StatusMessage = "failed";
            }

            return args;
        }

        public async Task<ResultArgs> Payment(Payment pay)
        {
            var args = new ResultArgs();

            var result = await _bookingRepository.Payment(pay);

            if (result > 0)
            {
                args.StatusCode = 200;
                args.StatusMessage = "Saved Successfully";
                args.ResultData = result;
            }
            else
            {
                args.StatusCode = 500;
                args.StatusMessage = "failed";
            }

            return args;
        }

        public async Task<ResultArgs> BookingDetailsById(int id)
        {
            var args = new ResultArgs();

            var result = await _bookingRepository.BookingDetailsById(id);

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
        public async Task<ResultArgs> FetchOrders()
        {
            var args = new ResultArgs();

            var result = await _bookingRepository.FetchOrders();

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
        public async Task<ResultArgs> BookingListBySlotId(int slotId)
        {
            var args = new ResultArgs();

            var result = await _bookingRepository.BookingListBySlotId(slotId);

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
