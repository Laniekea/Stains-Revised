import Axios from 'axios';

const { REACT_APP_API_URL } = process.env;

const httpRequest = Axios.create({
  baseURL: REACT_APP_API_URL,
  headers: {
    'Content-type': 'application/json',
  },
});

httpRequest.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response.status === 404) {
      console.log(error.response);
    }
  },
);
export default httpRequest;
