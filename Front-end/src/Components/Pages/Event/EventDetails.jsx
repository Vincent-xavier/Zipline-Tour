import React, { useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { useFormik } from "formik";
import moment from "moment";
import * as types from "../../../actions/types";
import * as Yup from "yup";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";
import { eventById } from "../../../actions/Event";
import { saveEventBooking } from "../../../actions/Order";

const EventDetails = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const [counter, setCounter] = useState(0);
  const [totalPrice, settotalPrice] = useState();
  const [eventPrice, seteventPrice] = useState();
  const { eventEditData } = useSelector((state) => state.eventAPI);
  const { id } = useParams();

  useEffect(() => {
    dispatch(eventById(id));
  }, []);


  useEffect(() => {
    setCounter(1);
    seteventPrice(
      eventEditData?.resultData ? eventEditData?.resultData?.price : 10
    );
    settotalPrice(eventPrice);
  }, [setCounter, seteventPrice, settotalPrice, eventPrice, eventEditData]);

  const handleIncre = (e) => {
    setCounter(counter + 1);
    settotalPrice((counter + 1) * eventPrice);
  };

  const handleDecre = (e) => {
    setCounter(counter - 1);
    settotalPrice((counter - 1) * eventPrice);
  };

  // Event Registration Form
  const contactForm = useFormik({
    initialValues: {
      firstName: "",
      lastName: "",
      email: "",
      phone: "",
      totalPrice: "",
      guests: "",
      eventId: "",
      dateId: "",
      scheduleId: "",
      slotId: "",
      eventTime: "",
      eventDate: "",
    },
    validationSchema: Yup.object({
      firstName: Yup.string().required("Enter your first name"),
      lastName: Yup.string().required("Enter your last name"),
      phone: Yup.number().required("Enter your phone"),
    }),

    validate: (values) => {
      let errors = {};
      if (!values.email) {
        errors.email = "Please enter your email";
      } else if (
        !/^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i.test(values.email)
      ) {
        errors.email = "Invalid email address";
      }
      return errors;
    },

    //  Form data get and set Values send to Actions
    onSubmit: (values) => {
      const contactData = {
        userData: {
          firstName: values.firstName,
          lastName: values.lastName,
          email: values.email,
          phone: values.phone,
        },
        totalPrice: totalPrice,
        guests: counter,
        eventId: eventEditData?.resultData
          ? eventEditData?.resultData?.eventId
          : values.eventId,
        dateId: eventEditData?.resultData
          ? eventEditData?.resultData?.dateId
          : values.dateId,
        scheduleId: eventEditData?.resultData
          ? eventEditData?.resultData?.scheduleId
          : values.scheduleId,
        slotId: eventEditData?.resultData
          ? eventEditData?.resultData?.slotId
          : values.slotId,
        eventTime: eventEditData?.resultData
          ? moment(eventEditData?.resultData?.times).format("hh:mm A")
          : "",
        eventDate: eventEditData?.resultData
          ? eventEditData?.resultData?.date
          : "",
      };

      dispatch(saveEventBooking(contactData, navigate));

      console.log(contactData);
    },
  });

  return (
    <>
      <Header />
      <Sidebar />

      <main id="main" className="main">
        <section className="section">
          <div className="container">
            <div className="product-content product-wrap clearfix product-deatil">
              <div className="row">
                <div className="col-md-5 col-sm-12 col-xs-12">
                  <div className="product-image">
                    <img
                      style={{ width: "400px", hight: "400px" }}
                      src={
                        types.IMAGE_PATH + eventEditData?.resultData?.eventImage
                      }
                      className="img-responsive"
                      alt="event image"
                    />
                  </div>
                </div>
                <div className="col-md-offset-1 col-md-6 ms-4 col-sm-12 col-xs-12 ">
                  <h2 className="name">
                    {eventEditData && eventEditData?.resultData?.eventName}
                  </h2>
                  <hr />
                  <h3 className="price-container ms-1">$ {eventPrice}.00</h3>
                  <div class="certified">
                    <ul>
                      <li>
                        <a>
                          Event time
                          <span>
                            {moment(
                              eventEditData && eventEditData?.resultData?.times
                            ).format("hh:mm a")}
                          </span>
                        </a>
                      </li>
                      <li>
                        <a>
                          Event Date
                          <span>
                            {eventEditData &&
                              eventEditData?.resultData?.fullDate}
                          </span>
                        </a>
                      </li>
                      <li>
                        <a>
                          Available
                          <span>
                            {eventEditData &&
                              eventEditData?.resultData?.eventCapacity}{" "}
                          </span>
                        </a>
                      </li>
                    </ul>
                  </div>
                  <div className="mb-8 justify-content-center ">
                    <div className="col-md-6 col-12">
                      <div className="mb-4 border-bottom pb-2"></div>
                      <div className="row">
                        <div className="col-12">
                          <div className="d-flex justify-content-between">
                            <div>
                              <p className="text-dark">Guests</p>
                            </div>
                            <div
                              className="input-group w-auto justify-content-end align-items-center"
                              id="guests"
                            >
                              <input
                                type="button"
                                defaultValue="-"
                                className="button-minus border rounded-circle  icon-shape icon-sm mx-1 "
                                onClick={(e) => handleDecre(e)}
                              />
                              <input
                                type="text"
                                value={counter}
                                name="quantity"
                                disabled
                                className="quantity-field border-0 text-center w-25"
                              />
                              <input
                                type="button"
                                defaultValue="+"
                                onClick={(e) => handleIncre(e)}
                                className="button-plus border rounded-circle icon-shape icon-sm "
                              />
                            </div>
                          </div>
                        </div>

                        <div className="col-12 mt-3 mb-0">
                          <h4>Total $ {totalPrice}.00</h4>
                        </div>
                      </div>
                    </div>
                  </div>
                  <hr />
                  <div
                    className="description description-tabs"
                    style={{ clear: "both" }}
                  >
                    <p style={{ wordWrap: "break-word" }}>
                      {eventEditData &&
                        eventEditData?.resultData?.eventDiscription}
                    </p>
                  </div>
                  <hr />
                </div>
              </div>
            </div>
          </div>
          <div className="container">
            <div className="card offset-md-2 col-md-8 ">
              <div className="card-body">
                <h5 className="card-title">Contact</h5>
                <form className="row g-3" onSubmit={contactForm.handleSubmit}>
                  <input
                    type="hidden"
                    name="eventId"
                    value={contactForm.values.eventId}
                  />
                  <input
                    type="hidden"
                    name="scheduleId"
                    value={contactForm.values.scheduleId}
                  />
                  <input
                    type="hidden"
                    name="dateId"
                    value={contactForm.values.dateId}
                  />
                  <input
                    type="hidden"
                    name="sloatId"
                    value={contactForm.values.slotId}
                  />
                  <input
                    type="hidden"
                    name="eventName"
                    value={contactForm.values.eventName}
                  />

                  <div className="col-md-6">
                    <div className="form-floating">
                      <input
                        type="text"
                        id="floatingName"
                        placeholder="First Name"
                        className={
                          contactForm.touched.firstName &&
                          contactForm.errors.firstName
                            ? "form-control is-invalid"
                            : "form-control input-lg mt-1"
                        }
                        name="firstName"
                        onChange={contactForm.handleChange}
                        value={contactForm.values.firstName}
                        onBlur={contactForm.handleBlur}
                      />
                      <label htmlFor="floatingName">First Name</label>
                    </div>

                    {contactForm.touched.firstName &&
                    contactForm.errors.firstName ? (
                      <small>
                        <span className={"text-danger "}>
                          {contactForm.errors.firstName}
                        </span>
                      </small>
                    ) : null}
                  </div>
                  <div className="col-md-6">
                    <div className="form-floating">
                      <input
                        type="text"
                        className={
                          contactForm.touched.lastName &&
                          contactForm.errors.lastName
                            ? "form-control is-invalid"
                            : "form-control input-lg mt-1"
                        }
                        placeholder="Last Name"
                        name="lastName"
                        onChange={contactForm.handleChange}
                        value={contactForm.values.lastName}
                        onBlur={contactForm.handleBlur}
                      />
                      <label htmlFor="floatingName">Last Name</label>
                    </div>
                    {contactForm.touched.lastName &&
                    contactForm.errors.lastName ? (
                      <small>
                        <span className={"text-danger "}>
                          {contactForm.errors.lastName}
                        </span>
                      </small>
                    ) : null}
                  </div>
                  <div className="col-md-6">
                    <div className="form-floating">
                      <input
                        type="email"
                        className={
                          contactForm.touched.email && contactForm.errors.email
                            ? "form-control is-invalid"
                            : "form-control input-lg mt-1"
                        }
                        placeholder="Email"
                        name="email"
                        onChange={contactForm.handleChange}
                        value={contactForm.values.email}
                        onBlur={contactForm.handleBlur}
                      />
                      <label htmlFor="floatingEmail">Your Email</label>
                      {contactForm.touched.email && contactForm.errors.email ? (
                        <small>
                          <span className={"text-danger "}>
                            {contactForm.errors.email}
                          </span>
                        </small>
                      ) : null}
                    </div>
                  </div>
                  <div className="col-md-6">
                    <div className="form-floating">
                      <input
                        type="text"
                        className={
                          contactForm.touched.phone && contactForm.errors.phone
                            ? "form-control is-invalid"
                            : "form-control input-lg mt-1"
                        }
                        placeholder="Phone"
                        name="phone"
                        onChange={contactForm.handleChange}
                        value={contactForm.values.phone}
                        onBlur={contactForm.handleBlur}
                      />
                      <label htmlFor="floatingEmail">Your phone</label>
                    </div>
                    {contactForm.touched.phone && contactForm.errors.phone ? (
                      <small>
                        <span className={"text-danger "}>
                          {contactForm.errors.phone}
                        </span>
                      </small>
                    ) : null}
                  </div>
                  <div className="text-center">
                    <button type="submit" className="btn btn-primary">
                      Continue
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
};

export default EventDetails;
