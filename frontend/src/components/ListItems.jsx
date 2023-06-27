import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import ItemServices from "../services/ItemService";
import { toast } from 'react-hot-toast';
//import EmployeeServices from '../services/EmployeeService';
import { useNavigate } from "react-router-dom";

const ListItem = () => {
  const [items, setItems] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    getAllItems();
  }, []);

  const unassignItem = async (itemId) => {
    //const employee = { name };

    try {
      //await EmployeeServices.updateEmployee(employeeId, employee);
      const itemResponse = await ItemServices.getItemById(itemId);
      const itemData = itemResponse.data;
      const itemName = itemData.name;
      const item = { name: itemName, status: false };
      await ItemServices.updateItem(itemId, item);
      toast.success('Item Unassigned');
      navigate('/unassigned-items');
    } catch (error) {
      console.log("Unassigned Task Failed");
    }
  }

  const getAllItems = () => {
    ItemServices.getAllItems()
      .then((response) => {
        setItems(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
  };

  const deleteItem = (itemId) => {
    ItemServices.deleteItem(itemId)
      .then((response) => {
        toast.success('Item Deleted');
        getAllItems();
      })
      .catch((error) => {
        console.log(error);
      });
  };

  return (
    <div className="container bg-dark min-vh-100 py-4">
      <h2 className="text-center text-white">Assign Unassign Items</h2>
      <div className="mb-3 d-flex justify-content-between">
      <div>
        <Link to="/assigned-items" className="btn btn-primary mr-2">
          Assigned Items
        </Link>

        <Link to="/add-item" className="btn btn-primary mr-2" style={{ marginLeft: "10px" }}>
          Add Items
        </Link>
        </div>

        <div>
        <Link to="/assign-unassign-item" className="btn btn-primary mr-2">
          List Employees
        </Link>
        
        <Link to="/unassigned-items" className="btn btn-primary" style={{ marginLeft: "10px" }}>
          Unassigned Items
        </Link>
        </div>
      </div>
      <table className="table table-bordered table-striped text-white">
        <thead>
          <tr>
            <th>Item Id</th>
            <th>Item Name</th>
            <th>Emp ID</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {items.map((item) => (
            <tr key={item.item_id}>
              <td>{item.item_id}</td>
              <td>{item.name}</td>
              <td>{item.empId}</td>
              <td>{item.status ? "True" : "False"}</td>
              <td>
                <Link className="btn btn-info mr-2" to={`/edit-item/${item.item_id}`}>
                  Update
                </Link>
                {item.status ? (
          <button className="btn btn-danger mr-2" style={{ marginLeft: "10px" }} onClick={() => unassignItem(item.item_id)}>
            Unassign
          </button>
        ) : (
          <span>
          <Link className="btn btn-success mr-2" style={{ marginLeft: "10px" }} to={`/assign/${item.item_id}`}>
            Assign
          </Link>
          <button
                  className="btn btn-danger" style={{ marginLeft: "10px" }}
                  onClick={() => deleteItem(item.item_id)}>
                  Delete
                </button>
                </span>
        )}
                {/* <Link className="btn btn-success  mr-2" style={{ marginLeft: "10px" }} 
                  to={`/assign/${item.item_id}`}>
                  Assign
                </Link>   
                <button className="btn btn-danger mr-2" style={{ marginLeft: "10px" }}
                  onClick={() => unassignItem(item.item_id)}>
                  Unassign
                </button>                                                                      */}
                
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ListItem;