import * as constants from '../actions/types';

const initialState = {
    isLoading: false,
    success: "",
    error: "",
    orderData: "",
    bookingdata: "",
    orderDetails: ""
}


export default function (state = initialState, action) {
    switch (action.type) {
        case constants.EVENT_BOOKING_REQUEST:
            return {
                ...state,
                isLoading: true,
                success: null,
                error: null,
            };
        case constants.EVENT_BOOKING_SUCCESS:
            return {
                ...state,
                isLoading: false,
                success: "Event Booked SuccessFully",
                // bookingdata: action.payload,
                customerDetails: action.payload,
            };
        case constants.EVENT_BOOKING_ERROR:
            return {
                ...state,
                isLoading: false,
                success: null,
                orderData: null,
                error: "error",
            };


        case constants.BOOKING_DETAILS_REQUEST:
            return {
                ...state,
                isLoading: true,
                success: null,
                error: null,
            };
        case constants.BOOKING_DETAILS_SUCCESS:
            return {
                ...state,
                isLoading: false,
                success: "success",
                customerDetails: action.payload,
            };
        case constants.BOOKING_DETAILS_ERROR:
            return {
                ...state,
                isLoading: false,
                success: null,
                orderData: null,
                error: "error",
            };

        case constants.FETCH_BOOKING_REQUEST:
            return {
                ...state,
                isLoading: true,
                success: null,
                error: null,
                bookingdata: null,
            };
        case constants.FETCH_BOOKING_SUCCESS:
            return {
                ...state,
                isLoading: false,
                success: "success",
                bookingdata: action.payload,
            };
        case constants.FETCH_BOOKING_ERROR:
            return {
                ...state,
                isLoading: false,
                success: null,
                bookingdata: null,
                error: "error",
            };

        case constants.PAYMENT_REQUEST:
            return {
                ...state,
                isLoading: true,
                success: null,
                error: null,
                payment: null,
            };
        case constants.PAYMENT_SUCCESS:
            return {
                ...state,
                isLoading: false,
                success: "Event Booked Successfully",
                payment: action.payload,
            };
        case constants.PAYMENT_ERROR:
            return {
                ...state,
                isLoading: false,
                success: null,
                payment: null,
                error: "error",
            };

        case constants.FETCH_ORDERS_REQUEST:
            return {
                ...state,
                isLoading: true,
                success: null,
                error: null,
            };
        case constants.FETCH_ORDERS_SUCCESS:
            return {
                ...state,
                isLoading: false,
                success: "Fetch order Success",
                bookingdata: action.payload,
            };
        case constants.FETCH_ORDERS_ERROR:
            return {
                ...state,
                isLoading: false,
                success: null,
                error: "error",
            };

        case constants.FETCH_ORDER_BY_ID_REQUEST:
            return {
                ...state,
                isLoading: true,
                success: null,
                error: null,
                orderDetails: null,
            };
        case constants.FETCH_ORDER_BY_ID_SUCCESS:
            return {
                ...state,
                isLoading: false,
                success: "Fetch order Success",
                orderDetails: action.payload,
            };
        case constants.FETCH_ORDER_BY_ID_ERROR:
            return {
                ...state,
                isLoading: false,
                success: null,
                error: "error",
            };


        case constants.FETCH_BOOKING_BY_SLOAT_ID_REQUEST:
            return {
                ...state,
                isLoading: true,
                success: null,
                error: null,
                bookingdata: null,
            };
        case constants.FETCH_BOOKING_BY_SLOAT_ID_SUCCESS:
            return {
                ...state,
                isLoading: false,
                success: "success",
                bookingdata: action.payload,
            };
        case constants.FETCH_BOOKING_BY_SLOAT_ID_ERROR:
            return {
                ...state,
                isLoading: false,
                success: null,
                bookingdata: null,
                error: "error",
            };

        default:
            return state;
    }
}

