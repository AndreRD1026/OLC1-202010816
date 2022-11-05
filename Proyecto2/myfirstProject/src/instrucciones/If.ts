import { Instruccion } from "../abstractas/instruccion";
import { Env } from "../symbols/env";
import nodo from "../Abstract/nodo";

export class If extends Instruccion {


    constructor(
        public condicion: string,
        public ListaIns: Array<Instruccion>,
        public ListaElif: Array<Instruccion>,
        public Ultimas: Array<Instruccion>,
        linea: number, columna:number) {
        super(linea,columna);
    }

    public ejecutar():any {
        //console.log("Encontre una asignacion, nombre:"+this.nombre+" lo encontre en la linea "+this.line);
        console.log("Encontré un if")
        //metodo para guardar la variable, tabla de simbolos


        //Env.guardar_variable(this.nombre, this.tipo);


        //guardar un metodo asi        
        //Env.guardar_funcion(this.nombre,this);


        //implementacion semantica
        //validar
    
    }

    public getNodo() {
        var nodoIf = new nodo("<IF>");
        nodoIf.agregarHijo(this.condicion);
        //nodoDoUntil.agregarHijo("<CONDICION>\n" + this.condicion);
        this.ListaIns.forEach(inst => {
            nodoIf.agregarHijo_nodo(inst.getNodo());
        });
        this.ListaElif.forEach(elf => {
            nodoIf.agregarHijo_nodo(elf.getNodo());
        });
        this.Ultimas.forEach(ult => {
            nodoIf.agregarHijo_nodo(ult.getNodo());
        });
        // nodoIf.agregarHijo("}");
        // nodoIf.agregarHijo("while");
        // nodoIf.agregarHijo("<CONDICION>\n" + this.condicion);
        return nodoIf;
    }
}