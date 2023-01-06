import React from "react";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";

const Sidebar = () => {
  const { isAuthenticated } = useSelector((state) => state.userAPI);
  const isLogedIn = JSON.parse(localStorage.getItem("user"));

  return (
    <>
      {/* ======= Sidebar ======= */}
      <aside id="sidebar" className="sidebar xyz-in" xyz="fade left stagger">
        <ul className="sidebar-nav" id="sidebar-nav">
          {(isLogedIn && isLogedIn.userdata) ||
          (isAuthenticated && isAuthenticated == true) ? (
            <>
              <li className="nav-item">
                <Link to={"/dashboard"} className="nav-link">
                  <i className="bi bi-grid" />
                  <span>Dashboard</span>
                </Link>
              </li>
              <li className="nav-item">
                <Link to={"/event"} className="nav-link collapsed">
                  <i className="bi bi-calendar2-event" />
                  <span>Events</span>
                </Link>
              </li>
              <li className="nav-item">
                <a
                  className="nav-link collapsed"
                  data-bs-target="#components-nav"
                  data-bs-toggle="collapse"
                  href="#"
                >
                  <i className="bi bi-menu-button-wide" />
                  <span>Products</span>
                  <i className="bi bi-chevron-down ms-auto" />
                </a>
                <ul
                  id="components-nav"
                  className="nav-content collapse "
                  data-bs-parent="#sidebar-nav"
                >
                  <li>
                    <Link to={"/edit-event"}>
                      <i className="bi bi-circle" />
                      <span>Edit Event</span>
                    </Link>
                  </li>
                </ul>
              </li>
              <li className="nav-item">
                <a
                  className="nav-link collapsed"
                  data-bs-target="#forms-nav"
                  data-bs-toggle="collapse"
                  href="#"
                >
                  <i className="bi bi-journals" />
                  <span>Bookings</span>
                  <i className="bi bi-chevron-down ms-auto" />
                </a>
                <ul
                  id="forms-nav"
                  className="nav-content collapse "
                  data-bs-parent="#sidebar-nav"
                >
                  <li>
                    <Link to={"/abandoned-list"}>
                      <i className="bi bi-circle" />
                      <span>Abandoned Orders</span>
                    </Link>
                  </li>
                  <li>
                    <Link to={"/booking-list"}>
                      <i className="bi bi-circle" />
                      <span>Booking List</span>
                    </Link>
                  </li>
                  <li>
                    <Link to={"/order-list"}>
                      <i className="bi bi-circle" />
                      <span>Order List</span>
                    </Link>
                  </li>
                </ul>
              </li>
            </>
          ) : (
            <>
              <li className="nav-item">
                <Link to={"/event"} className="nav-link">
                  <i className="bi bi-grid" />
                  <span>Events</span>
                </Link>
              </li>
            </>
          )}
        </ul>
      </aside>
    </>
  );
};

export default Sidebar;
