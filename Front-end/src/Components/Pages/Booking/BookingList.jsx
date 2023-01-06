import React, { useEffect, useMemo, useState } from "react";
import { Link } from "react-router-dom";
import Header from "../../Layout/Header";
import Sidebar from "../../Layout/Sidebar";

import MaterialReactTable from "material-react-table";
import { useDispatch, useSelector } from "react-redux";
import { fetchOrders } from "../../../actions/Order";

const BookingList = () => {
    const dispatch = useDispatch();
    const { bookingdata } = useSelector((state) => state?.orderAPI);
    const [bData, setBData] = useState();
  
    console.log(bookingdata);
  
    const Data = [
      {
        date: "No data Found",
      },
    ];
  
    useEffect(() => {
      dispatch(fetchOrders());
    }, []);
  
    useEffect(() => {
      if (bookingdata) {
        setBData(bookingdata?.resultData);
      }
    }, [bookingdata?.resultData, bData]);
  
    const columns = useMemo(
      () => [
        {
          header: "Name",
          accessorKey: "eventName", //simple accessorKey pointing to flat data
        },
        {
          header: "Customer",
          accessorKey: "firstName", //simple accessorKey pointing to flat data
          size: 80,
        },
        {
          header: "Guests",
          accessorKey: "guests", //simple accessorKey pointing to flat data
          size: 80,
        },
        {
          header: "Amount",
          accessorKey: "totalPrice", //simple accessorKey pointing to flat data
          size: 80,
        },
        {
          header: "Order Date",
          accessorKey: "bookingDate", //simple accessorKey pointing to flat data
        },
      ],
      []
    );
  
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
                  <Link to={`/roster/${row.original.slotId}`}>
                    <button className="btn bg-primary text-white"><i class="bi bi-arrow-up-right-circle-fill"></i></button>
                  </Link>
                </div>
              )}
            />
  
          </section>
        </main>
      </>
    );
  
};

export default BookingList;
