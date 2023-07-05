using System.Collections.Generic;
using System.Threading.Tasks;
using ZiplineTour.Models.Input;
using ZiplineTour.Models.Output;

namespace ZiplineTour.Repository.Interfaces
{
    public interface IBookingRepository
    {
        Task<List<BookingModel>> FetchBooking();

        Task<List<Booking>> FetchOrders();

        Task<Booking> FetchOrderById(int bookingId);

        Task<List<Booking>> BookingListBySlotId(int slotId);

        Task<BookingResult> SaveEventBooking(BookingModel bookingModel);

        Task<BookingResult> BookingDetailsById(int id);

        Task<int> Payment(Payment pay);
    }
}