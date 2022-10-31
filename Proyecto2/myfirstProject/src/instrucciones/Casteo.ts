import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";

export class Casteo extends Instruccion {


    constructor(
        public nombre: string,
        public tipo: string,
        public convertir: string,
        public dato: string,
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar():any {
        console.log("Encontre un casteo, tipo:"+this.tipo+ " nombre: " + this.nombre + " a tipo: " + this.convertir + " dato: " + this.dato);
        //console.log("Encontré un casteo")
        //metodo para guardar la variable, tabla de simbolos


        //Env.guardar_variable(this.nombre, this.tipo);


        //guardar un metodo asi        
        //Env.guardar_funcion(this.nombre,this);


        //implementacion semantica
        //validar
    
    }
}