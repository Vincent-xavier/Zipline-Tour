import React, { useEffect } from "react";
import Header from "../Layout/Header";
import Sidebar from "../Layout/Sidebar";
import "./Event/Event.css";
import moment from "moment";
import DataTable from "react-data-table-component";
import { useDispatch, useSelector } from "react-redux";
import { fetchOrderById, getBookingBySlotId } from "../../actions/Order";
import { eventBySlotId } from "../../actions/Event";
import { useNavigate, useParams } from "react-router-dom";
import { encryptSingleData } from "../../actions/types";

const RosterView = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { roster } = useSelector((state) => state.eventAPI);
  const { bookingdata, orderDetails } = useSelector((state) => state.orderAPI);
  const [eventName, setEventName] = React.useState();
  const [bData, setBData] = React.useState();
  const [active, setActive] = React.useState();
  const { slotId } = useParams();
  const [orderData, setOrderData] = React.useState();

  useEffect(() => {
    if (slotId > 0) {
      dispatch(eventBySlotId(slotId));
      dispatch(getBookingBySlotId(slotId));
      active == slotId ? setActive(null) : setActive(slotId);
      if (bookingdata?.resultData != null) {
        setEventName(bookingdata?.resultData[0]?.eventName);
      }
    }
  }, []);

  useEffect(() => {
    setBData(bookingdata?.resultData);
    if (orderDetails) {
      setOrderData(orderDetails?.resultData);
    }
  }, [bookingdata?.resultData, orderDetails?.resultData]);

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
                  <i class="bi bi-pencil-square"></i>
                </button>
              </div>
            </>
          ) : (
            <>
              <div className="row d-flex">
                <button
                  className="btn bg-primary text-white d-inline mr-2 p-1"
                  data-bs-toggle="modal"
                  data-bs-target="#largeModal"
                  onClick={(e) => openModel(row)}
                >
                  <i class="bi bi-eye"></i>
                </button>
              </div>
            </>
          )}
        </>
      ),
      name: "ACTION",
    },
  ];

  const handleBookingDetails = (event) => {
    setEventName(event.eventName);
    dispatch(getBookingBySlotId(event.slotId));
    active == event.slotId ? setActive(null) : setActive(event.slotId);
  };

  const openModel = (e) => {
    dispatch(fetchOrderById(e.bookingId));
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
                    {roster && roster?.resultData?.length > 0
                      ? roster?.resultData?.map((e, i) => {
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
          <div className="card">
            <div className="card-body">
              <div class="modal fade" id="largeModal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered modal-xl">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Order Details</h5>
                      <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close"
                      ></button>
                    </div>
                    <div class="modal-body">
                      <div className="row">
                        <div className="col-md-7">
                          <div className="row">
                            <div className="col-md-6">
                              <div className="card">
                                <div className="card-header">
                                  <h5>
                                    {" "}
                                    <i className="bi bi-person-fill" />
                                    <span className="ms-2">
                                      {orderData?.firstName +
                                        " " +
                                        orderData?.lastName}
                                    </span>
                                  </h5>
                                </div>
                                <div className="card-body  p-3">
                                  <p>
                                    <i className="bi bi-envelope-paper-fill" />
                                    <span className="ms-2">
                                      {orderData?.email}
                                    </span>
                                  </p>
                                  <p>
                                    <i className="bi bi-phone" />
                                    <span className="ms-2">
                                      {orderData?.phone}
                                    </span>
                                  </p>
                                </div>
                              </div>
                            </div>
                            <div className="col-md-6">
                              <div className="card">
                                <div className="card-header">
                                  <h5>ORDER DETAILS</h5>
                                </div>
                                <div className="card-body p-3">
                                  <div className="d-flex flex-column">
                                    <div className="d-flex flex-row justify-content-between">
                                      <p>
                                        <i class="bi bi-hash"></i>
                                        <span className="ms-2">
                                          {"EB000" + orderData?.bookingId}
                                        </span>
                                      </p>
                                      <p>
                                        <i class="bi bi-cart-fill"></i>
                                        <span className="ms-2">1</span>
                                      </p>
                                    </div>
                                    <div className="d-flex flex-row justify-content-between">
                                      <p>
                                        <i class="bi bi-calendar-event-fill"></i>
                                        <span className="ms-2">
                                          {moment(orderData?.date).format(
                                            "DD MMM YYYY"
                                          )}
                                        </span>
                                      </p>
                                      <p>
                                        <i class="bi bi-person-fill"></i>
                                        <span className="ms-2">
                                          {orderData?.guests - 1}
                                        </span>
                                      </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div className="col-md-12">
                              <div className="card">
                                <div className="card-header">
                                  <h5>PAYMENT INFORMATION</h5>
                                </div>
                                <div className="cardbody">
                                  <div className="row d-flex flex-row p-3">
                                    <div className="col-md-7">
                                      <div
                                        className="p-3"
                                        style={{
                                          borderRight: "3px solid #ccc",
                                        }}
                                      >
                                        <h6>{orderData?.eventName}</h6>
                                        <div className="d-flex flex-row justify-content-around">
                                          <p>Guest</p>
                                          <p>{orderData?.guests}X</p>
                                          <p>$ {orderData?.price}.00</p>
                                          <p>$ {orderData?.totalPrice}.00</p>
                                        </div>
                                        <div className="d-flex flex-row justify-content-between mt-4">
                                          <p>Booking Fee</p>
                                          <p>$ 00.00</p>
                                        </div>
                                        <div className="d-flex flex-row justify-content-between">
                                          <p>Total</p>
                                          <p>$ {orderData?.totalPrice}.00</p>
                                        </div>
                                        <div className="d-flex flex-row justify-content-around">
                                          <button className="btn btn-primary">
                                            Add Code
                                          </button>
                                          <button className="btn btn-primary">
                                            Add Charge
                                          </button>
                                        </div>
                                      </div>
                                    </div>
                                    <div className="col-md-5">
                                      <div
                                        className="d-flex flex-row justify-content-between"
                                        style={{
                                          borderBottom: "4px solid #ccc",
                                        }}
                                      >
                                        <p>TOTAL CHARGE</p>
                                        <p>$ 00.00</p>
                                      </div>
                                      <div
                                        className="d-flex flex-row justify-content-between mt-2"
                                        style={{
                                          borderBottom: "4px solid #ccc",
                                        }}
                                      >
                                        <p>Total Payments</p>
                                        <p>$ {orderData?.totalPrice}.00</p>
                                      </div>
                                      <div className="d-flex flex-row justify-content-between mt-2">
                                        <p>Charge Amount</p>
                                        <p>$ 00.00</p>
                                      </div>
                                      <div className="d-flex flex-row justify-content-between">
                                        <p>Balance Due</p>
                                        <p>$ 00.00</p>
                                      </div>
                                      <div className="d-flex flex-row justify-content-between">
                                        <button className="btn btn-primary">
                                          Refund
                                        </button>
                                        <button className="btn btn-primary">
                                          Collect Amount
                                        </button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div className="col-md-5">
                          <div className="card">
                            <div className="card-header">
                              <h5>BOOKING INFORMATION</h5>
                            </div>
                            <div className="card-body">
                              <div className="p-3">
                                <div className="row">
                                  <div className="col-md-8">
                                    <h6>{orderData?.eventName}</h6>
                                    <div className="d-flex flex-column p-2">
                                      <p>
                                        <i className="bi bi-calendar-event-fill" />
                                        <span className="ms-2">
                                          {moment(orderData?.date).format(
                                            "DD MMM YYYY"
                                          )}
                                        </span>
                                      </p>
                                      <p>
                                        <i className="bi bi-clock-fill" />
                                        <span className="ms-2">
                                          {orderData?.eventTime}
                                        </span>
                                      </p>
                                      <p>
                                        <i className="bi bi-person-fill" />
                                        <span className="ms-2">
                                          {orderData?.guests} Guest
                                        </span>
                                      </p>
                                      <p>
                                        <i className="bi bi-hash" />
                                        <span className="ms-2">
                                          {"EB000" + orderData?.bookingId}
                                        </span>
                                      </p>
                                    </div>
                                  </div>
                                  <div className="col-md-4">
                                    <p>
                                      <i class="bi bi-check-circle"></i> Active
                                    </p>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                          <div className="card">
                            <div className="card-header">
                              <h5>Notes</h5>
                            </div>
                            <div className="card-body p-3">
                              <div className="d-flex flex-row justify-content-around">
                                <div className="form-floating">
                                  <input
                                    type="text"
                                    className="form-control"
                                    placeholder="Last Name"
                                    name="notes"
                                  />
                                  <label htmlFor="floatingName">Notes</label>
                                </div>
                                <button
                                  className="btn btn-primary"
                                  style={{
                                    padding: "5px 25px",
                                    fontSize: "18px",
                                  }}
                                >
                                  Save
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
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

export default RosterView;
