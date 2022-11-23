import { combineReducers } from "redux";
import eventAPI from "./eventAPI";
import userAPI from "./userAPI";
import orderAPI from "./orderAPI"

export default combineReducers({
  userAPI, eventAPI, orderAPI,
});