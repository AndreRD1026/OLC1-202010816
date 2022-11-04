import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';
import { Router } from '@angular/router';
import { ModalModule } from 'ngx-bootstrap/modal';

interface Ventana{
  nombre:string;
  code:string;
}

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  public archivos: any = []
  tabs:Ventana[]=[];
  contador:number=0;
  //ImagePath: string;
  ImagePath: string = "";
  //tablaError:Array<Errores> = new Array();
  //tablaSimbolos:Array<Simbolos> = new Array();
  ASTstring:string = "";
  ventana:Ventana = {
    nombre: "",
    code: ""
  }

  constructor(private service: UserService, private _router:Router) { }

  ngOnInit(): void {
  }


  CapturarArchivo(event:any, index:any){
    try {
      let a =event.target.files[0]
      let text=""
      if(a){
          let reader=new FileReader()
          reader.onload=ev=>{
          const resultado=ev.target?.result
          text=String(resultado)
          console.log(text.toString());
          //index.textarea.code = text.toString();
          index.textarea.send = text.toString();
          //index.textarea.
        }
        reader.readAsText(a)
      }
    } catch (error) {
      console.log(error);
    }
  }

  AbrirArchivo(archivo:HTMLInputElement){
    
    archivo.click();
    
  }

  AgregarVentana(){
    console.log("Ventana agregar");
    
    this.contador++;
    this.ventana.nombre = "VENTANA" + this.contador;
    //this.console = this.console + 'SE HA CREADO UNA NUEVA VENTANA\n';
    this.tabs.push(this.ventana);
    this.ventana = {
      nombre: "",
      code: ""
    }
  }

  AbrirAST(){
    console.log("Aqui saldra el arbol");
    this.ImagePath = '/myfirstProject/servidor.png'
  }

  // Pruebacontenido(){
  //   this.service.errores().subscribe(
  //     (res)=>{
  //       console.log(res);
        
  //     },
  //     (err)=>{
  //       console.log(err);
        
  //     }
  //   )
    
  // }

  GuardarArchivo(index:any){
    try {
      let nombre = "ventana1" + ".olc";
      let content = index.textarea;
      let type = "text/plain";
        this.DescargarArchivo(content, nombre, type);
        console.log("SE HA GUARDADO");
    } catch (error) {
      console.log("Hola");
      
    }
    
  }


  DescargarArchivo(content:string, fileName:string,contenType:string)
  {
    var a = document.createElement("a");
    var archivo = new Blob([content], {type: contenType});
    a.href = URL.createObjectURL(archivo);
    a.download = fileName;
    a.click();
  }

  mostrar(valor:string) {
    console.log(valor);
  }

  getAst2(){
    this.service.probando().subscribe(
      (res)=>{
        console.log(res);
        
      },
      (err)=>{
        console.log(err);
        
      }
    )
  }

  setdata(values:any):void{
    console.log("values", values.txtarea);
    var json={
      "peticion": values.textarea
    }
    this.service.setdata(json).subscribe(
      (res)=>{
        console.log(res);
        alert("Archivo Analizado con exito")
      }, (err)=>{
        console.log(err);
      }
    )
    
  }



  GenerarErrores(){
    //this.servicio.setErrores(this.tablaError);
    this._router.navigate(['errores']);
  }



}
