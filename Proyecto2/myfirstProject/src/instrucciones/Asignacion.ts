import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";
import nodo from "../Abstract/Nodo";

export class Asignacion extends Instruccion {


    constructor(
        public nombre: string[],
        public contenido: string,
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar():any {
        console.log("Encontre una asignacion, nombre:"+this.nombre +" , contenido:  " + this.contenido + " lo encontre en la linea "+this.line);
        //metodo para guardar la variable, tabla de simbolos


        //Env.guardar_variable(this.nombre, this.tipo);


        //guardar un metodo asi        
        //Env.guardar_funcion(this.nombre,this);


        //implementacion semantica
        //validar
    
    }

    public getNodo() {
        var nodoAsig = new nodo("<ASIGNACION>");
        //nodoDec.agregarHijo(this.tipo);
        this.nombre.forEach(id => {
            nodoAsig.agregarHijo(id);
        });
        nodoAsig.agregarHijo(this.contenido);
        return nodoAsig;
    }
}