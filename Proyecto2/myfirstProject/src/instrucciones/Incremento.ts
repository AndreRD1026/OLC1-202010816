import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";
import nodo from "../Abstract/Nodo";

export class Incremento extends Instruccion {


    constructor(
        public nombre: string,
        public contenido: string,
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar():any {
        //console.log("Encontre una asignacion, nombre:"+this.nombre+" lo encontre en la linea "+this.line);
        console.log("Encontré un incremento, nombre:" +this.nombre)
        //metodo para guardar la variable, tabla de simbolos


        //Env.guardar_variable(this.nombre, this.tipo);


        //guardar un metodo asi        
        //Env.guardar_funcion(this.nombre,this);


        //implementacion semantica
        //validar
    
    }

    public getNodo() {
        var nodoInc = new nodo("<INCREMENTO>");
        //nodoDec.agregarHijo(this.tipo);
        // this.nombre.forEach(id => {
        //     nodoDec.agregarHijo(id);
        // });
        nodoInc.agregarHijo(this.nombre);
        nodoInc.agregarHijo(this.contenido);
        return nodoInc;
    }
}