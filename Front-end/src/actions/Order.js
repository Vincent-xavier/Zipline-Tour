import axios from "axios";
import * as constants from '../actions/types'

export const saveEventBooking = (bookingData,navigate) => async (dispatch) => {
    dispatch({
        type: constants.EVENT_BOOKING_REQUEST
    });
    const headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    try {
        axios.post(`/api/Booking/eventbooking`, bookingData, {
            headers: headers,
          })
          .then((res) => {
            dispatch({
              type: constants.EVENT_BOOKING_SUCCESS,
              payload: res.data,
            });
            navigate("/payment");
          });
    } catch (error) {
        dispatch({
            type: constants.EVENT_BOOKING_ERROR
        })
    }
}

export const bookingDetails = (bookingId) => async (dispatch) => {
    dispatch({
        type: constants.BOOKING_DETAILS_REQUEST
    });
    const headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    try {
        axios.get(`/api/Booking/getBookingDetails/${bookingId}`, {}, {
            headers: headers,
          })
          .then((res) => {
            dispatch({
              type: constants.BOOKING_DETAILS_SUCCESS,
              payload: res.data,
            });
          });
    } catch (error) {
        dispatch({
            type: constants.BOOKING_DETAILS_ERROR
        })
    }
}


export const fetchbooking = () => async (dispatch) => {
    dispatch({
        type: constants.FETCH_BOOKING_REQUEST
    });
    const headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    try {
        axios.get(`/api/Booking/fetchAllBookings`, {}, {
            headers: headers,
          })
          .then((res) => {
            dispatch({
              type: constants.FETCH_BOOKING_SUCCESS,
              payload: res.data,
            });
          });
    } catch (error) {
        dispatch({
            type: constants.FETCH_BOOKING_ERROR
        })
    }
}