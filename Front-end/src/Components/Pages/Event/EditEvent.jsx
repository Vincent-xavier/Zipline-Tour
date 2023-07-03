import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link, useNavigate } from "react-router-dom";
import { eventDetails } from "../../../actions/Event";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";
import * as types from "../../../actions/types";
import { toast } from "react-toastify";

const EditProduct = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { eventData, success } = useSelector((state) => state.eventAPI);

  const [searchValue, setSearchValue] = useState("");

  useEffect(() => {
    dispatch(eventDetails());

    if (success === "event Saved Successfully") {
      toast("Event Saved Successfully");
    }
  }, [success]);

  const handleClick = () => {
    dispatch({ type: types.EVENT_DETAILS_BY_ID_REQUEST });
    navigate("/add-event-schedule");
  };

  return (
    <>
      <Header />
      <Sidebar />

      <main id="main" className="main">
        <div className="pagetitle">
          <h1 style={{ fontSize: "28px" }}>Update Events</h1>
        </div>
        <div className="container">
          <div className="row mt-0 d-flex">
            <div className="col">
              <div className="input-group p-1 mt-3">
                <div className="form-outline">
                  <input
                    type="search"
                    onChange={(e) => setSearchValue(e.target.value)}
                    value={searchValue}
                    placeholder="Search by event name"
                    id="form1"
                    className="form-control"
                  />
                </div>
                <button type="button" className="btn btn-primary">
                  <i class="bi bi-search"></i>
                </button>
              </div>
            </div>
            <div className="col text-end p-3">
              <button onClick={() => handleClick()} className="btn btn-primary">
                Add new Event
              </button>
            </div>
          </div>
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
                      <div className="table-responsive">
                        {eventData?.resultData ? (
                          eventData?.resultData
                            ?.filter((d) =>
                              d?.eventName
                                ?.toLowerCase()
                                ?.includes(searchValue?.toLowerCase())
                            )
                            .map((value) => {
                              return (
                                <div
                                  class="xyz-in"
                                  xyz="fade flip-down stagger duration-10 delay-2 ease-out-back"
                                >
                                  <table className="table">
                                    <tbody>
                                      <tr
                                        className="inner-box  xyz-in"
                                        xyz="fade left stagger"
                                      >
                                        <td>
                                          <div className="event-img xyz-nested">
                                            <img
                                              src={
                                                types.IMAGE_PATH +
                                                value.eventImage
                                              }
                                              alt
                                            />
                                          </div>
                                        </td>
                                        <td>
                                          <div className="event-wrap">
                                            <h3>
                                              <Link
                                                to={`/edit-event-schedule/${value.eventId}`}
                                              >
                                                {value?.eventName}
                                              </Link>
                                            </h3>
                                            <div className="meta">
                                              <div
                                                className="organizers"
                                                style={{
                                                  width: "450px",
                                                  "overflow-wrap": "anywhere",
                                                }}
                                              >
                                                <blockquote className="blockquote">
                                                  <p className="mb-0">
                                                    {value.eventDiscription}
                                                  </p>
                                                </blockquote>
                                              </div>
                                            </div>
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
                                              {value.time}
                                            </span>
                                          </div>
                                        </td>
                                        <td>
                                          <div className="primary-btn">
                                            <Link
                                              to={`/edit-event-schedule/${value.eventId}`}
                                              className="btn btn-primary"
                                            >
                                              Edit Event
                                            </Link>
                                          </div>
                                        </td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </div>
                              );
                            })
                        ) : (
                          <>
                            <h4>No Events Found !</h4>
                          </>
                        )}
                      </div>
                    </div>
                  </div>
                </div>
                {/* /col end*/}
              </div>
              {/* /row end*/}
            </div>
          </div>
        </section>
      </main>
    </>
  );
};

export default EditProduct;
