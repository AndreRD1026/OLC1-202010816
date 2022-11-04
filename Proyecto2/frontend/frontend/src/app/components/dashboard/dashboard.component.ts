import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';
import { Router } from '@angular/router';


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

  // capturarFile(event): any {
  //   const archivoCapturado = event.target.files[0]
  //   console.log(archivoCapturado);
  // }

  // uploadDocument(archivos) { 
  //   fileReader = new FileReader(); 
  //   fileReader.onload = (e) => { 
  //   console.log(fileReader.result); } 
  //   fileReader.readAsText(this.file); }

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

  // getAst(){
  //   //this.service.getAst().subscribe(
  //   this._router.navigate(['ast']);
  //   this.ImagePath = '/myfirstProject/servidor.png'
  //     //this.service.get('http://localhost:3000/backend/analizar');
  //   //   (res)=>{
  //   //     console.log(res);
        
  //   //   },
  //   //   (err)=>{
  //   //     console.log(err);
        
  //   //   }
  //   // )
  // }

  Pruebacontenido(){
    console.log();
    
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
        alert("Salida")
      }, (err)=>{
        console.log(err);
      }
    )
    
  }
  

}
