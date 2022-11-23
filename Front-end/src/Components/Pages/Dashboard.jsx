import React from 'react'
import { Link } from 'react-router-dom'
import Header from '../Layout/Header'
import Sidebar from '../Layout/Sidebar'

export const Dashboard = () => {
    return (
        <>
            <Header />
            <Sidebar />

            <main id="main" className="main">

                <section className="section dashboard">
                    <div className="row">

                        <div className="event-schedule-area-two bg-color pad100">
                            <div className="container">
                                <div className="row">
                                    <div className="col-lg-12">
                                        <div className="tab-content" id="myTabContent">
                                            <div className="tab-pane fade active show" id="home" role="tabpanel">
                                                <div className="table-responsive">
                                                    <table className="table">
                                                        <thead>
                                                            <tr>
                                                                <th className="text-center" scope="col">Oct 26, 2022</th>
                                                                <th colSpan={"4"} scope="col">Wednesday</th>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            
                                                            <tr className="inner-box" >
                                                                <th scope='row'>

                                                                    <div className="time">
                                                                        <span style={{ "fontWeight": "bold", "fontSize": "17px" }}>05:30 PM</span>
                                                                    </div>
                                                                </th>
                                                                <td>
                                                                    <div className="event-img">
                                                                        <img src="/admin/assets/img/event-img.jpg" alt />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div className="event-wrap">
                                                                        <h3><Link to={"/event-details"}>Flying baba mountain</Link></h3>

                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div className="event-date text-center" style={{ "fontWeight": "bold", "fontSize": "17px" }}>
                                                                        <span>25</span>
                                                                        <p>Available</p>
                                                                    </div>


                                                                </td>
                                                                <td>
                                                            <Link to={"/roster"}>

                                                                    <span className='text-center ms-3'><i className="bi bi-arrow-right-square-fill" /></span>

                                                                    <p style={{ "fontWeight": "bold", "fontSize": "17px" }}>
                                                                        Roster</p>
                                                                        </Link>

                                                                </td>

                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                    {/* /col end*/}
                                </div>
                                {/* /row end*/}
                            </div>
                        </div>
                    </div>
                </section>
            </main>


        </>
    )
}
