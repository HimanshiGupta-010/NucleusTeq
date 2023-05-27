import './App.css';
import {BrowserRouter, Route, Routes} from 'react-router-dom';
import FooterComponent from './Components/FooterComponent';
import HeaderComponent from './Components/HeaderComponent';
import ListEmployeeComponent from './Components/ListEmployeeComponent';
import AddEmployeeComponent from './Components/AddEmployeeComponent';
import Login from './Components/Login';

function App() {
  return (
    <div>
        <BrowserRouter>
            <HeaderComponent/>
            {/* <Login/> */}
            <div className = "container">
                <Routes>
                    <Route exact path = '/' element = {<Login/>} /> 
                    <Route path = '/home' element = {<ListEmployeeComponent/>} />
                    <Route path = '/employees' element = {<ListEmployeeComponent/>} /> 
                    <Route path = '/add-employee' element = {<AddEmployeeComponent/>} />
                    <Route path = '/edit-employee/:id' element = {<AddEmployeeComponent/>} />
                </Routes>
            </div>
            {/* <FooterComponent/> */}
        </BrowserRouter>
        <FooterComponent/>
    </div>
  );
}

export default App;
