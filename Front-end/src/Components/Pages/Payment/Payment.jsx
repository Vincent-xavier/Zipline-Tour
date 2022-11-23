import React from 'react'
import swal from 'sweetalert'
import Header from '../../Layout/Header'
import Sidebar from '../../Layout/Sidebar'

const Payment = () => {
    const handlePay = ()=>{

        swal({
            title: "Payment Success!",
            icon: "success",
          });
    }
    return (
        <>
            <Header />
            <Sidebar />

            <main id="main" className="main">
                <section className="section">
                    <div className="container">
                        <div className="row">
                            <div className="card col-md-5 ">
                                <div className="card-body">
                                    <h3 className='card-title'>Shopping Cart</h3>
                                    <div className="card shadow-sm">
                                        <div className="card-body">
                                            <h5 className="card-title">Event Name</h5>
                                            <ul style={{ "display": "flex", "listStyleType": "none" }}>
                                                <li className='p-2'>10.00 AM</li>
                                                <li className='p-2'>Wednesday</li>
                                                <li className='p-2'>October 27</li>
                                            </ul>
                                            <div className="row d-flex">
                                                <div className="col-md-4">Guest
                                                    <span className="ms-5">1X</span>
                                                </div>
                                                <div className="col-md-4 text-center">$ 109.00</div>
                                                <div className="col-md-4 text-center">$ 109.00</div>
                                            </div>
                                            <div className="d-block mt-3">
                                                <h6 className='d-inline'>Booking fee</h6>
                                                <span className="p-0 m-0" style={{ "float": "right" }}>$ 00.00</span>
                                            </div>
                                            <div className="d-block mt-3">
                                                <h6 className='d-inline'>Total</h6>
                                                <span className="p-0 m-0" style={{ "float": "right" }}>$ 00.00</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="card col-md-5 ms-5">
                                <div className="card-body">
                                    <h3 className='card-title'>Payment Method</h3>
                                    <div className="row">
                                        <div className="col-md-12">
                                            <div className="form-check ">
                                                <input className="form-check-input" type="radio" name="card" defaultChecked />
                                                <label className="form-check-label radio-inline" htmlFor="radio">
                                                    New card
                                                </label>
                                            </div>
                                            <hr />
                                            <h3 className='card-title'>Payment</h3>
                                            <form className="row">
                                                <div className="col-md-12">
                                                    <label htmlFor="inputName5" className="form-label">Name</label>
                                                    <input type="text" className="form-control" id="inputName5" />
                                                </div>
                                                <div className="col-md-12 mt-2">
                                                    <label htmlFor="inputName5" className="form-label">Credit Card Number</label>
                                                    <input type="text" className="form-control" id="inputName5" />
                                                </div>
                                                <div className="col-6 mt-2">
                                                    <label htmlFor="Expiry date" className="form-label">Expiry date</label>
                                                    <input type="date" className="form-control" id="Expiry date" />
                                                </div>
                                                <div className="col-6 mt-2">
                                                    <label htmlFor="CVV" className="form-label">CVV Number</label>
                                                    <input type="text" className="form-control" id="CVV" />
                                                </div>


                                                <div className="text-center mt-4">
                                                    <button type="button" onClick={() => handlePay()} className="btn btn-primary">Pay Now</button>
                                                </div>
                                            </form>{/* End Multi Columns Form */}
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div className="card col-md-5 ">
                                <div className="card-body">
                                    <h5 className="card-title">Contact Information</h5>
                                    <div className="ms-4 mt-0">
                                        <h6>Vincent Xavier</h6>
                                        <h6>Dindigul</h6>
                                        <h6>vincent@gmail.com</h6>
                                    </div>
                                    <button className='mt-2 btn btn-success' type='button'>Change </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </>
    )
}

export default Payment