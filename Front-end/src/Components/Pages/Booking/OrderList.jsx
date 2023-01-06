import React, { useEffect, useMemo, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchOrderById, fetchOrders } from "../../../actions/Order";
import MaterialReactTable from "material-react-table";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";
import moment from "moment";

const OrderList = () => {
  const dispatch = useDispatch();
  const [bData, setBData] = useState();
  const { bookingdata, orderDetails } = useSelector((state) => state?.orderAPI);
  const [orderData, setOrderData] = useState();

  const Data = [
    {
      date: "No data Found",
    },
  ];
  console.log(orderData);

  useEffect(() => {
    dispatch(fetchOrders());
  }, []);

  useEffect(() => {
    if (bookingdata) {
      setBData(bookingdata?.resultData);
    }
    if (orderDetails) {
      setOrderData(orderDetails?.resultData);
    }
  }, [bookingdata?.resultData, bData, orderDetails?.resultData]);

  const columns = useMemo(
    () => [
      {
        header: "Name",
        accessorKey: "eventName",
      },
      {
        header: "Customer",
        accessorKey: "firstName",
        size: 80,
      },
      {
        header: "Guests",
        accessorKey: "guests",
        size: 80,
      },
      {
        header: "Amount",
        accessorKey: "totalPrice",
        size: 80,
      },
      {
        header: "Order Date",
        accessorKey: "bookingDate",
      },
      {
        header: "Order Status",
        accessorKey: "paymentStatus",
        size: 80,
      },
    ],
    []
  );

  const openModel = (e) => {
    dispatch(fetchOrderById(e.bookingId));
  };

  return (
    <>
      <Header />
      <Sidebar />

      <main id="main" className="main">
        <section className="section">
          <MaterialReactTable
            columns={columns}
            data={bData ? bData : Data}
            enableRowActions
            renderRowActions={({ row }) => (
              <div
                style={{ display: "flex", flexWrap: "nowrap", gap: "0.5rem" }}
              >
                <button
                  className="btn bg-primary text-white"
                  data-bs-toggle="modal"
                  data-bs-target="#largeModal"
                  onClick={(e) => openModel(row.original)}
                >
                  Show
                </button>
              </div>
            )}
          />

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
                                  <h5> <i className="bi bi-person-fill" />
                                    <span className="ms-2">
                                      {orderData?.firstName +
                                        " " +
                                        orderData?.lastName}
                                    </span></h5>
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

export default OrderList;
