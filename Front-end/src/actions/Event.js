import axios from "axios";
import * as constants from "./types";

export const events = () => async (dispatch) => {
  dispatch({
    type: constants.EVENTS_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .get(`/api/Event/fetchEvent`, {}, { headers: headers })
      .then((res) => {
        dispatch({
          type: constants.EVENTS_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.EVENTS_ERROR,
    });
  }
};

export const eventById = (id) => async (dispatch) => {
  dispatch({
    type: constants.EVENT_BY_ID_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .get(
        `/api/Event/eventById/${id}`,
        {},
        { headers: headers }
      )
      .then((res) => {
        dispatch({
          type: constants.EVENT_BY_ID_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.EVENT_BY_ID_ERROR,
    });
  }
};

export const eventDetails = () => async (dispatch) => {
  dispatch({
    type: constants.EVENT_DETAILS_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .get(
        `/api/Event/eventDetails`,
        {},
        { headers: headers }
      )
      .then((res) => {
        dispatch({
          type: constants.EVENT_DETAILS_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.EVENT_DETAILS_ERROR
    });
  }
};


export const eventDetailsById = (id) => async (dispatch) => {
  dispatch({
    type: constants.EVENT_DETAILS_BY_ID_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .get(
        `/api/Event/eventDetailsById/${id}`,
        {},
        { headers: headers }
      )
      .then((res) => {
        dispatch({
          type: constants.EVENT_DETAILS_BY_ID_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.EVENT_DETAILS_BY_ID_ERROR,
    });
  }
};


export const saveEvent = (eventData, navigate) => async (dispatch) => {
  dispatch({
    type: constants.SAVE_EVENTS_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
    "content-type": "multipart/form-data",
  };
  try {
    await axios
      .post(`/api/Event/saveEvent`, eventData, {
        headers: headers,
      })
      .then((res) => {
        dispatch({
          type: constants.SAVE_EVENTS_SUCCESS,
          payload: res.data,
        });
        navigate("/edit-event")
      });
  } catch (err) {
    dispatch({
      type: constants.SAVE_EVENTS_ERROR,
    });
  }
};



export const saveEventSchedule = (scheduleData,navigate) => async (dispatch) => {
  dispatch({
    type: constants.SAVE_EVENT_SCHEDULE_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .post(`/api/Event/saveSchedule`, scheduleData, {
        headers: headers,
      })
      .then((res) => {
        dispatch({
          type: constants.SAVE_EVENT_SCHEDULE_SUCCESS,
          payload: res.data,
        });
        navigate("/event")
      });
  } catch (err) {
    dispatch({
      type: constants.SAVE_EVENT_SCHEDULE_ERROR,
    });
  }
};


export const listSchedule = (eventId) => async (dispatch) => {
  dispatch({
    type: constants.LIST_SCHEDULE_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .get(
        `/api/Event/getSchedules/${eventId}`,
        {},
        { headers: headers }
      )
      .then((res) => {
        dispatch({
          type: constants.LIST_SCHEDULE_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.LIST_SCHEDULE_ERROR,
    });
  }
};

export const ScheduleById = (ScheduleId) => async (dispatch) => {
  dispatch({
    type: constants.EVENT_SCHEDULE_BY_ID_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .get(
        `/api/Event/getScheduleById/${ScheduleId}`,
        {},
        { headers: headers }
      )
      .then((res) => {
        dispatch({
          type: constants.EVENT_SCHEDULE_BY_ID_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.EVENT_SCHEDULE_BY_ID_ERROR,
    });
  }
};

export const eventBySlotId = (id) => async (dispatch) => {
  dispatch({
    type: constants.EVENT_FOR_ROSTER_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .get(
        `/api/Event/fetchEvent/${id}`,
        {},
        { headers: headers }
      )
      .then((res) => {
        dispatch({
          type: constants.EVENT_FOR_ROSTER_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.EVENT_FOR_ROSTER_ERROR,
    });
  }
};