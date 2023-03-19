import Home from "../pages/Home/Home";
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
];
