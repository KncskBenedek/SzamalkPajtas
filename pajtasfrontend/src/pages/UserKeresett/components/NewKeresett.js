import { MenuItem, Select, Typography } from "@mui/material";
import { useForm } from "react-hook-form";

function NewKeresett({ data }) {
  const { register, handleSubmit } = useForm();

  return (
    <form>
      <Typography variant="h5">{data.tulajd}</Typography>
      <Select>
        {data.choices.map((oneChoice, index) => {
          return <MenuItem key={index}>{oneChoice.choice}</MenuItem>;
        })}
      </Select>
    </form>
  );
}

export default NewKeresett;
