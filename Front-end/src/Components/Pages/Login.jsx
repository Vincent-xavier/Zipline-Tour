import { useFormik } from "formik";
import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Link, useNavigate } from "react-router-dom";
import swal from "sweetalert";
import * as Yup from "yup";
import { userLogin } from "../../actions/User";
import Header from "../Layout/Header";
import '@animxyz/core'

const Login = () => {
  const dispatch = useDispatch();
  const navigate = useNavigate();
  const userData = useSelector((state) => state.userAPI);
  const isLogedIn = JSON.parse(localStorage.getItem("user"));

  useEffect(() => {
    if (
      (userData && userData?.userData?.message == "Login Success") ||
      (isLogedIn && isLogedIn?.userdata)
    ) {
      navigate("/dashboard");
    } else if (userData?.error === "login error") {
      swal("please check your username and password");
      swal({
        title: "Sign-in Failed",
        text: "please check your username and password!",
        icon: "error",
        button: "try again!",
      });
    }
  }, [userData, isLogedIn]);

  const loginForm = useFormik({
    initialValues: {
      email: "",
      password: "",
    },
    validationSchema: Yup.object({
      password: Yup.string()
        .required("Please enter your password")
        .max(255),
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

    onSubmit: (values) => {
      const formData = {
        email: values.email,
        password: values.password,
      };

      dispatch(userLogin(formData));
    },
  });

  return (
    <>
      <main>
        <div className="container login-page">
          <section
            style={{ marginTop: "-40px" }}
            className="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4"
          >
            <Header />
            <div className="container xyz-in" xyz="fade flip-down stagger duration-10 delay-2 ease-out-back">
              <div className="row justify-content-center">
                <div className="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">
                  <div className="card mb-3">
                    <div className="card-body">
                      <div className="p-5 text-center">
                        <img
                          src="/admin/assets/img/icon-user.png"
                          alt="login"
                        />
                      </div>
                      <form
                        className="row g-3 p-3"
                        onSubmit={loginForm.handleSubmit}
                      >
                        <div className="col-12">
                          <label htmlFor="emailId" className="form-label">
                            User name
                          </label>
                          <div className="input-group">
                            <input
                              type="text"
                              name="email"
                              className={loginForm.touched.email && loginForm.errors.email ? "form-control is-invalid" : "form-control"}
                              onChange={loginForm.handleChange}
                              value={loginForm.values.email}
                              onBlur={loginForm.handleBlur}
                            />
                          </div>
                        </div>
                        {loginForm.touched.email && loginForm.errors.email ? (
                          <small>
                            <span className={"text-danger"}>
                              {loginForm.errors.email}
                            </span>
                          </small>
                        ) : null}

                        <div className="col-12">
                          <label htmlFor="txtpassword" className="form-label">
                            Password
                          </label>
                          <input
                            type="password"
                            name="password"
                            className="form-control"
                            onChange={loginForm.handleChange}
                            value={loginForm.values.password}
                            onBlur={loginForm.handleBlur}
                          />
                        </div>
                        {loginForm.touched.password &&
                        loginForm.errors.password ? (
                          <small>
                            <span className={"text-danger "}>
                              {loginForm.errors.password}
                            </span>
                          </small>
                        ) : null}
                        <div className="col-10 mt-4 col-12 align-center text center">
                          {/* <Link to={"/dashboard"}> */}
                          <button
                            className="btn btn-primary w-100"
                            type="submit"
                          >
                            Sign In
                          </button>
                          {/* </Link> */}
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>
      </main>
    </>
  );
};

export default Login;
