import * as constants from '../actions/types';

const initialState = {
    isLoading: false,
    success: "",
    error: "",
    orderData: "",
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
                success: "success",
                orderData: action.payload,
            };
        case constants.EVENT_BOOKING_ERROR:
            return {
                ...state,
                isLoading: false,
                success: null,
                orderData: null,
                error: "error",
            };

        default:
            return state;
    }
}

