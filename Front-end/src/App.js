import URLRoutes from "./Components/URLRouting/Routes";
import "react-toastify/dist/ReactToastify.css";
import "@animxyz/core";
import "./index.css";
import { useEffect, useState } from "react";
function App() {
  const [scroll, setScroll] = useState(0);
  console.log(scroll);
  useEffect(() => {
    let progressBarHandler = () => {
      const totalScroll = document.documentElement.scrollTop;
      const windowHeight =
        document.documentElement.scrollHeight -
        document.documentElement.clientHeight;
      const scroll = `${totalScroll / windowHeight}`;

      setScroll(scroll);
    };

    window.addEventListener("scroll", progressBarHandler);

    return () => window.removeEventListener("scroll", progressBarHandler);
  });
  return (
    <>
      <div id="progressBarContainer">
        <div
          id="progressBar"
          style={{ transform: `scale(${scroll}, 1)`, opacity: `${scroll}` }}
        />
      </div>
      <URLRoutes />
    </>
  );
}

export default App;
