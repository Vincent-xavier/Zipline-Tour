using System.Threading.Tasks;
using ZiplineTour.Models;
using ZiplineTour.Models.Input;

namespace ZiplineTour.Services.Interface
{
    public interface IBookingService
    {
        Task<ResultArgs> SaveEventBooking(BookingModel bookingModel);

        Task<ResultArgs> BookingDetailsById(int id);

        Task<ResultArgs> FetchBooking();

        Task<ResultArgs> FetchOrders();

        Task<ResultArgs> FetchOrderById(int bookingId);

        Task<ResultArgs> BookingListBySlotId(int slotId);

        Task<ResultArgs> Payment(Payment pay);
    }
}