import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link, useNavigate } from "react-router-dom";
import { events } from "../../actions/Event";
import Header from "../Layout/Header";
import Sidebar from "../Layout/Sidebar";
import * as types from "../../actions/types";
import moment from "moment";

export const Dashboard = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { eventData } = useSelector((state) => state.eventAPI);

  const handleRoaster = (slotId) => {
    navigate(`/roster/${slotId}`);
  };

  useEffect(() => {
    dispatch(events());
  }, []);

  return (
    <>
      <Header />
      <Sidebar />

      <main id="main" className="main">
        <section className="section dashboard">
          <div
            className="row mb-3"
            style={{ height: "55px", margin: "-20px -35px" }}
          >
            <div className="col-md-4 mt-1 d-flex">
              {/* <p className="me-2"> Search</p>    <input type="search" className="form-control" name="search" id="search-btn" /> */}
            </div>
          </div>
          <div className="row">
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
                        <table className="table">
                          {eventData && eventData?.resultData?.length > 0
                            ? eventData?.resultData?.map((e, i) => {
                                return (
                                  <>
                                    <thead
                                      key={i}
                                      style={{
                                        background: "#fff",
                                        color: "#000",
                                        opacity: ".8",
                                      }}
                                    >
                                      <tr>
                                        <th
                                          colSpan={"2"}
                                          className="text-center"
                                          scope="col"
                                        >
                                          {moment(e.date).format(
                                            "DD MMMM yyyy"
                                          )}
                                        </th>
                                        <th colSpan={"4"} scope="col">
                                          {moment(e.date).format("dddd")}
                                        </th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      {e?.lstModal?.map((events, index) => {
                                        return (
                                          <>
                                            <tr
                                              className="inner-box"
                                              key={index}
                                            >
                                              <th scope="row">
                                                <div className="time">
                                                  <span
                                                    style={{
                                                      fontSize: "13px",
                                                    }}
                                                  >
                                                    {events?.time}
                                                  </span>
                                                </div>
                                              </th>
                                              <td>
                                                <div className="event-date text-center">
                                                  <span>
                                                    <b>
                                                      {events?.available > 0
                                                        ? events?.available
                                                        : events?.eventCapacity}
                                                    </b>
                                                  </span>
                                                  <p>Capacity</p>
                                                </div>
                                              </td>
                                              <td>
                                                <div className="event-img">
                                                  <img
                                                    style={{
                                                      width: "50px",
                                                      height: "50px",
                                                    }}
                                                    src={
                                                      types.IMAGE_PATH +
                                                      events?.eventImage
                                                    }
                                                    alt
                                                  />
                                                </div>
                                              </td>
                                              <td>
                                                <div className="event-wrap d-flex">
                                                  <h5>{events?.eventName}</h5>
                                                </div>
                                              </td>

                                              <td
                                                onClick={() =>
                                                  handleRoaster(events?.slotId)
                                                }
                                              >
                                                <span className="text-center ms-3">
                                                  <i className="bi bi-arrow-right-square-fill" />
                                                </span>

                                                <p
                                                  style={{
                                                    fontWeight: "bold",
                                                    fontSize: "17px",
                                                  }}
                                                >
                                                  Roster
                                                </p>
                                              </td>
                                            </tr>
                                          </>
                                        );
                                      })}
                                    </tbody>
                                  </>
                                );
                              })
                            : null}
                        </table>
                      </div>
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
