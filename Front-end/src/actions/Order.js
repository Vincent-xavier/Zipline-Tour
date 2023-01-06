import axios from "axios";
import * as constants from '../actions/types'

export const saveEventBooking = (bookingData, navigate) => async (dispatch) => {
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
                localStorage.setItem("customerData", JSON.stringify(res.data))
                navigate("/payment");
            });
    } catch (error) {
        dispatch({
            type: constants.EVENT_BOOKING_ERROR,
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

export const savePayment = (paymentData, navigate) => async (dispatch) => {
    dispatch({
        type: constants.PAYMENT_REQUEST
    });
    const headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    try {
        axios.post(`/api/Booking/payment`, paymentData, {
            headers: headers,
        })
            .then((res) => {
                dispatch({
                    type: constants.PAYMENT_SUCCESS,
                    payload: res.data,
                });
                localStorage.removeItem("customerData")
                navigate("/event");
            });
    } catch (error) {
        dispatch({
            type: constants.PAYMENT_ERROR
        })
    }
}

export const fetchOrders = () => async (dispatch) => {
    dispatch({
        type: constants.FETCH_ORDERS_REQUEST
    });
    const headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    try {
        axios.get(`/api/Booking/fetchorders`, {}, {
            headers: headers,
        })
            .then((res) => {
                dispatch({
                    type: constants.FETCH_ORDERS_SUCCESS,
                    payload: res.data,
                });
            });
    } catch (error) {
        dispatch({
            type: constants.FETCH_ORDERS_ERROR
        })
    }
}

export const fetchOrderById = (id) => async (dispatch) => {
    dispatch({
        type: constants.FETCH_ORDER_BY_ID_REQUEST
    });
    const headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    try {
        axios.get(`/api/Booking/fetchorderById/${id}`, {}, {
            headers: headers,
        })
            .then((res) => {
                dispatch({
                    type: constants.FETCH_ORDER_BY_ID_SUCCESS,
                    payload: res.data,
                });
            });
    } catch (error) {
        dispatch({
            type: constants.FETCH_ORDER_BY_ID_ERROR
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


export const getBookingBySlotId = (sloatId) => async (dispatch) => {
    dispatch({
        type: constants.FETCH_BOOKING_BY_SLOAT_ID_REQUEST
    });
    const headers = {
        "Accept": "application/json",
        "Content-Type": "application/json",
    }
    try {
        axios.get(`/api/Booking/fetch-booking-by-slotid/${sloatId}`, {}, {
            headers: headers,
        })
            .then((res) => {
                dispatch({
                    type: constants.FETCH_BOOKING_BY_SLOAT_ID_SUCCESS,
                    payload: res.data,
                });
            });
    } catch (error) {
        dispatch({
            type: constants.FETCH_BOOKING_BY_SLOAT_ID_ERROR
        })
    }
}