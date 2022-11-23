import * as constants from "../actions/types";

const initialState = {
  isLoading: false,
  error: "",
  success: "",
  eventData: null,
  eventEditData:null,
};

export default function (state = initialState, action) {
  switch (action.type) {
    case constants.EVENTS_REQUEST:
      return {
        ...state,
        isLoading: true,
        error: "",
        eventData: null,
      };
    case constants.EVENTS_SUCCESS:
      return {
        ...state,
        isLoading: false,
        success: "success",
        eventData: action.payload,
      };
    case constants.EVENTS_ERROR:
      return {
        ...state,
        isLoading: false,
        error: "error",
        eventData: null,
      };

      //event by id
      case constants.EVENT_BY_ID_REQUEST:
      return {
        ...state,
        isLoading: true,
        error: "",
        eventEditData:null,
      };
    case constants.EVENT_BY_ID_SUCCESS:
      return {
        ...state,
        isLoading: false,
        success: "success",
        eventEditData:action.payload,
      };
    case constants.EVENT_BY_ID_ERROR:
      return {
        ...state,
        isLoading: false,
        error: "error",
        eventEditData:null,
      };

      // Event Details
      case constants.EVENT_DETAILS_REQUEST:
        return {
          ...state,
          isLoading: true,
          error: "",
          eventData: null,
        };
      case constants.EVENT_DETAILS_SUCCESS:
        return {
          ...state,
          isLoading: false,
          success: "success",
          eventData: action.payload,
        };
      case constants.EVENT_DETAILS_ERROR:
        return {
          ...state,
          isLoading: false,
          error: "error",
          eventData: null,
        };

        //event by id
      case constants.EVENT_DETAILS_BY_ID_REQUEST:
        return {
          ...state,
          isLoading: true,
          error: "",
          eventEditData:null,
        };
      case constants.EVENT_DETAILS_BY_ID_SUCCESS:
        return {
          ...state,
          isLoading: false,
          success: "success",
          eventEditData:action.payload,
        };
      case constants.EVENT_DETAILS_BY_ID_ERROR:
        return {
          ...state,
          isLoading: false,
          error: "error",
          eventEditData:null,
        };


      case constants.SAVE_EVENTS_REQUEST:
      return {
        ...state,
        isLoading: true,
        error: "",
      };
    case constants.SAVE_EVENTS_SUCCESS:
      return {
        ...state,
        isLoading: false,
        success: "event Saved Successfully",
      };
    case constants.SAVE_EVENTS_ERROR:
      return {
        ...state,
        isLoading: false,
        error: "error",
      };


      
    default:
      return state;
  }
}