import React from 'react'
import { useSelector } from 'react-redux'
import { Navigate, Outlet } from 'react-router-dom'



const PrivateRoutes = () => {
    const { isAuthenticated } = useSelector((state) => state.userAPI);
    const isLogedIn = JSON.parse(localStorage.getItem("user"));

    if (isAuthenticated || isLogedIn && isLogedIn.userdata) {
        return <Outlet />
    } else {
        return <Navigate to={"/login"} />
    }
}

export default PrivateRoutes;