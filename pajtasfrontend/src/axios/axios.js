import Axios from "axios";

const api = Axios.create({
  baseURL: "https://localhost:7027/api/",
  // headers: {
  //   Authorization: !!!localStorage.getItem("token")
  //     ? null
  //     : "bearer " + localStorage.getItem("token").valueOf(),
  // },
});

export default api;
