import React, { useEffect } from "react";
import Header from "../Layout/Header";
import Sidebar from "../Layout/Sidebar";
import "./Event/Event.css";
import { useDispatch, useSelector } from "react-redux";
import DataTable from "react-data-table-component";
import moment from "moment";
import { getBookingBySlotId } from "../../actions/Order";
import { events } from "../../actions/Event";
import { useNavigate, useParams } from "react-router-dom";
import { encryptSingleData } from "../../actions/types";

const RosterView = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { eventData } = useSelector((state) => state.eventAPI);
  const { bookingdata } = useSelector((state) => state.orderAPI);
  const [eventName, setEventName] = React.useState();
  const [bData, setBData] = React.useState();
  const [active, setActive] = React.useState();
  const { slotId } = useParams();

  useEffect(() => {
    dispatch(events());
  }, []);

  useEffect(() => {
    if (slotId > 0) {
      dispatch(getBookingBySlotId(slotId));
      active == slotId ? setActive(null) : setActive(slotId);
      if (bookingdata?.resultData != null) {
        setEventName(bookingdata?.resultData[0]?.eventName);
      }
    }
  }, []);

  useEffect(() => {
    setBData(bookingdata?.resultData);
  }, [bookingdata?.resultData]);

  const redirectPayment = (bookingId) => {
    const encryptId = encryptSingleData(bookingId);
    navigate(`/payment/${encryptId}`);
  };

  const columns = [
    {
      name: "Name",
      selector: (row) => row?.firstName + " " + row?.lastName,
      sortable: true,
    },
    {
      name: "Email",
      selector: (row) => row?.email,
    },
    {
      name: "Phone",
      selector: (row) => row?.phone,
    },
    {
      name: "Payment",
      selector: (row) => row?.paymentStatus,
      sortable: true,
    },
    {
      cell: (row) => (
        <>
          {row?.paymentStatus && row?.paymentStatus == "Pending" ? (
            <>
              <div className="row d-flex">
                <button
                  className="btn bg-warning d-inline mr-2 p-1"
                  onClick={(e) => redirectPayment(row?.bookingId)}
                  id={row?.bookingId}
                >
                  Resume
                </button>
              </div>
            </>
          ) : null}
        </>
      ),
      name: "ACTION",
    },
  ];
  const handleBookingDetails = (event) => {
    setEventName(event.eventName);
    console.log(event);
    dispatch(getBookingBySlotId(event.slotId));
    active == event.slotId ? setActive(null) : setActive(event.slotId);
  };

  return (
    <>
      <Header />
      <Sidebar />

      <main id="main" className="main">
        <section className="section">
          <div className="container">
            <div className="row">
              <div className="col-md-5">
                <div className="event-timeslot card">
                  <div className="eventwrapper p-3 card-body">
                    {eventData && eventData?.resultData?.length > 0
                      ? eventData?.resultData?.map((e, i) => {
                          return (
                            <>
                              <h5 className="mb-2 bg-secondary p-4 text-white">
                                {moment(e.date).format("DD MMM YYYY")}
                              </h5>
                              <ul className="list-group border-0">
                                {e?.lstModal?.map((events, index) => {
                                  return (
                                    <>
                                      <li
                                        onClick={() =>
                                          handleBookingDetails(events)
                                        }
                                        id={events.slotId}
                                        className={`event_timeslot-list border-0 mb-3 list-group-item d-flex justify-content-between align-items-center ${
                                          events.slotId == active && "selected"
                                        }`}
                                      >
                                        {events.eventName}
                                        <span className="">
                                          <h6>{events.time}</h6>
                                          {events?.available > 0
                                            ? events?.available
                                            : events?.eventCapacity}{" "}
                                          Available
                                        </span>
                                      </li>
                                    </>
                                  );
                                })}
                              </ul>
                            </>
                          );
                        })
                      : null}
                  </div>
                </div>
              </div>
              <div className="col-md-7">
                <div className="order-details">
                  {bData && (
                    <div className="card">
                      <h4 className="card-header text-center">{eventName}</h4>
                      <div className="card-body">
                        <DataTable columns={columns} data={bData} fixedHeader />
                      </div>
                    </div>
                  )}
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
};

export default RosterView;
