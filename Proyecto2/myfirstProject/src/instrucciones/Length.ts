import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";

export class Length extends Instruccion {


    constructor(
        public nombre: string,
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar():any {
        //console.log("Encontre un lower, nombre:"+this.nombre +" , contenido:  " + this.contenido + " lo encontre en la linea "+this.line);
        console.log("Encontre un length");
        //metodo para guardar la variable, tabla de simbolos


        //Env.guardar_variable(this.nombre, this.tipo);


        //guardar un metodo asi        
        //Env.guardar_funcion(this.nombre,this);


        //implementacion semantica
        //validar
    
    }
}