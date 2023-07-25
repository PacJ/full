import logo from './logo.svg';
import Dashboard from './layouts/dashboard/index';
import PrivateRoute from './access/PrivateRoute';
import './App.css';
  import { Navigate, Route, Routes } from 'react-router-dom'; 

function App() {
  return (
    <Routes>
      <Route path="/" element={<PrivateRoute isAuth={false} RouteComponent={Dashboard} />} />
    </Routes>
    // <div className="App">
    //   <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />
    //     <p>
    //       Edit <code>src/App.js</code> and save to reload.
    //     </p>
    //     <a
    //       className="App-link"
    //       href="https://reactjs.org"
    //       target="_blank"
    //       rel="noopener noreferrer"
    //     >
    //       Learn React
    //     </a>
    //   </header>
    // </div>
  );
}

export default App;
