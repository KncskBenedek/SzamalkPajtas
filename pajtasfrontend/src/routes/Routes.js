import Home from "../pages/Home/Home";
import UserKeresett from "../pages/UserKeresett/UserKeresett";
import UserProfile from "../pages/UserProfile/UserProfile";

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
];
