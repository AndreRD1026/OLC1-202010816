import { Env } from "./symbols/env";

const parser = require("./grammar/grammar2");
const fs = require("fs");

try {
    const entrada = fs.readFileSync("src/entrada1.txt");
    const ast = parser.parse(entrada.toString());
    const env= new Env(null);

    for (const instruccion of ast) {
        try {
            instruccion.ejecutar(env);
        } catch (error) {
            console.log(error);
            
        }
    }

    
    
} catch (error) {
    console.log(error);
    
}