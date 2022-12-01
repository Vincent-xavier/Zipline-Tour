import * as constants from "../actions/types";

const initialState = {
  isLoading: false,
  error: "",
  success: "",
  eventData: null,
  eventEditData: null,
  eventDetails: null,
  eventSchedule: null,
  scheduleDetails: null,
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
        eventEditData: null,
      };
    case constants.EVENT_BY_ID_SUCCESS:
      return {
        ...state,
        isLoading: false,
        success: "success",
        eventEditData: action.payload,
      };
    case constants.EVENT_BY_ID_ERROR:
      return {
        ...state,
        isLoading: false,
        error: "error",
        eventEditData: null,
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
        eventDetails: null,
      };
    case constants.EVENT_DETAILS_BY_ID_SUCCESS:
      return {
        ...state,
        isLoading: false,
        success: "success",
        eventDetails: action.payload,
      };
    case constants.EVENT_DETAILS_BY_ID_ERROR:
      return {
        ...state,
        isLoading: false,
        error: "error",
        eventDetails: null,
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

    case constants.SAVE_EVENT_SCHEDULE_REQUEST:
      return {
        ...state,
        isLoading: true,
        error: "",
      };
    case constants.SAVE_EVENT_SCHEDULE_SUCCESS:
      return {
        ...state,
        isLoading: false,
        success: "event Scheduled Successfully",
      };
    case constants.SAVE_EVENT_SCHEDULE_ERROR:
      return {
        ...state,
        isLoading: false,
        error: "error",
      };

    case constants.EVENT_SCHEDULE_BY_ID_REQUEST:
      return {
        ...state,
        isLoading: true,
        error: "",
        scheduleDetails: null,

      };
    case constants.EVENT_SCHEDULE_BY_ID_SUCCESS:
      return {
        ...state,
        isLoading: false,
        success: "success",
        scheduleDetails: action.payload,
      };
    case constants.EVENT_SCHEDULE_BY_ID_ERROR:
      return {
        ...state,
        isLoading: false,
        error: "error",
        scheduleDetails: null,
      };


    case constants.LIST_SCHEDULE_REQUEST:
      return {
        ...state,
        isLoading: true,
        error: "",
        eventSchedule: null,
      };
    case constants.LIST_SCHEDULE_SUCCESS:
      return {
        ...state,
        isLoading: false,
        success: "success",
        eventSchedule: action.payload,
      };
    case constants.LIST_SCHEDULE_ERROR:
      return {
        ...state,
        isLoading: false,
        error: "error",
        eventSchedule: null,
      };


    default:
      return state;
  }
}