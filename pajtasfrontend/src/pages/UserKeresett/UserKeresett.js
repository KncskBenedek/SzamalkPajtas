import { useEffect, useState } from "react";
import endPoints from "../../API/api";
import api from "../../axios/axios";
import { IconButton } from "@mui/material";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";
import Keresett from "./components/Keresett";
import NewKeresett from "./components/NewKeresett";

function UserKeresett(params) {
  const [kerTul, setKerTul] = useState([
    {
      id: 0,
      tulajd: "magas-e?",
      valasztott: "yes",
      choices: [{ choice: "kek" }, { choice: "pink" }],
    },
  ]);
  const [isNew, setIsNew] = useState(false);
  const [tulajdonsagok, setTulajdonsagok] = useState([
    {
      kerdes: "Szeretsz?",
    },
    {
      kerdes: "Szeretsz 2?",
    },
    {
      kerdes: "Szeretsz 3?",
    },
  ]);

  console.log(kerTul);

  return (
    <div className="w-full h-full flex justify-center items-center">
      <div className="w-4/5 h-4/5 flex flex-col border border-pink-300">
        <div className="w-full flex flex-col items-center justify-center">
          {kerTul.length !== 0
            ? kerTul.map((keresett, index) => {
                console.log(isNew && kerTul.length - 1 === index);
                if (isNew && kerTul.length - 1 === index) {
                  return <NewKeresett key={index} data={keresett} />;
                }
                return <Keresett key={index} data={keresett} />;
              })
            : "Nincs még keresett tulajdonságod"}
        </div>
        <IconButton
          disabled={isNew}
          onClick={() => {
            setKerTul(
              kerTul.concat({
                id: 1,
                tulajd: "magas-e?",
                choices: [{ choice: "kek" }, { choice: "pink" }],
              })
            );
            setIsNew(true);
          }}
        >
          <AddCircleOutlineIcon />
        </IconButton>
      </div>
    </div>
  );
}

export default UserKeresett;
