import { Typography } from "@mui/material";

function Keresett({ data }) {
  return (
    <div className="w-3/5 border border-gray-400">
      <Typography variant="h5">{data.tulajd}</Typography>
      <Typography variant="h5">{data.valasztott}</Typography>
    </div>
  );
}

export default Keresett;
