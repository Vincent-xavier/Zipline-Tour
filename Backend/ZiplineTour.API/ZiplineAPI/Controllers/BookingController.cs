using Microsoft.AspNetCore.Mvc;
using ZiplineTour.Models.Input;
using ZiplineTour.Services;

namespace ZiplineTour.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : ControllerBase
    {
        private readonly IBookingService _bookingService;

        public BookingController(IBookingService bookingService)
        {
            _bookingService = bookingService;
        }

        [HttpPost]
        [Route("eventbooking")]
        public async Task<IActionResult> EventBooking(BookingModel bookingModel)
        {
            var result = await _bookingService.SaveEventBooking(bookingModel);

            if (result.StatusCode == 200)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }

        [HttpPost]
        [Route("payment")]
        public async Task<IActionResult> Payment(Payment pay)
        {
            var result = await _bookingService.Payment(pay);

            if (result.StatusCode == 200)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }

        [HttpGet]
        [Route("fetchAllBookings")]
        public async Task<IActionResult> FetchBooking()
        {
            var result = await _bookingService.FetchBooking();

            if (result.StatusCode == 200)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }

        [HttpGet]
        [Route("fetchorders")]
        public async Task<IActionResult> FetchOrders()
        {
            var result = await _bookingService.FetchOrders();

            if (result.StatusCode == 200)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }

        [HttpGet]
        [Route("fetchorderById/{bookingId}")]
        public async Task<IActionResult> FetchOrderById(int bookingId)
        {
            var result = await _bookingService.FetchOrderById(bookingId);

            if (result.StatusCode == 200)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }

        [HttpGet("getBookingDetails/{bookingId}")]
        public async Task<IActionResult> BookingDetailsById(int bookingId)
        {
            var result = await _bookingService.BookingDetailsById(bookingId);

            if (result.StatusCode == 200)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }

        [HttpGet]
        [Route("fetch-booking-by-slotid/{slotId}")]
        public async Task<IActionResult> BookingListBySlotId(int slotId)
        {
            var result = await _bookingService.BookingListBySlotId(slotId);

            if (result.StatusCode == 200)
            {
                return Ok(result);
            }
            else
            {
                return BadRequest(result);
            }
        }
    }
}