import { createBrowserRouter, RouterProvider } from "react-router-dom";
import "./App.css";
import { pageRoutes } from "./routes/Routes";

const routes = createBrowserRouter(pageRoutes);

function App() {
  return (
    <div className="App">
      <RouterProvider router={routes} />
    </div>
  );
}

export default App;
