// import { Link } from "react-router-dom";
import { Button } from "@mui/material";
import { useNavigate } from "react-router-dom";
function Home() {
  const navigate = useNavigate();
  return (
    <>
      <div className="flex gap-6 justify-center items-center">
        <Button
          variant="outlined"
          onClick={() => {
            navigate("/register");
          }}
        >
          Regisztráció
        </Button>

        <Button
          variant="outlined"
          onClick={() => {
            navigate("/Login");
          }}
        >
          Bejelentkezés
        </Button>
      </div>
    </>
  );
}

export default Home;
