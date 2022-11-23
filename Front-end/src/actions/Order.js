import axios from "axios";
import * as constants from '../actions/types'

export const saveEventBooking = (bookingData) => async (dispatch) => {
    dispatch({
        type: constants.EVENT_BOOKING_REQUEST
    });
    const headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    try {
        axios.post(`https://localhost:44306/api/Booking/eventbooking`, bookingData, {
            headers: headers,
          })
          .then((res) => {
            dispatch({
              type: constants.EVENT_BOOKING_SUCCESS,
              payload: res.data,
            });
          });
    } catch (error) {
        dispatch({
            type: constants.EVENT_BOOKING_ERROR
        })
    }
}

