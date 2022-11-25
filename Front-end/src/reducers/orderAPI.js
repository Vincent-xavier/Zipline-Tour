import * as constants from '../actions/types';

const initialState = {
    isLoading: false,
    success: "",
    error: "",
    orderData: "",
    bookingdata: "",
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
                bookingdata: action.payload,
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
                orderData: action.payload,
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

        default:
            return state;
    }
}

