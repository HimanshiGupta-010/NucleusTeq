import React, { useState } from 'react';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useParams } from "react-router-dom";
import EmployeeService from '../services/EmployeeService';
import ItemServices from "../services/ItemService";
import { toast } from 'react-hot-toast';

const Assign = () => {
    const { id } = useParams(); //item ID
    const [itemName, setItemName] = useState(''); //Item Name
    const [employees, setEmployees] = useState([]); //Print list of employees
    const [employeeId, setEmployeeId] = useState(''); //employee Id
    const [employeeName, setEmployeeName] = useState(''); 
    const [name, setName]= useState('')
    const navigate = useNavigate();

    

    useEffect(() => {
        const fetchData = async () => {
            try {
                const itemResponse = await ItemServices.getItemById(id);
                const itemData = itemResponse.data;
                console.log(itemData);
                setItemName(itemData.name);
                const employeesResponse = await EmployeeService.getAllEmployees();
                const employeesData = employeesResponse.data;
                setEmployees(employeesData);
            } 
            catch (error) {
                console.error('Error fetching data:', error);
            }
        };
        fetchData();
    }, [id]);

    const assignItem = async (e) => {
        e.preventDefault();
        //const employee = {name, itemId}
        //console.log(employee);
        const item = { name: itemName,empId: employeeId, status : true};
        console.log(item);
        //console.log(id);

        if(id)
        {

            try {
                const itemresponse = await ItemServices.updateItem(id, item);
                const employeeResponse = await EmployeeService.getEmployeeById(employeeId);
                const employeeData = employeeResponse.data;
                console.log(employeeData);
                const name = employeeData.name;
                console.log(name);
                const status = true;
                const employee = {name: name, isItemAssigned:status, empId: employeeId};
                console.log(employee);
                await EmployeeService.updateEmployee(employeeId, employee);
                toast.success("Item is Assigned");
                navigate('/list-items')
                
            } 
            catch (error) {
                console.log("Item update error:", error);
                toast.error("Item is not assigned");
            }
        }   
    }

    const selectEmployee = (emp_id, event) => {
        event.preventDefault();
        setEmployeeId(emp_id);
    }

    const handleSubmit = (e) => {
        e.preventDefault();
    };



    return (
      <div className="container bg-dark min-vh-100 ">
          <div className="row">
              <div className="col-lg-6">
                  <h2 className='text-white'>Assign Item</h2>
                  <form>
                      <div className="form-group mb-2">
                          <label className="form-label text-white">Item ID</label>
                          <input
                          required
                          type="text"
                          placeholder="Enter Employee ID"
                          name="id"
                          className="form-control"
                          value={id}
                          readOnly
                          />
                      </div>
                      <div className="form-group mb-2">
                          <label className="form-label text-white">Item Name</label>
                          <input
                          required
                          type="text"
                          placeholder="Enter First Name"
                          name="name"
                          className="form-control"
                          value={itemName}
                          readOnly
                          />
                      </div>
                      <div className="form-group mb-2">
                          <label className="form-label text-white">Employee ID</label>
                          <input
                          required
                          type="text"
                          placeholder="Enter Item ID"
                          name="itemId"
                          className="form-control"
                          value={employeeId}
                          onChange={(e) => setEmployeeId(e.target.value)}
                          readOnly
                          />
                      </div>
                      <br />
                      <button type="submit" className="btn btn-primary" onClick={(e) => assignItem(e)}
                      disabled={!employeeId} 
                       // Disable the button if Employee ID is not filled
                       >
                          Assign
                      </button>
                  </form>
              </div>
              <div className="col-lg-6">
                  <h2 className='text-white'>Employee List</h2>
                  {/* Display the list of items here */}
                  <div className="bg-dark min-vh-100 py-4">
                      <div className="container">
                          <table className="table table-bordered table-striped">
                              <thead className="bg-gray-200">
                                  <tr>
                                      <th>Employeee ID</th>
                                      <th>Employee Name</th>
                                      <th>Actions</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  {employees.map((employee) => ( 
                                    
                                      <tr key={employee.emp_id}>
                                          <td>{employee.emp_id}</td>
                                          <td>{employee.name}</td>
                                          <td>{/* Add any necessary actions */}
                                                <button className="btn btn-info" 
                                                onClick={(event) => selectEmployee(employee.emp_id, event)}
                                                >
                                                  Select
                                                </button>
                                          </td>
                                      </tr>
                                    
                                    
                                  ))}
                              </tbody>
                          </table>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  );
};

export default Assign;