import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";

export class Bloque extends Instruccion {
    constructor(
        public listaInstrucciones:Array<Instruccion>,
        linea: number, columna:number) {
        super(linea,columna);
    }
    public ejecutar(myEnv: Env):any {
       
        const newEnv = new Env(myEnv);

    
        for (const instruccion of this.listaInstrucciones) {
            try {
                instruccion.ejecutar(newEnv);
            } catch (error) {
                console.log(error);
                
            }
        }
    
    }
}