import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";
import nodo from "../Abstract/Nodo";

export class Print extends Instruccion {


    constructor(
        public expresion: string,        
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar():any {

        console.log(this.expresion);

        //implementacion semantica
        //validar
    
    }

    public getNodo() {
        var nodoPrint = new nodo("<PRINT>");
        //nodoPrint.agregarHijo(this.tipo);
        // this.nombre.forEach(id => {
        //     nodoPrint.agregarHijo(id);
        // });
        nodoPrint.agregarHijo(this.expresion);
        return nodoPrint;
    }
}