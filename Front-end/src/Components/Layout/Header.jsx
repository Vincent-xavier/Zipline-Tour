import React from "react";
import { useSelector } from "react-redux";
import { Link } from "react-router-dom";

const Header = () => {
  const { isAuthenticated } = useSelector((state) => state.userAPI);
  const isLogedIn = JSON.parse(localStorage.getItem("user"));

  const handleSignOut = () => {
    localStorage.removeItem("user");
    window.location.href = "/login";
  };
  return (
    <>
      <header
        id="header"
        className="header fixed-top d-flex align-items-center xyz-in" xyz="fade flip-down stagger duration-10 delay-2 ease-out-back"
      >
        <div className="d-flex align-items-center justify-content-between">
          <Link to={"/dashboard"} className="logo d-flex align-items-center">
            <img src="/Zipline.png" alt />
            <span className="d-none d-lg-block">Zipline</span>
          </Link>
          {/* <i className="bi bi-list toggle-sidebar-btn" /> */}
        </div>

        {(isLogedIn && isLogedIn.userdata) ||
        (isAuthenticated && isAuthenticated == true) ? null : (
          <>
            <div className="search-bar">
              <Link to={"/login"}>
                <button
                  className="btn btn-primary"
                  type="submit"
                  title="Search"
                >
                  Signin
                </button>
              </Link>

              <Link to={"/event"}>
                <button
                  className="btn btn-primary ms-3"
                  type="submit"
                  title="Search"
                >
                  Events
                </button>
              </Link>
            </div>
          </>
        )}

        <nav className="header-nav ms-auto">
          <ul className="d-flex align-items-center">
            {(isLogedIn && isLogedIn.userdata) ||
            (isAuthenticated && isAuthenticated === true) ? (
              <>
                <li className="nav-item dropdown pe-3">
                  <a
                    className="nav-link nav-profile d-flex align-items-center pe-0"
                    href="#"
                    data-bs-toggle="dropdown"
                  >
                    <span className="d-none d-md-block pe-2">Welcome</span>
                    <span className="d-none d-md-block dropdown-toggle pe-3">
                      Admin
                    </span>
                    <img
                      src="/admin/assets/img/profile-img.jpg"
                      alt="Profile"
                      className="rounded-circle"
                    />
                  </a>
                  <ul className="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                    <li className="dropdown-header">
                      <h6>Kevin Anderson</h6>
                      <span>Web Designer</span>
                    </li>
                    <li>
                      <hr className="dropdown-divider" />
                    </li>
                    <li>
                      <Link
                        to={"/profile"}
                        className="dropdown-item d-flex align-items-center"
                      >
                        <i className="bi bi-person" />
                        <span>My Profile</span>
                      </Link>
                    </li>
                    <li>
                      <hr className="dropdown-divider" />
                    </li>
                    <li>
                      <p className="dropdown-item d-flex align-items-center">
                        <i className="bi bi-box-arrow-right" />
                        <span onClick={() => handleSignOut()}>Sign Out</span>
                      </p>
                    </li>
                  </ul>
                </li>
              </>
            ) : (
              <>
                <li className="nav-item dropdown pe-3">
                  <h5
                    className="nav-link nav-profile d-flex align-items-center pe-0"
                    href="#"
                    data-bs-toggle="dropdown"
                  >
                    <span className="d-none d-md-block pe-2">
                      Welcome Strangers
                    </span>
                    <img
                      src="/admin/assets/img/profile-img.jpg"
                      alt="Profile"
                      className="rounded-circle"
                    />
                  </h5>
                  {/* End Profile Iamge Icon */}
                </li>
              </>
            )}
          </ul>
        </nav>
      </header>
    </>
  );
};

export default Header;
