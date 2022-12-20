import "@animxyz/core";
import * as Yup from "yup";
import { useState } from "react";
import { useFormik } from "formik";
import moment from "moment/moment";
import Header from "../../Layout/Header";
import React, { useEffect } from "react";
import Sidebar from "../../Layout/Sidebar";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate, useParams } from "react-router-dom";
import { decryptSingleData } from "../../../actions/types";
import { bookingDetails, savePayment } from "../../../actions/Order";

const Payment = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const {  customerDetails } = useSelector(
    (state) => state?.orderAPI
  );
  const [customer, setCustomer] = useState();
  const { bookingId } = useParams();

  const cusData = JSON.parse(localStorage.getItem("customerData"));

  useEffect(() => {
    if (bookingId) {
      localStorage.removeItem("customerData")
      const dcryptId = decryptSingleData(bookingId);
      dispatch(bookingDetails(dcryptId));
    }
  }, [bookingId]);

  useEffect(() => {
    setCustomer(
      customerDetails?.resultData
        ? customerDetails?.resultData
        : cusData?.resultData
    );
  }, []);

  const paymentForm = useFormik({
    initialValues: {
      PayerName: "",
      cardNumber: "",
      expiryDate: "",
      cvv: "",
    },
    validationSchema: Yup.object({
      PayerName: Yup.string().required("Enter Card Holder Name").max(50),
      cardNumber: Yup.number().required("Enter Card Number"),
      cvv: Yup.number().required("Enter cvv Number"),
    }),
    onSubmit: (values) => {
      const paymentData = {
        PayerName: values.PayerName,
        cardNumber: values.cardNumber,
        expiryDate: values.expiryDate,
        cvv: values.cvv,
        bookingId: customerDetails?.resultData
          ? customerDetails?.resultData?.listBooking[0]?.bookingId
          : cusData?.resultData?.listBooking[0]?.bookingId,
      };
      dispatch(savePayment(paymentData, navigate));
      console.log(paymentData);
    },
  });

  return (
    <>
      <Header />
      <Sidebar />

      <main id="main" className="main">
        <section className="section">
          <div className="container">
            <div className="row">
              <div
                className="card col-md-5 xyz-in"
                xyz="fade  flip-left perspective-1"
              >
                <div className="card-body xyz-none xyz-in">
                  <h3 className="card-title">Shopping Cart</h3>
                  <div className="card shadow-sm ">
                    <div className="card-body xyz-nested">
                      <h5 className="card-title">
                        {customer?.listBooking[0]?.eventName}
                      </h5>
                      <ul style={{ display: "flex", listStyleType: "none" }}>
                        <li className="p-2">
                          {customer?.listBooking[0]?.eventTime}
                        </li>
                        <li className="p-2">
                          {moment(customer?.listBooking[0]?.eventDate).format(
                            "dddd"
                          )}
                        </li>
                        <li className="p-2">
                          {moment(customer?.listBooking[0]?.eventDate).format(
                            "MMM DD"
                          )}
                        </li>
                      </ul>
                      <div className="row d-flex">
                        <div className="col-md-4">
                          Guest
                          <span className="ms-5">
                            {customer?.listBooking[0]?.guests} X
                          </span>
                        </div>
                        <div className="col-md-4 text-center">
                          $ {customer?.listBooking[0]?.price}.00
                        </div>
                        <div className="col-md-4 text-center">
                          $ {customer?.listBooking[0]?.totalPrice}.00
                        </div>
                      </div>
                      <div className="d-block mt-3">
                        <h6 className="d-inline">Booking fee</h6>
                        <span className="p-0 m-0" style={{ float: "right" }}>
                          $ 00.00
                        </span>
                      </div>
                      <div className="d-block mt-3">
                        <h6 className="d-inline">Total</h6>
                        <span className="p-0 m-0" style={{ float: "right" }}>
                          $ {customer?.listBooking[0]?.totalPrice}.00
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div
                className="card col-md-5 ms-5 xyz-in"
                xyz="fade flip-left perspective-1"
              >
                <div className="card-body">
                  <h3 className="card-title">Payment Method</h3>
                  <div className="row">
                    <div className="col-md-12">
                      <div className="form-check">
                        <input
                          className="form-check-input"
                          type="radio"
                          name="card"
                          defaultChecked
                        />
                        <label
                          className="form-check-label radio-inline"
                          htmlFor="radio"
                        >
                          New card
                        </label>
                      </div>
                      <hr />
                      <h3 className="card-title">Payment</h3>
                      <form className="row" onSubmit={paymentForm.handleSubmit}>
                        <div className="col-md-12">
                          <label htmlFor="inputName5" className="form-label">
                            Card Holder Name
                          </label>
                          <input
                            type="text"
                            className={
                              paymentForm.touched.PayerName &&
                              paymentForm.errors.PayerName
                                ? "form-control is-invalid"
                                : "form-control"
                            }
                            name="PayerName"
                            maxLength={50}
                            onChange={paymentForm.handleChange}
                            value={paymentForm.values.PayerName}
                            onBlur={paymentForm.handleBlur}
                          />
                          {paymentForm.touched.PayerName &&
                          paymentForm.errors.PayerName ? (
                            <small className="text-danger ">
                              {paymentForm.errors.PayerName}
                            </small>
                          ) : null}
                        </div>
                        <div className="col-md-12 mt-2">
                          <label htmlFor="inputName5" className="form-label">
                            Credit Card Number
                          </label>
                          <input
                            type="text"
                            className={
                              paymentForm.touched.cardNumber &&
                              paymentForm.errors.cardNumber
                                ? "form-control is-invalid"
                                : "form-control"
                            }
                            maxLength={16}
                            name="cardNumber"
                            onChange={paymentForm.handleChange}
                            value={paymentForm.values.cardNumber}
                            onBlur={paymentForm.handleBlur}
                          />
                          {paymentForm.touched.cardNumber &&
                          paymentForm.errors.cardNumber ? (
                            <small className="text-danger ">
                              {paymentForm.errors.cardNumber}
                            </small>
                          ) : null}
                        </div>
                        <div className="col-6 mt-2">
                          <label htmlFor="Expiry date" className="form-label">
                            Expiry date
                          </label>
                          <input
                            type="month"
                            className={
                              paymentForm.touched.expiryDate &&
                              paymentForm.errors.expiryDate
                                ? "form-control is-invalid"
                                : "form-control"
                            }
                            name="expiryDate"
                            onChange={paymentForm.handleChange}
                            value={paymentForm.values.expiryDate}
                            onBlur={paymentForm.handleBlur}
                          />
                          {paymentForm.touched.expiryDate &&
                          paymentForm.errors.expiryDate ? (
                            <small className="text-danger ">
                              {paymentForm.errors.expiryDate}
                            </small>
                          ) : null}
                        </div>
                        <div className="col-3 mt-2">
                          <label htmlFor="CVV" className="form-label">
                            CVV
                          </label>

                          <input
                            type="number"
                            id="CVV"
                            maxLength={3}
                            className={
                              paymentForm.touched.cvv && paymentForm.errors.cvv
                                ? "form-control is-invalid"
                                : "form-control"
                            }
                            name="cvv"
                            onChange={paymentForm.handleChange}
                            value={paymentForm.values.cvv}
                            onBlur={paymentForm.handleBlur}
                          />
                          {paymentForm.touched.cvv && paymentForm.errors.cvv ? (
                            <small className="text-danger ">
                              {paymentForm.errors.cvv}
                            </small>
                          ) : null}
                        </div>

                        <div className="text-center mt-4">
                          <button type="submit" className="btn btn-primary">
                            Pay Now
                          </button>
                        </div>
                      </form>
                      {/* End Multi Columns Form */}
                    </div>
                  </div>
                </div>
              </div>

              <div
                className="card col-md-5 xyz-in"
                xyz="small-100% origin-top-right"
              >
                <div className="card-body ">
                  <h5 className="card-title">Contact Information</h5>
                  <div className="ms-4 mt-0">
                    <h6>
                      {customer?.listUser[0]?.firstName +
                        " " +
                        customer?.listUser[0]?.lastName}
                    </h6>
                    <h6>{customer && customer?.listUser[0]?.email}</h6>
                    <h6>{customer?.listUser[0]?.phone}</h6>
                  </div>
                  <button className="mt-2 btn btn-success" type="button">
                    Change{" "}
                  </button>
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
};

export default Payment;
