import { Request, Response } from "express";
import nodo from "../Abstract/nodo";
import { exec } from "child_process";
import { Singleton } from "../Singleton/Singleton";


class ApiController {

  //public pruebaas:string ="";
  
  public async funcion1(req: Request, res: Response) {
    
    try {
      const parser = require("../grammar/grammar.js");
      const fs = require("fs");
      var instrucciones = new nodo("<LISTA_INSTRUCCIONES>");
      const entrada = fs.readFileSync("src/entrada1.txt");
      const ast = parser.parse(entrada.toString());

      for (const instruccion of ast) {
          try {
              //instruccion.ejecutar(env);
              instruccion.ejecutar();
              instrucciones.agregarHijo_nodo(instruccion.getNodo());
              
          } catch (error) {
              console.log(error);
              
          }
  }
      var grafo = "";
      grafo = getDot(instrucciones);
      console.log(grafo);
      var dot = "";
      var c = 0;
  
      function getDot(raiz: nodo) {
          dot = "";
          dot += "digraph grph {\n";
          dot += 'nodo0[label="' + raiz.getValor().replace('"', '\\"') + '"];\n';
          c = 1;
          recorrerAST("nodo0", raiz);
          dot += "}";
          createFile("prueba.dot", dot)
          exec('dot -Tpng prueba.dot -o servidor.png ')
          return dot;
      }
  
      function recorrerAST(padre: String, nPadre: nodo) {
          for (let hijo of nPadre.getHijos()) {
              var nombreHijo = "nodo" + c;
              var primerquite = hijo.getValor().toString().replace("\"", " ");
              dot += nombreHijo + "[label=\"" + primerquite.replace("\"", " ") + "\"];\n";
              dot += padre + "->" + nombreHijo + ";\n";
              c++;
              recorrerAST(nombreHijo, hijo);
          }
      }

      function createFile(nameFile: string, data: string) {
  fs.writeFile(nameFile, data, () => {
      console.log('>> The file ' + nameFile + ' has been saved!');
  })
        res.json({ msg: "Analizado!" });        

    }} catch (error) {
      res.status(400).send({ msg: "error en funcion" });
    }
  }

  public async funcion2(req: Request, res: Response) {
    //try {
        const parser = require("../grammar/grammar.js");
        const fs = require("fs");
        const s= Singleton.getInstance();
        var instrucciones = new nodo("<LISTA_INSTRUCCIONES>");
        //const entrada = fs.readFileSync("src/entrada1.txt");
        const peticion = req.body.peticion;
        const ast = parser.parse(peticion.toString());

        for (const instruccion of ast) {
            try {
                //instruccion.ejecutar(env);
                instruccion.ejecutar();
                instrucciones.agregarHijo_nodo(instruccion.getNodo());
            } catch (error) {
                console.log(error);
                s.add_error(error)
                
            }
    }
      createFile("errores.html", s.get_error())
      //createFile("/frontend/frontend/src/app/components/errores/ast.component.html", s.get_error())
      createFile("/frontend/frontend/src/app/components/ast/ast.component.html", s.get_error())
      createFile("/frontend/frontend/src/app/components/errores/errores.component.html", s.get_error())
      //this.pruebaas = s.get_error()
        var grafo = "";
        grafo = getDot(instrucciones);
        console.log(grafo);
        var dot = "";
        var c = 0;
    
        function getDot(raiz: nodo) {
            dot = "";
            dot += "digraph grph {\n";
            dot += 'nodo0[label="' + raiz.getValor().replace('"', '\\"') + '"];\n';
            c = 1;
            recorrerAST("nodo0", raiz);
            dot += "}";
            createFile("prueba.dot", dot)
            exec('dot -Tpng prueba.dot -o servidor.png ')
            return dot;
        }
    
        function recorrerAST(padre: String, nPadre: nodo) {
            for (let hijo of nPadre.getHijos()) {
                var nombreHijo = "nodo" + c;
                var primerquite = hijo.getValor().toString().replace("\"", " ");
                dot += nombreHijo + "[label=\"" + primerquite.replace("\"", " ") + "\"];\n";
                dot += padre + "->" + nombreHijo + ";\n";
                c++;
                recorrerAST(nombreHijo, hijo);
            }
        }

        function createFile(nameFile: string, data: string) {
    fs.writeFile(nameFile, data, () => {
        console.log('>> The file ' + nameFile + ' has been saved!');
    })
}
      res.json({ msg: "exito :D "});
    //} catch (error) {
    //  res.status(400).send({ msg: "error en funcion" });
    //}
  }
}

export const apiController = new ApiController();