import { Router } from "express";

//import { apiController } from "../controllers/apiController";
import { apiController } from "../controllers/apiController"

class ApiRoutes {
  public router: Router = Router();

  constructor() {
    this.config();
  }

  config(): void {
    this.router.get("/usuario", apiController.funcion1);
    this.router.post("/usuario1", apiController.funcion2);
    //this.router.get("/:nombre", apiController.funcion3);
    //this.router.get("/saludo/:nombre", apiController.funcion4);
  }
}

const apiRoutes = new ApiRoutes();
export default apiRoutes.router;