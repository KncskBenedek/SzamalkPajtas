import Axios from "axios";

const api = Axios.create({
  baseURL: "https://localhost:7027/api/",
  headers: {
    "X-Requested-With": "XMLHttpRequest",
  },
  withCredentials: true,
});

export default api;
