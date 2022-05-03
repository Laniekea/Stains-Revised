import { API } from '../apiConstants';
import { HttpRequest } from '../../utils';

const { API_URL } = process.env;

const getAll = () => {
  return HttpRequest.get(`${API_URL}/${API.techstacks}`);
};

const create = (payload) => {
  return HttpRequest.post(`${API_URL}/${API.techstacks}`, payload);
};

const update = (id, payload) => {
  return HttpRequest.put(`${API_URL}/${API.techstacks}/${id}`, payload.data);
};

const remove = (id) => {
  return HttpRequest.delete(`${API_URL}/${API.techstacks}/${id}`);
};

const TechStacksService = {
  getAll,
  create,
  update,
  remove,
};

export default TechStacksService;
