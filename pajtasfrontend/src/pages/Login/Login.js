import { Button, TextField } from "@mui/material";
import { useForm } from "react-hook-form";
import GoBack from "../Utils/GoBack";
function Login() {
  const { register, handleSubmit } = useForm();
  return (
    <div className="w-full h-full">
      <form
        className="flex flex-col gap-6 justify-center items-center"
        onSubmit={handleSubmit((data) => {
          console.log(data);
        })}
      >
        <GoBack text="vissza" />
        <h1>Bejelentkezés</h1>
        <TextField
          required
          label="Felhasználónév"
          inputProps={{ maxLength: 40 }}
          {...register("nev")}
        />
        <TextField
          required
          label="Jelszó"
          type="password"
          inputProps={{ minLength: 8 }}
          {...register("jelszo")}
        />
        <Button type="submit" variant="outlined">
          Bejelentkezés
        </Button>
      </form>
    </div>
  );
}
export default Login;
