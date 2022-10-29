import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";

export class Impresion extends Instruccion {


    constructor(
        public expresion: string,        
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar(Env: Env):any {

        console.log(this.expresion);

        //implementacion semantica
        //validar
    
    }
}