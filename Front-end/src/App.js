import URLRoutes from "./Components/URLRouting/Routes";
import "react-toastify/dist/ReactToastify.css";
import "@animxyz/core";
import "./index.css";
import { ToastContainer } from "react-toastify";
function App() {
  return (
    <>
      <URLRoutes />
      <ToastContainer />
    </>
  );
}

export default App;
