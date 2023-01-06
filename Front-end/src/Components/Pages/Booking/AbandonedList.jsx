import React, { useEffect } from "react";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";
import DataTable from "react-data-table-component";
import { useDispatch, useSelector } from "react-redux";
import { fetchbooking } from "../../../actions/Order";
import moment from "moment";
import "@animxyz/core";
import { useNavigate } from "react-router-dom";
import { encryptSingleData } from "../../../actions/types";

const AbandonedList = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const { bookingdata } = useSelector((state) => state.orderAPI);
  const [bData, setBData] = React.useState();
  const [pending, setPending] = React.useState(true);

  useEffect(() => {
    dispatch(fetchbooking());
  }, []);

  useEffect(() => {
    const timeout = setTimeout(() => {
      setBData(bookingdata?.resultData);
      setPending(false);
    }, 2000);
    return () => clearTimeout(timeout);
  }, [bookingdata?.resultData]);

  const redirectPayment = (bookingId) => {
    const encryptId = encryptSingleData(bookingId);
    navigate(`/payment/${encryptId}`);
  };

  const columns = [
    {
      cell: (row) => (
        <div className="d-flex justify-content-center">
            <button
              className="btn bg-warning text-center d-inline  pr-1 pl-1"
              onClick={(e) => redirectPayment(row?.bookingId)}
              id={row?.bookingId}
            >
              <i class="bi bi-pencil-square"></i>
            </button>
        </div>
      ),
      name: "ACTION",
    },
    {
      name: "Booking code",
      selector: (row) => "EB00" + row?.bookingId,
    },
    {
      name: "Event Name",
      selector: (row) => row?.eventName,
      sortable: true,
    },
    {
      name: "Event Time",
      selector: (row) => moment(row?.eventTime, ["hh:mm A"]).format("hh:mm A"),
    },
    {
      name: "Event Day",
      selector: (row) => moment(row?.eventDate).format("dddd"),
    },
    {
      name: "Event Date",
      selector: (row) => moment(row?.eventDate).format("DD-MM-YYYY"),
      sortable: true,
    },
  ];

  return (
    <>
      <Header />
      <Sidebar />

      <main id="main" className="main">
        <section className="section">
          <div className="container">
            <div className="card">
              <div className="card-body" xyz="fade small-100%">
                <DataTable
                  title={"Abandoned Orders"}
                  columns={columns}
                  data={bData}
                  pagination
                  fixedHeader
                  progressPending={pending}
                  fixedHeaderScrollHeight="450px"
                />
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
};

export default AbandonedList;
