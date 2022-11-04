import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";
import nodo from "../Abstract/nodo";

export class Prueba extends Instruccion {


    constructor(
        public nombre: string,
        public contenido: string,
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar():any {
        //console.log("Encontre un lower, nombre:"+this.nombre +" , contenido:  " + this.contenido + " lo encontre en la linea "+this.line);
        //console.log("Encontre un lower");
        //metodo para guardar la variable, tabla de simbolos


        //Env.guardar_variable(this.nombre, this.tipo);


        //guardar un metodo asi        
        //Env.guardar_funcion(this.nombre,this);


        //implementacion semantica
        //validar
    
    }

    public getNodo() {
        var nodoPrueba = new nodo("<Prueba>");
        //nodoDec.agregarHijo(this.tipo);
        // this.nombre.forEach(id => {
        //     nodoDec.agregarHijo(id);
        // });
        
        nodoPrueba.agregarHijo(this.nombre);
        nodoPrueba.agregarHijo("+");
        nodoPrueba.agregarHijo(this.contenido);
        return nodoPrueba;
    }
}