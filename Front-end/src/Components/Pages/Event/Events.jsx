import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import moment from "moment/moment";
import "../Event/Event.css";
import { Link } from "react-router-dom";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";
import { events } from "../../../actions/Event";
import * as types from "../../../actions/types";
import Footer from "../../Layout/Footer";

const Events = () => {
  const dispatch = useDispatch();
  const [searchValue, setSearchValue] = useState("");

  const { eventData } = useSelector((state) => state.eventAPI);
  console.log(eventData);

  useEffect(() => {
    dispatch(events());
  }, [dispatch]);

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
                      <div className="card">
                        <div className="card-body opacity-0.5 mb-0">
                          <div className="row">
                            <div className="col-md-8"></div>
                            <div className="col-md-4">
                              <div className="input-group p-1 mt-3">
                                <div className="form-outline">
                                  <input
                                    type="search"
                                    onChange={(e) =>
                                      setSearchValue(e.target.value)
                                    }
                                    value={searchValue}
                                    placeholder="Search by event name"
                                    id="form1"
                                    className="form-control"
                                  />
                                </div>
                                <button
                                  type="button"
                                  className="btn btn-primary"
                                >
                                  <i class="bi bi-search"></i>
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>

                      {eventData && eventData.length ? (
                        eventData?.map((value) => {
                          return (
                            <>
                              <table className="table mt-3">
                                <tbody>
                                  <tr
                                    className="border p-0 "
                                    key={value.eventId}
                                  >
                                    <th className="text-center h4" scope="col">
                                      {moment(value?.date).format("dddd")}
                                    </th>
                                    <th colSpan={"4"} scope="col">
                                      {moment(value?.date).format(
                                        "MMM DD YYYY"
                                      )}
                                    </th>
                                  </tr>
                                  {value?.lstModal
                                    ?.filter((d) =>
                                      d.eventName
                                        .toLowerCase()
                                        .includes(searchValue.toLowerCase())
                                    )
                                    .map((event) => {
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
                                                    event.eventImage
                                                  }
                                                  alt="true"
                                                />
                                              </div>
                                            </td>
                                            <td>
                                              <div className="event-wrap">
                                                <h3>
                                                  <Link
                                                    to={`/event-details/${event.slotId}`}
                                                  >
                                                    {event.eventName}
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
                                                  {event?.time}
                                                </span>
                                              </div>
                                            </td>
                                            <td>
                                              <div className="primary-btn">
                                                <Link
                                                  to={`/event-details/${event.slotId}`}
                                                  className="btn btn-primary"
                                                >
                                                  Book Now
                                                </Link>
                                              </div>
                                            </td>
                                          </tr>
                                        </>
                                      );
                                    })}
                                </tbody>
                              </table>
                            </>
                          );
                        })
                      ) : (
                        <>
                          <div className="p-5">
                            <h3>Sorry! No events Today</h3>
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
