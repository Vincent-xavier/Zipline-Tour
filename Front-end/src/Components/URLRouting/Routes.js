import React from "react";
import { Route, Routes } from "react-router-dom";
import BookingList from "../Pages/Booking/BookingList";
import OrderList from "../Pages/Booking/OrderList";
import { Dashboard } from "../Pages/Dashboard";
import ErrorPage from "../Pages/ErrorPage";
import EditEvent from "../Pages/Event/EditEvent";
import EditEventSchedule from "../Pages/Event/EditEventSchedule";
import EventDetails from "../Pages/Event/EventDetails";
import Events from "../Pages/Event/Events";
import Login from "../Pages/Login";
import Payment from "../Pages/Payment/Payment";
import Profile from "../Pages/Profile";
import RosterView from "../Pages/Roster";
import PrivateRoutes from "./privateRoutes/PrivateRoute";

const URLRoutes = () => {
  return (
    <Routes>
      <Route path="/" element={<Login />} />
      <Route path="/login" element={<Login />} />
      <Route path="/event" element={<Events />} />
      <Route path="/event-details/:id" element={<EventDetails />} />
      <Route path="/payment" element={<Payment />} />
      <Route path="/payment/:bookingId" element={<Payment />} />
      <Route path="*" element={<ErrorPage />} />

      <Route element={<PrivateRoutes />}>
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/order-list" element={<OrderList />} />
        <Route
          path="/edit-event-schedule/:id"
          element={<EditEventSchedule />}
        />
        <Route path="/add-event-schedule/" element={<EditEventSchedule />} />
        <Route path="/booking-list" element={<BookingList />} />
        <Route path="/edit-event" element={<EditEvent />} />
        <Route path="/roster" element={<RosterView />} />
        <Route path="/roster/:slotId" element={<RosterView />} />
        <Route path="/profile" element={<Profile />} />
      </Route>
    </Routes>
  );
};

export default URLRoutes;
