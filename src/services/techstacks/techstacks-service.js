import { API } from '../apiConstants';
import { HttpRequest } from '../../utils';

const getAll = () => {
  return HttpRequest.get(`/${API.techstacks}`);
};

const create = (payload) => {
  return HttpRequest.post(`/${API.techstacks}`, payload);
};

const update = (id, payload) => {
  return HttpRequest.put(`/${API.techstacks}/${id}`, payload.data);
};

const remove = (id) => {
  return HttpRequest.delete(`/${API.techstacks}/${id}`);
};

const TechStacksService = {
  getAll,
  create,
  update,
  remove,
};

export default TechStacksService;
