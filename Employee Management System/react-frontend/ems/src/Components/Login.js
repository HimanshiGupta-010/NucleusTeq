import React from 'react'
import { useNavigate } from 'react-router-dom';
import {useState} from 'react';
import {toast} from 'react-hot-toast'


const Login = () => {
    const navigate = useNavigate();

    const [formData, setFormData] = useState( {
        email:"", password:""
    })

    function changeHandler(event) {

        setFormData( (prevData) =>(
            {
                ...prevData,
                [event.target.name]:event.target.value
            }
        ) )

    }

    function submitHandler(event) {
        event.preventDefault();
        
        if(formData.email === 'himanshigupta898@gmail.com' && formData.password === '12345')
        {
            toast.success("Logged In");
            // console.log("Printing the formData ");
            // console.log(formData)
            navigate("/home");
        }
        else
        {
            toast.error("Incorrect email id and password")
            navigate('/')
        }
        
    }

  return (
    <form onSubmit={submitHandler} className='d-flex flex-column'>
   
        <label className='mx-auto'>
            <p style={{marginTop:100+'px'}}>Email ID</p>
            <input 
                required
                type='email'
                value = {formData.email}
                onChange = {changeHandler}
                placeholder='Enter email address'
                name = 'email'
            />
        </label>

        <br/>
       


        
        <label className='mx-auto'>
            <p>Password</p>
            <input
                required
                type='password'
                value={formData.password}
                onChange={changeHandler}
                placeholder='Enter password'
                name='password'
            />
        </label>
        <button className='mx-auto mt-4 btn btn-primary' onClick={(e) => submitHandler(e)}>Log In</button>
    </form>
  )
}

export default Login