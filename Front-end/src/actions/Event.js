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
      .get(`https://localhost:44306/api/Event/events`, {}, { headers: headers })
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



export const eventDetailsById = (id) => async (dispatch) => {
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
        `https://localhost:44306/api/Event/eventDetailsById/${id}`,
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
        `https://localhost:44306/api/Event/eventDetails`,
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


export const eventById = (id) => async (dispatch) => {
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
        `https://localhost:44306/api/Event/eventById/${id}`,
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

// const formData = new FormData();
// formData.append("imgFile",fileSelected)

export const saveEvent = (eventData) => async (dispatch) => {
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
      .post(`https://localhost:44306/api/Booking/saveEventBooking`, eventData, {
        headers: headers,
      })
      .then((res) => {
        dispatch({
          type: constants.SAVE_EVENTS_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.SAVE_EVENTS_ERROR,
    });
  }
};
