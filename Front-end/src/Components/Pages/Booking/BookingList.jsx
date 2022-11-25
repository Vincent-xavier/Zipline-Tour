import React, { useEffect } from "react";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";

import DataTable from "react-data-table-component";
import { useDispatch, useSelector } from "react-redux";
import { fetchbooking } from "../../../actions/Order";
import moment from "moment";
import "@animxyz/core";

const BookingList = () => {
  const dispatch = useDispatch();
  const { bookingdata } = useSelector((state) => state.orderAPI);
  const [bData, setBData] = React.useState();

  useEffect(() => {
    dispatch(fetchbooking());
    if (bookingdata) {
      setBData(bookingdata?.resultData);
    }
    
  }, [bData]);

  const columns = [
    {
      name: "Booking code",
      selector: (row) => row.bookingId,
    },
    {
      name: "Event Name",
      selector: (row) => row.eventName,
      sortable: true,
    },
    {
      name: "Event Time",
      selector: (row) => row.eventTime,
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
    {
      name: "Action",
      //   selector: (row) => row.title,
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
                  title={"Booking List"}
                  columns={columns}
                  data={bData}
                  pagination
                  fixedHeader
                  fixedHeaderScrollHeight="300px"
                  highlightOnHover
                  pointerOnHover
                />

                {/* Table with stripped rows */}
                {/* <table className="table table-striped">
                  <thead>
                    <tr>
                      <th scope="col">Booking code</th>
                      <th scope="col">Event Name</th>
                      <th scope="col">Event Time</th>
                      <th scope="col">Event Day</th>
                      <th scope="col">Event Date</th>
                      <th scope="col">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>Brandon Jacob</td>
                      <td>10:30</td>
                      <td>Wednesday</td>
                      <td>2016-05-25</td>
                      <td>
                        <i className="bi bi-trash" />
                        <i className="bi bi-eye ms-2" />
                      </td>
                    </tr>
                  </tbody>
                </table> */}
                {/* End Table with stripped rows */}
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
};

export default BookingList;
