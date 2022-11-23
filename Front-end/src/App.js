import logo from './logo.svg';
import './App.css';
import Header from './Components/Layout/Header';
import Sidebar from './Components/Layout/Sidebar';
import Footer from './Components/Layout/Footer';
import { Dashboard } from './Components/Pages/Dashboard';
import URLRoutes from './Components/URLRouting/Routes';


function App() {
  return (
    <>
    <URLRoutes/>
    </>
  );
}

export default App;
