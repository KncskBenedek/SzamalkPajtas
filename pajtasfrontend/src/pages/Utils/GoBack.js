import { useNavigate } from "react-router-dom";
import { Button } from "@mui/material";
function GoBack({ text }) {
  const navigate = useNavigate();
  return (
    <>
      <Button
        onClick={() => {
          navigate(-1);
        }}
      >
        {text}
      </Button>
    </>
  );
}
export default GoBack;
