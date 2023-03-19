import { Button, /*Link,*/ TextField } from "@mui/material";
import { useForm } from "react-hook-form";
import GoBack from "../Utils/GoBack";

function Register() {
  const { register, handleSubmit } = useForm();
  return (
    <div className="w-full h-full">
      <form
        className="flex flex-col gap-6 justify-center items-center"
        onSubmit={handleSubmit((data) => {
          console.log(data);
        })}
      >
        <GoBack text="Vissza" />
        <h1>Regisztráció</h1>
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
        <TextField
          label="Email Cím"
          inputProps={{ maxLength: 70 }}
          {...register("email")}
        />
        <Button type="submit" variant="outlined">
          Regisztráció
        </Button>
      </form>
    </div>
  );
}
export default Register;
