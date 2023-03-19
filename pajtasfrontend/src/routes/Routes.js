import Home from "../pages/Home/Home";
import UserKeresett from "../pages/UserKeresett/UserKeresett";
import UserProfile from "../pages/UserProfile/UserProfile";
import Login from "../pages/Login/Login";
import Register from "../pages/Login/Register";

export const pageRoutes = [
  {
    path: "/",
    element: <Home />,
  },
  {
    path: "/userProfile",
    element: <UserProfile />,
  },
  {
    path: "/userKeresett",
    element: <UserKeresett />,
  },
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/register",
    element: <Register />,
  },
];
