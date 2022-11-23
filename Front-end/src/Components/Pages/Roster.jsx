import React from 'react'
import Header from '../Layout/Header'
import Sidebar from '../Layout/Sidebar'
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import './Event/Event.css'

const RosterView = () => {
    return (
        <>
            <Header />
            <Sidebar />

            <main id="main" className="main">
                <section className="section">
                    <div className="container">
                        <Tabs>
                            <TabList >
                                <Tab disabled >
                                    <div className="row">
                                        <div className="col-md-12">
                                            <h4><small>31 oct</small> Monday</h4>
                                        </div>
                                    </div>
                                </Tab>
                                <Tab selected>
                                    <div className="container">
                                        <div className="row">
                                            <div className="col-md-4 mt-3">
                                                <h6>10:00 AM</h6>
                                            </div>
                                            <div className="col-md-8">
                                                <h5 style={{'letter-spacing': '2.5px'}}>Event Name</h5>
                                                <p className='ms-4'>10 Available</p>
                                            </div>

                                        </div>
                                    </div>
                                </Tab>
                                
                            </TabList>

                            <TabPanel>
                            </TabPanel>
                            <TabPanel>
                                <div className="container">
                                    <div className="card">

                                        <div className="row p-2">
                                            <div className="offset-md-2 col-md-8 text-center">
                                                <h3 className='text-black'>Event Name</h3>
                                                <hr style={{"border-bottom":"2px solid black"}}/>
                                            </div>

                                            <div className="card-body mt-5">

                                                {/* Table with stripped rows */}
                                                <table className="table table-striped ">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Email</th>
                                                            <th scope="col">Phone</th>
                                                            <th scope="col">Payment</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <th scope="row">Vincent</th>
                                                            <td>Vincent@gmail.com</td>
                                                            <td>8526073314</td>
                                                            <td>paid</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                {/* End Table with stripped rows */}
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </TabPanel>
                        </Tabs>

                    </div>
                </section>
            </main>
        </>
    )
}

export default RosterView