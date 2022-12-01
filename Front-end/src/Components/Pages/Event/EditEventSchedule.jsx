import "react-datepicker/dist/react-datepicker.css";
import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link, useParams } from "react-router-dom";
import ReactDatePicker from "react-datepicker";
import { useFormik } from "formik";
import moment from "moment/moment";
import * as Yup from "yup";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";
import {
  eventDetailsById,
  listSchedule,
  saveEvent,
  saveEventSchedule,
  ScheduleById,
} from "../../../actions/Event";
import * as types from "../../../actions/types";

const EditEventSchedule = () => {
  const dispatch = useDispatch();

  const { eventDetails, eventSchedule, scheduleDetails, success } = useSelector(
    (state) => state.eventAPI
  );

  const { id } = useParams();
  const eventId = id;
  const [fileSelected, setFileSelected] = useState();
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndDate] = useState(null);
  const [scheduleData, setScheduleData] = useState();
  const [inputActivitiesFields, setInputActivitiesFields] = useState([
    {
      ActivitiesData: "",
    },
  ]);
  var times = inputActivitiesFields
  .map((t) => moment(t.ActivitiesData, ["hh:mm A"]).format("hh:mm A"))
  .join();

  useEffect(() => {
    if (eventId) {
      dispatch(eventDetailsById(eventId));
    }
  }, []);

  useEffect(() => {
    if (scheduleDetails?.resultData) {
      setScheduleData(scheduleDetails?.resultData);
      const dateFrom = scheduleDetails?.resultData?.dateFrom.split("T")?.[0];
      setStartDate(new Date(dateFrom));
      const dateTo = scheduleDetails?.resultData?.dateTo.split("T")?.[0];
      setEndDate(new Date(dateTo));
      const times = scheduleDetails?.resultData?.times.split(",");
      var newTimes = handleTimesToArray(times);
      setInputActivitiesFields(newTimes);
    }
  }, [scheduleDetails?.resultData]);

  const handleTimesToArray = (times) => {
    var nietos = [];
    var obj = {};
    var i;
    for (i = 0; i < times.length; i++) {
      var obj = {};
      obj["ActivitiesData"] = moment(times[i], ["hh:mm A"]).format("HH:mm");
      nietos.push(obj);
    }
    return nietos;
  };

  const handleNewSchedule = () => {
    dispatch({ type: types.CLEAR_SCHEDULE });
  };
  
  const handleOpenAccordin = (id) => {
    dispatch(ScheduleById(id));
  };

  const handleScheduleDetails = () => {
    if (eventId > 0) {
      dispatch(listSchedule(eventId));
    } else {
      dispatch({ type: types.LIST_SCHEDULE_REQUEST });
    }
  };

  const saveFileSelected = (e) => {
    setFileSelected(e.target.files[0]);
  };


  const addInputActivitiesField = () => {
    setInputActivitiesFields([
      ...inputActivitiesFields,
      {
        ActivitiesData: "",
      },
    ]);
  };
  
  const handleActivitiesChange = (index, evnt) => {
    const { name, value } = evnt.target;
    const list = [...inputActivitiesFields];
    list[index][name] = value;
    setInputActivitiesFields(list);
  };
  
  const removeInputActivitiesFields = (index) => {
    const rows = [...inputActivitiesFields];
    rows.pop();
    setInputActivitiesFields(rows);
  };

  // Event Registration Form
  const eventForm = useFormik({
    enableReinitialize: true,
    initialValues: {
      eventId: eventDetails ? eventDetails?.resultData?.eventId : 0,
      eventName: eventDetails ? eventDetails?.resultData?.eventName : "",
      price: eventDetails ? eventDetails?.resultData?.price : "",
      max_Booking: eventDetails ? eventDetails?.resultData?.max_Booking : "",
      min_Booking: eventDetails ? eventDetails?.resultData?.min_Booking : "",
      eventCapacity: eventDetails
        ? eventDetails?.resultData?.eventCapacity
        : "",
      eventDiscription: eventDetails
        ? eventDetails?.resultData?.eventDiscription
        : "",
      imgFile: "",
    },
    validationSchema: Yup.object({
      eventName: Yup.string().required("Enter event title"),
      price: Yup.string().required("Enter price amount"),
      min_Booking: Yup.number().required("Enter minimum Booking"),
      max_Booking: Yup.number().required("Enter maximum Booking"),
      eventDiscription: Yup.string().required("Enter event discription"),
      eventCapacity: Yup.string().required("Enter Capacity"),
    }),
    onSubmit: (values) => {
      const formData = {
        eventId: values.eventId,
        eventName: values.eventName,
        price: values.price,
        max_Booking: values.max_Booking,
        min_Booking: values.min_Booking,
        eventCapacity: values.eventCapacity,
        eventDiscription: values.eventDiscription,
        imgFile: fileSelected,
        eventImage: eventDetails?.resultData?.eventImage,
      };
      dispatch(saveEvent(formData));
    },
  });


  //Event Schedule Form
  const eventScheduleForm = useFormik({
    enableReinitialize: true,

    initialValues: {
      name: scheduleData ? scheduleData?.name : "",
      dateFrom: "",
      dateTo: "",
      times: "",
      eventId: scheduleData ? scheduleData?.eventId : "",
    },
    validationSchema: Yup.object({
      name: Yup.string().required("Enter schedule name"),
      eventId: Yup.number(),
    }),
    onSubmit: (values) => {
      const scheduleData = {
        name: values.name,
        dateFrom: startDate,
        dateTo: endDate,
        times: times,
        eventId: eventId,
      };

      dispatch(saveEventSchedule(scheduleData));

      console.log(scheduleData);
    },
  });

  return (
    <>
      <Header />
      <Sidebar />

      <main id="main" className="main">
        <section className="section">
          <div className="container">
            <div className="card">
              <div className="card-body">
                <h5 className="card-title">Update Events</h5>
                <ul
                  className="nav nav-tabs nav-tabs-bordered"
                  id="borderedTab"
                  role="tablist"
                >
                  <li className="nav-item" role="presentation">
                    <button
                      className="nav-link active"
                      id="home-tab"
                      data-bs-toggle="tab"
                      data-bs-target="#bordered-home"
                      type="button"
                      role="tab"
                      aria-controls="home"
                      aria-selected="true"
                    >
                      Discription
                    </button>
                  </li>
                  <li className="nav-item" role="presentation">
                    <button
                      className="nav-link"
                      id="contact-tab"
                      data-bs-toggle="tab"
                      data-bs-target="#bordered-contact"
                      type="button"
                      role="tab"
                      aria-controls="contact"
                      aria-selected="false"
                      onClick={() => handleScheduleDetails()}
                    >
                      Schedule
                    </button>
                  </li>
                </ul>
                <div className="tab-content pt-2" id="borderedTabContent">
                  <div
                    className="card  col-md-8 tab-pane fade show active"
                    id="bordered-home"
                    role="tabpanel"
                    aria-labelledby="home-tab"
                  >
                    <div className="card-body">
                      <h5 className="card-title">Discription</h5>
                      <form onSubmit={eventForm.handleSubmit}>
                        <input type="hidden" name="eventId" />
                        <div className="row mt-3">
                          <div className="col-md-6">
                            <div className="form-floating">
                              <input
                                type="text"
                                id="floatingName"
                                placeholder="Event Title"
                                className={
                                  eventForm.touched.eventName &&
                                  eventForm.errors.eventName
                                    ? "form-control is-invalid"
                                    : "form-control"
                                }
                                name="eventName"
                                onChange={eventForm.handleChange}
                                value={eventForm.values.eventName}
                                onBlur={eventForm.handleBlur}
                              />
                              <label htmlFor="floatingName">Event Title</label>
                            </div>
                            {eventForm.touched.eventName &&
                            eventForm.errors.eventName ? (
                              <small>
                                <span className={"text-danger "}>
                                  {eventForm.errors.eventName}
                                </span>
                              </small>
                            ) : null}
                          </div>

                          <div className="col-md-6">
                            <div className="form-floating">
                              <input
                                type="text"
                                className={
                                  eventForm.touched.price &&
                                  eventForm.errors.price
                                    ? "form-control is-invalid"
                                    : "form-control"
                                }
                                id="floatingName"
                                placeholder="Price"
                                name="price"
                                onChange={eventForm.handleChange}
                                value={eventForm.values.price}
                                onBlur={eventForm.handleBlur}
                              />
                              <label htmlFor="floatingName">Price</label>
                            </div>
                            {eventForm.touched.price &&
                            eventForm.errors.price ? (
                              <small>
                                <span className={"text-danger "}>
                                  {eventForm.errors.price}
                                </span>
                              </small>
                            ) : null}
                          </div>
                        </div>

                        <div className="row mt-3">
                          <div className="col-md-6">
                            <div className="form-floating">
                              <input
                                type="number"
                                className={
                                  eventForm.touched.price &&
                                  eventForm.errors.price
                                    ? "form-control is-invalid"
                                    : "form-control"
                                }
                                id="floatingName"
                                placeholder="eventCapacity"
                                name="eventCapacity"
                                onChange={eventForm.handleChange}
                                value={eventForm.values.eventCapacity}
                                onBlur={eventForm.handleBlur}
                              />
                              <label htmlFor="floatingName">
                                eventCapacity
                              </label>
                            </div>
                            {eventForm.touched.eventCapacity &&
                            eventForm.errors.eventCapacity ? (
                              <small>
                                <span className={"text-danger "}>
                                  {eventForm.errors.eventCapacity}
                                </span>
                              </small>
                            ) : null}
                          </div>
                        </div>

                        <div className="row mt-3">
                          <div className="col-md-6">
                            <div className="form-floating">
                              <input
                                type="number"
                                className={
                                  eventForm.touched.min_Booking &&
                                  eventForm.errors.min_Booking
                                    ? "form-control is-invalid"
                                    : "form-control"
                                }
                                id="floatingName"
                                placeholder="Maximum Booking"
                                name="min_Booking"
                                onChange={eventForm.handleChange}
                                value={eventForm.values.min_Booking}
                                onBlur={eventForm.handleBlur}
                              />
                              <label htmlFor="floatingName">
                                Manimum Booking
                              </label>
                            </div>
                            {eventForm.touched.min_Booking &&
                            eventForm.errors.min_Booking ? (
                              <small>
                                <span className={"text-danger "}>
                                  {eventForm.errors.min_Booking}
                                </span>
                              </small>
                            ) : null}
                          </div>
                          <div className="col-md-6">
                            <div className="form-floating">
                              <input
                                type="number"
                                className={
                                  eventForm.touched.max_Booking &&
                                  eventForm.errors.max_Booking
                                    ? "form-control is-invalid"
                                    : "form-control"
                                }
                                id="floatingName"
                                placeholder="Minimum Booking"
                                name="max_Booking"
                                onChange={eventForm.handleChange}
                                value={eventForm.values.max_Booking}
                                onBlur={eventForm.handleBlur}
                              />
                              <label htmlFor="floatingName">
                                Miximum Booking
                              </label>
                            </div>
                            {eventForm.touched.max_Booking &&
                            eventForm.errors.max_Booking ? (
                              <small>
                                <span className={"text-danger "}>
                                  {eventForm.errors.max_Booking}
                                </span>
                              </small>
                            ) : null}
                          </div>
                          <div className="col-12 mt-3">
                            <div className="form-floating">
                              <textarea
                                className={
                                  eventForm.touched.eventDiscription &&
                                  eventForm.errors.eventDiscription
                                    ? "form-control is-invalid"
                                    : "form-control"
                                }
                                placeholder="Event Discription"
                                id="floatingTextarea"
                                style={{ height: 100 }}
                                defaultValue={""}
                                name="eventDiscription"
                                onChange={eventForm.handleChange}
                                value={eventForm.values.eventDiscription}
                                onBlur={eventForm.handleBlur}
                              />
                              <label htmlFor="floatingTextarea">
                                Event Discription
                              </label>
                            </div>
                            {eventForm.touched.eventDiscription &&
                            eventForm.errors.eventDiscription ? (
                              <small>
                                <span className={"text-danger "}>
                                  {eventForm.errors.eventDiscription}
                                </span>
                              </small>
                            ) : null}
                          </div>
                        </div>
                        <div className="row mt-3">
                          <div className="col-md-12">
                            <div className="form-group border-0">
                              <label htmlFor="image">Event background</label>
                              <input
                                type="file"
                                className={
                                  eventForm.touched.imgFile &&
                                  eventForm.errors.imgFile
                                    ? "form-control is-invalid"
                                    : "form-control input-lg mt-1"
                                }
                                accept="image/*"
                                name="imgFile"
                                onChange={(e) => saveFileSelected(e)}
                              />
                            </div>
                          </div>
                          {eventForm.touched.imgFile &&
                          eventForm.errors.imgFile ? (
                            <small>
                              <span className={"text-danger"}>
                                {eventForm.errors.imgFile}
                              </span>
                            </small>
                          ) : null}
                        </div>
                        <div className="text-center mt-3">
                          <button type="submit" className="btn btn-primary">
                            Save
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                  <div
                    className="tab-pane fade"
                    id="bordered-contact"
                    role="tabpanel"
                    aria-labelledby="contact-tab"
                  >
                    <div className="card">
                      <div className="card-body">
                        <h5 className="card-title">New Schedule</h5>
                        <ul
                          className="nav nav-pills mb-3"
                          id="pills-tab"
                          role="tablist"
                        >
                          <li className="nav-item" role="presentation">
                            <button
                              className="nav-link active"
                              id="pills-home-tab"
                              data-bs-toggle="pill"
                              data-bs-target="#pills-home"
                              type="button"
                              role="tab"
                              aria-controls="pills-home"
                              aria-selected="true"
                            >
                              All
                            </button>
                          </li>
                          <li className="nav-item" role="presentation">
                            <button
                              className="nav-link"
                              id="pills-profile-tab"
                              data-bs-toggle="pill"
                              data-bs-target="#pills-profile"
                              type="button"
                              role="tab"
                              aria-controls="pills-profile"
                              aria-selected="false"
                            >
                              Active
                            </button>
                          </li>
                          <li className="nav-item" role="presentation">
                            <button
                              className="nav-link"
                              id="pills-contact-tab"
                              data-bs-toggle="pill"
                              data-bs-target="#pills-contact"
                              type="button"
                              role="tab"
                              aria-controls="pills-contact"
                              aria-selected="false"
                            >
                              Expried
                            </button>
                          </li>
                        </ul>
                        <div className="tab-content pt-2" id="myTabContent">
                          <div
                            className="tab-pane fade show active"
                            id="pills-home"
                            role="tabpanel"
                            aria-labelledby="home-tab"
                          >
                            {eventSchedule &&
                              eventSchedule.resultData.map((schedule) => {
                                return (
                                  <p
                                    onClick={() =>
                                      handleOpenAccordin(schedule.scheduleId)
                                    }
                                  >
                                    <Link
                                      to={"#flush-collapseOne"}
                                      data-bs-toggle="collapse"
                                    >
                                      {schedule?.name +
                                        " - " +
                                        moment(schedule?.dateFrom).format(
                                          "DD-MM-YYYY"
                                        ) +
                                        " untill  " +
                                        moment(schedule?.dateTo).format(
                                          "DD-MM-YYYY"
                                        ) +
                                        " " +
                                        schedule?.times}
                                    </Link>
                                  </p>
                                );
                              })}
                          </div>
                          <div
                            className="tab-pane fade"
                            id="pills-profile"
                            role="tabpanel"
                            aria-labelledby="profile-tab"
                          ></div>
                          <div
                            className="tab-pane fade"
                            id="pills-contact"
                            role="tabpanel"
                            aria-labelledby="contact-tab"
                          ></div>
                        </div>
                      </div>
                    </div>
                    <div
                      className="accordion accordion-flush"
                      id="accordionFlushExample"
                    >
                      <div className="accordion-item">
                        <h2 className="accordion-header" id="flush-headingOne">
                          <button
                            className="accordion-button "
                            type="button"
                            data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseOne"
                            aria-expanded="false"
                            aria-controls="flush-collapseOne"
                            onClick={() => handleNewSchedule()}
                          >
                            + New Schedule
                          </button>
                        </h2>
                        <div
                          id="flush-collapseOne"
                          className="accordion-collapse collapse"
                          aria-labelledby="flush-headingOne"
                          data-bs-parent="#accordionFlushExample"
                        >
                          <div className="card">
                            <div className="card-body">
                              <form
                                className="row g-3 mt-2"
                                onSubmit={eventScheduleForm.handleSubmit}
                              >
                                <input type="hidden" name="eventId" />
                                <div className="col-md-3">
                                  <label
                                    htmlFor="inputName5"
                                    className="form-label"
                                  >
                                    Name
                                  </label>
                                  <input
                                    type="text"
                                    className="form-control"
                                    id="inputName5"
                                    name="name"
                                    onChange={eventScheduleForm.handleChange}
                                    value={eventScheduleForm.values.name}
                                    onBlur={eventScheduleForm.handleBlur}
                                  />

                                  {eventScheduleForm.touched.name &&
                                  eventScheduleForm.errors.name ? (
                                    <small>
                                      <span className={"text-danger "}>
                                        {eventScheduleForm.errors.name}
                                      </span>
                                    </small>
                                  ) : null}
                                </div>

                                <div className="row mt-4">
                                  <div className="col-md-6">
                                    <div className="row">
                                      <div className="col-md-3">
                                        <fieldset className="mb-3">
                                          <legend className="col-form-label pt-0 ">
                                            Time slots
                                          </legend>
                                          <div className="form-check ">
                                            <input
                                              className="form-check-input"
                                              type="radio"
                                              name="fixed"
                                              defaultChecked
                                            />
                                            <label
                                              className="form-check-label radio-inline"
                                              htmlFor="radio"
                                            >
                                              Fixed times
                                            </label>
                                          </div>
                                        </fieldset>
                                      </div>
                                    </div>
                                  </div>

                                  {inputActivitiesFields.map((data, index) => {
                                    const { ActivitiesData } = data;
                                    return (
                                      <>
                                        <div className="col-sm-2">
                                          <input
                                            type="time"
                                            id="timeSloat"
                                            className="form-control"
                                            name="ActivitiesData"
                                            onChange={(evnt) =>
                                              handleActivitiesChange(
                                                index,
                                                evnt
                                              )
                                            }
                                            value={ActivitiesData}
                                          />
                                        </div>
                                      </>
                                    );
                                  })}
                                </div>
                                <div className="row mt-2">
                                  <div className="offset-md-6  col-6">
                                    {inputActivitiesFields.length <= 4 ? (
                                      <>
                                        <button
                                          type="button"
                                          className="btn btn-primary me-3"
                                          // onClick={() => handleTimeSloat()}
                                          onClick={addInputActivitiesField}
                                        >
                                          Add
                                        </button>
                                      </>
                                    ) : null}

                                    {inputActivitiesFields.length !== 1 ? (
                                      <button
                                        type="button"
                                        className="btn btn-outline-danger bg-danger text-white"
                                        // onClick={setNoOfRows(noOfRows - 1)}
                                        onClick={removeInputActivitiesFields}
                                      >
                                        Delete
                                      </button>
                                    ) : null}
                                  </div>
                                </div>

                                <div className="col-6">
                                  <label
                                    htmlFor="inputAddress5"
                                    className="form-label"
                                  >
                                    Valid from
                                  </label>
                                  <ReactDatePicker
                                    selected={startDate}
                                    dateFormat="yyyy/MM/dd"
                                    onChange={(date) => setStartDate(date)}
                                    minDate={new Date()}
                                    showDisabledMonthNavigation
                                  />
                                </div>

                                <div className="col-6">
                                  <label
                                    htmlFor="inputAddress2"
                                    className="form-label"
                                  >
                                    Until
                                  </label>
                                  <ReactDatePicker
                                    selected={endDate}
                                    dateFormat="yyyy/MM/dd"
                                    onChange={(date) => setEndDate(date)}
                                    minDate={new Date()}
                                    showDisabledMonthNavigation
                                  />
                                </div>

                                <div className="text-center mt-4">
                                  <button
                                    type="submit"
                                    className="btn btn-primary"
                                  >
                                    Submit
                                  </button>
                                  <button
                                    type="button"
                                    className="btn btn-outline-danger bg-danger text-white ms-3"
                                  >
                                    cancel
                                  </button>
                                </div>
                              </form>
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

export default EditEventSchedule;
