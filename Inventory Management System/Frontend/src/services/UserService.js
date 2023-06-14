import { myAxios } from "./helper";

export const signUp = (user) => {
    return myAxios.post('/api/users/Register', user).then((response) => response.data)
}

export const contact = (data) => {
    return myAxios.post('/api/contact/saveContact', data).then((response) => response.data)
}

export const login = (email, password) => {
    return myAxios.post( '/api/users/login', { 
        email: email, 
        password: password }).then((response) => response.data)
}

// export const logIn = (user) => {
//     return myAxios.post('api/users/login', user).then((response) => response.data)
// }


// export const logIn = (username, password) => {
//     return myAxios
//       .post(`/login/${username}/${password}`)
//       .then((response) => response.data)
//       .catch((error) => {
//         throw new Error('An error occurred during login. Please try again.');
//       });
//   };