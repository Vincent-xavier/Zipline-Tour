import React from 'react'
import { Link } from 'react-router-dom'
import Header from '../../Layout/Header'
import Sidebar from '../../Layout/Sidebar'

const OrderList = () => {
    return (
        <>
            <Header />
            <Sidebar />

            <main id="main" className="main">
                <section className="section">
                    <div className="container">
                        <div className="card">
                            <div className="card-body">
                                <h5 className="card-title">Order List</h5>
                                {/* Table with stripped rows */}
                                <table className="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Oder Id</th>
                                            <th scope="col">Event Name</th>
                                            <th scope="col">Order Date</th>
                                            <th scope="col">Customer</th>
                                            <th scope="col">Amount</th>
                                            <th scope="col">Order Status</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Brandon Jacob</td>
                                            <td>2016-05-25</td>
                                            <td>Vincent</td>
                                            <td>$ 200</td>
                                            <td>Completed</td>
                                            <td>
                                            <i className="bi bi-trash" />
                                            <i className="bi bi-eye ms-2" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                {/* End Table with stripped rows */}
                            </div>
                        </div>

                    </div>
                </section>
            </main>
        </>
    )
}

export default OrderList