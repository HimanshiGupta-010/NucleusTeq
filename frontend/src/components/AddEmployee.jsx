import React, { useEffect } from 'react';
import {useState} from 'react';
import {Link} from 'react-router-dom';
import {useNavigate} from 'react-router-dom';
import { useParams } from "react-router-dom";
import EmployeeService from '../services/EmployeeService';
import { toast } from 'react-hot-toast';

const AddEmployeeComponent = () => {

    const[name, setname] = useState('')
    const[itemId, setItemId] = useState('');
    const {id} = useParams();
    const navigate = useNavigate();

    const saveOrUpdateEmployee = async (e) => {
        e.preventDefault();
        const employee = {name: name, isItemAssigned: false};
             await EmployeeService.createEmployee(employee).then((response) => {
                console.log(response.data)
                toast.success('Employee Added');
                navigate('/assign-unassign-item')
            }).catch(error => {
                console.log(error)
            })
    }
    
    useEffect(() => {
        EmployeeService.getEmployeeById(id).then((response) => {
            setname(response.data.name)
            setItemId(response.data.itemId)
        }).catch(error => {
            console.log(error)
        })
    }, [])

    const title = () => {
        if(id){
            return <h2 className='text-center'>Update Employee</h2>
        }
        else{
            return <h2 className='text-center'>Add Employee</h2>
        }
    }

    return (
        <div className="bg-dark min-vh-100 py-4">
            <br/>
            <br/>
            <div className = 'container'>
                <div className = 'row'>
                    <div className = 'card col-md-6 offset-md-3 offset-md-3'>
                    {
                        title()
                    }
                    <div className = 'card-body'>
                        <form>
                            <div className='form-group mb-2 '>
                                <label className='form-label'> Name </label>
                                <input
                                type='text'
                                placeholder="Enter First Name"
                                name = "name"
                                className='form-control'
                                value={name}
                                onChange={(e) => setname(e.target.value)}
                                >
                                </input>
                            </div>
                            <br/>
                            <br/>
                            <br/>
                            <button className='btn btn-success' onClick={(e) => saveOrUpdateEmployee(e)}>
                                Submit
                            </button>
                            <Link to='/assign-unassign-item' className='btn btn-danger' style={{ marginLeft: "10px" }}>
                                Cancel
                            </Link>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
  )
}

export default AddEmployeeComponent