import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link } from "react-router-dom";
import { events } from "../../../actions/Event";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";
import "../Event/Event.css";
import * as types from "../../../actions/types";
import moment from "moment/moment";

const Events = () => {
  const dispatch = useDispatch();

  const { eventData } = useSelector((state) => state.eventAPI);

  console.log(eventData);
  useEffect(() => {
    dispatch(events());
  }, []);

  return (
    <>
      <Header />
      <Sidebar />
      <main id="main" className="main">
        <div className="pagetitle">
          <h1 style={{ fontSize: "28px" }}>Events</h1>
        </div>
        <section className="section">
          <div className="event-schedule-area-two bg-color pad100">
            <div className="container">
              <div className="row">
                <div className="col-lg-12">
                  <div className="tab-content" id="myTabContent">
                    <div
                      className="tab-pane fade active show"
                      id="home"
                      role="tabpanel"
                    >
                      {eventData?.resultData ? (
                        eventData?.resultData?.result?.map((value) => {
                          // console.log(value);
                          return (
                            <>
                              <table className="table">
                                <tbody>
                                  <tr className="border p-0 ">
                                    <th className="text-center h4" scope="col">
                                      {value?.Events?.dayName}
                                    </th>
                                    <th colSpan={"4"} scope="col">
                                      {value?.Events?.fullDate}
                                    </th>
                                  </tr>
                                  {value?.Events.EventTimeSlots?.map(
                                    (event) => {
                                      console.log(event);
                                      return (
                                        <>
                                          <tr className="inner-box">
                                            <th scope="row">
                                              <div className="event-date">
                                                <span>
                                                  {event?.eventCapacity}
                                                </span>
                                                <p>Available</p>
                                              </div>
                                            </th>
                                            <td>
                                              <div className="event-img">
                                                <img
                                                  // src="/admin/assets/img/event-img.jpg"
                                                  src={
                                                    types.IMAGE_PATH +
                                                    event?.eventImage
                                                  }
                                                  alt="true"
                                                />
                                              </div>
                                            </td>
                                            <td>
                                              <div className="event-wrap">
                                                <h3>
                                                  <Link
                                                    to={`/event-details/${event?.slotId}`}
                                                  >
                                                    {event?.eventName}
                                                  </Link>
                                                </h3>
                                              </div>
                                            </td>
                                            <td>
                                              <div className="time">
                                                <span
                                                  style={{
                                                    fontWeight: "bold",
                                                    fontSize: "17px",
                                                  }}
                                                >
                                                  {moment(event?.Time).format(
                                                    "hh:mm a"
                                                  )}
                                                </span>
                                              </div>
                                            </td>
                                            <td>
                                              <div className="primary-btn">
                                                <Link
                                                  to={`/event-details/${value.slotId}`}
                                                  className="btn btn-primary"
                                                >
                                                  Book Now
                                                </Link>
                                              </div>
                                            </td>
                                          </tr>
                                        </>
                                      );
                                    }
                                  )}
                                </tbody>
                              </table>
                            </>
                          );
                        })
                      ) : (
                        <>
                          <div className="p-5">
                            <h3>No data found</h3>
                          </div>
                        </>
                      )}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
};

export default Events;
