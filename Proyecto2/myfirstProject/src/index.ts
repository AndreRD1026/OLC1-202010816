import nodo from "../src/Abstract/Nodo";

import { Env } from "./symbols/env";

const parser = require("./grammar/grammar");
const fs = require("fs");
var instrucciones = new nodo("INSTRUCCIONES");
try {
    const entrada = fs.readFileSync("src/entrada1.txt");
    const ast = parser.parse(entrada.toString());
    const env= new Env(null);
    

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
    
} catch (error) {
    console.log(error);
    
}