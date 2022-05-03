import Axios from 'axios';

const { API_URL } = process.env;

function HttpRequest() {
  // const [payload, setPayload] = useState(null);
  // const [loading, setLoading] = useState(true);
  // const [data, setData] = useState(null);
  // const [error, setError] = useState(false);

  // useEffect(() => {
  //   const fetchData = async () => {
  //     try {
  //       const response = await Axios.get('someurl');
  //       setData(response.data);
  //       setError(false);
  //     } catch (err) {
  //       setError(err.message);
  //       setData(null);
  //     } finally {
  //       setLoading(false);
  //     }
  //   };

  //   fetchData();
  // }, []);

  return Axios.create({
    baseURL: API_URL,
    headers: {
      'Content-type': 'application/json',
    },
  });
}

export default HttpRequest;
