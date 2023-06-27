import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import EmployeeServices from '../services/EmployeeService';
import ItemServices from "../services/ItemService";
// import { useNavigate } from 'react-router-dom';
import { toast } from 'react-hot-toast';

const ListEmployee = () => {
  const [employees, setEmployees] = useState([]);
  const [items, setItems]=useState('');
  // const navigate = useNavigate();

  useEffect(() => {
    getAllEmployees();
  }, []);

  const getAllEmployees = () => {
    EmployeeServices.getAllEmployees()
      .then((response) => {
        console.log(response.data); // Verify the data in the console
        setEmployees(response.data);
      })
      .catch(error => {
        console.log(error);
      });
  };
  
  const getAllItems = () => {
    ItemServices.getAllItems()
      .then((response) => {
        setItems(response.data);
      })
      .catch(error => {
        console.log(error);
      });
  }

  const deleteEmployee =  async (employeeId) => {
    if (employeeId) {
      try {
         await getAllItems();
        const employeeInItems = items.some(item => item.empId === employeeId);
        if (employeeInItems) {
          toast.error("First unassign the items and then try to delete");
          //getAllEmployees();
          return;
        } else {
          await EmployeeServices.deleteEmployee(employeeId);
          toast.success("Employee Deleted");
          //getAllEmployees();
        }
        getAllEmployees();
      } catch (error) {
        console.log("Delete Operation Failed");
      }
    }
  };

  return (
    <div className="bg-dark min-vh-100 py-4">
      <div className="container">
        <h2 className="text-center text-2xl font-weight-bold mb-4 text-white">List Employees</h2>
        <div className="d-flex justify-content-between mb-2">
          <Link to="/add-employee" className="btn btn-primary">Add Employee</Link>
          <Link to="/list-items" className="btn btn-primary">List Items</Link>
        </div>
        <table className="table table-bordered table-striped">
          <thead className="bg-gray-200">
            <tr>
              <th>Employee ID</th>
              <th>Employee Name</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {employees.map((employee) => (
              <tr key={employee.emp_id}>
                <td>{employee.emp_id}</td>
                <td>{employee.name}</td>
                <td> 
                    <button
                      className="btn btn-danger"
                      style={{ marginLeft: "10px" }}
                      onClick={() => deleteEmployee(employee.emp_id)}
                    >
                      Delete
                    </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default ListEmployee;