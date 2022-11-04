import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";
import nodo from "../Abstract/nodo";

export class Bloque extends Instruccion {
    constructor(
        public listaInstrucciones:Array<Instruccion>,
        //public instrucciones: string[],

        linea: number, columna:number) {
        super(linea,columna);
    }
    public ejecutar():any {
       
        //const newEnv = new Env(myEnv);

    
        // for (const instruccion of this.listaInstrucciones) {
        //     try {
        //         instruccion.ejecutar(newEnv);
        //     } catch (error) {
        //         console.log(error);
                
        //     }
        // }
    
    }

    // public getNodo() {
    //     var nodoBloque = new nodo("<ENCAPSULAMIENTO>");
    //     for (const instruccion of this.listaInstrucciones){
    //         try {
    //             nodoBloque.agregarHijo(instruccion);
    //         } catch(error){
    //             console.log(error);
                
    //         }
    //     }
        //nodoDec.agregarHijo(this.tipo);
        //this.instrucciones.forEach(id => {
        //    nodoBloque.agregarHijo(id);
        //});
        //nodoBloque.agregarHijo(this.contenido);
        //return nodoBloque;
    //}
}