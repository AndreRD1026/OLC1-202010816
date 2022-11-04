import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  //URL = "http://localhost/8080"
  URL = "http://localhost:8080"
  //private _errores:Array<Errores> = new Array();
  constructor( private http:HttpClient) { }

  probando(){
    return this.http.get(`${this.URL}/usuario`);
  }

  errores(){
    return this.http.get(`${this.URL}/errores`);
  }

  setdata(json:any){
    return this.http.post(`${this.URL}/prueba`,json);
  }

}
