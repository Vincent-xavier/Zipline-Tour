import axios from "axios";
import * as constants from "./types";

export const userLogin = (data) => async (dispatch) => {
  dispatch({
    type: constants.LOGIN_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .post(`/api/Authendication/gettoken`, data, { headers: headers })
      .then((res) => {
        dispatch({
          type: constants.LOGIN_SUCCESS,
          payload: res.data,
        });
        localStorage.setItem("user", JSON.stringify(res.data));
      });
  } catch (err) {
    dispatch({
      type: constants.LOGIN_ERROR,
    });
  }
};

export const userRights = (rollbaseId) => async (dispatch) => {
  dispatch({
    type: constants.USER_RIGHTS_REQUEST,
  });
  const headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
  };
  try {
    await axios
      .get(
        `/api/Authendication/userRights/${rollbaseId}`,
        {},
        { headers: headers }
      )
      .then((res) => {
        dispatch({
          type: constants.USER_RIGHTS_SUCCESS,
          payload: res.data,
        });
      });
  } catch (err) {
    dispatch({
      type: constants.USER_RIGHTS_ERROR,
    });
  }
};
