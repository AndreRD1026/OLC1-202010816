import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";
import nodo from "../Abstract/nodo";

export class Funcion extends Instruccion {


    constructor(
        public nombre: string,
        public instrucciones: string,
        public tipo: string,
        public instrucciones2: string,
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar():any {
        //console.log("Encontre una asignacion, nombre:"+this.nombre+" lo encontre en la linea "+this.line);
        console.log("Encontré una funcion")
        //metodo para guardar la variable, tabla de simbolos


        //Env.guardar_variable(this.nombre, this.tipo);


        //guardar un metodo asi        
        //Env.guardar_funcion(this.nombre,this);


        //implementacion semantica
        //validar
    
    }

    public getNodo() {
        var nodoFuncion = new nodo("<FUNCION>");
        //nodoDec.agregarHijo(this.tipo);
        // this.nombre.forEach(id => {
        //     nodoDec.agregarHijo(id);
        // });
        
        nodoFuncion.agregarHijo(this.nombre);
        nodoFuncion.agregarHijo(this.instrucciones);
        nodoFuncion.agregarHijo(this.tipo);
        //nodoFuncion.agregarHijo("=");
        nodoFuncion.agregarHijo(this.instrucciones2);
        return nodoFuncion;
    }
}