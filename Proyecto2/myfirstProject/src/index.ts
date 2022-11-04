// import nodo from "../src/Abstract/Nodo";
// import { exec } from "child_process";
// import { Env } from "./symbols/env";

// const parser = require("./grammar/grammar");
// const fs = require("fs");
// var instrucciones = new nodo("<LISTA_INSTRUCCIONES>");
// try {
//     const entrada = fs.readFileSync("src/entrada1.txt");
//     const ast = parser.parse(entrada.toString());
//     const env= new Env(null);
    

//     for (const instruccion of ast) {
//         try {
//             //instruccion.ejecutar(env);
//             instruccion.ejecutar();
//             instrucciones.agregarHijo_nodo(instruccion.getNodo());

//         } catch (error) {
//             console.log(error);
            
//         }
//     }

//     var grafo = "";
//     grafo = getDot(instrucciones);
//     console.log(grafo);
//     var dot = "";
//     var c = 0;

//     function getDot(raiz: nodo) {
//         dot = "";
//         dot += "digraph grph {\n";
//         dot += 'nodo0[label="' + raiz.getValor().replace('"', '\\"') + '"];\n';
//         c = 1;
//         recorrerAST("nodo0", raiz);
//         dot += "}";
//         createFile("prueba.dot", dot)
//         exec('dot -Tpng prueba.dot -o ast.png ')
//         return dot;
//     }

//     function recorrerAST(padre: String, nPadre: nodo) {
//         for (let hijo of nPadre.getHijos()) {
//             var nombreHijo = "nodo" + c;
//             var primerquite = hijo.getValor().toString().replace("\"", " ");
//             dot += nombreHijo + "[label=\"" + primerquite.replace("\"", " ") + "\"];\n";
//             dot += padre + "->" + nombreHijo + ";\n";
//             c++;
//             recorrerAST(nombreHijo, hijo);
//         }
//     }

    
    
// } catch (error) {
//     console.log(error);
    
// }


// function createFile(nameFile: string, data: string) {
//     fs.writeFile(nameFile, data, () => {
//         console.log('>> The file ' + nameFile + ' has been saved!');
//     })
// }

import express, { Application } from "express";
import morgan from "morgan";
import cors from "cors";

import apiRoutes from "./routes/apiRouters";

class Server {
  public app: Application;

  constructor() {
    this.app = express();
    this.config();
    this.routes();
  }

  config(): void {
    this.app.set("port", process.env.PORT || 8080);
    this.app.use(morgan("dev"));
    this.app.use(cors());
    this.app.use(express.json());
    this.app.use(express.urlencoded({ extended: false }));
  }

  routes(): void {
    this.app.use("/usuario", apiRoutes);
    this.app.use("/", apiRoutes);
  }

  

  start(): void {
    this.app.listen(this.app.get("port"), () => {
      console.log("Server on port ", this.app.get("port"));
    });
  }
}

export const server = new Server();
server.start();