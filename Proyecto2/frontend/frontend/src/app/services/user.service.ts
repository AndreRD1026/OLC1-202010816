import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  //URL = "http://localhost/8080"
  URL = "http://localhost:8080"
  constructor( private http:HttpClient) { }


  getData(){
    return this.http.get(`${this.URL}/getIncremental`);
  }

  probando(){
    return this.http.get(`${this.URL}/usuario`);
  }

  setdata(json:any){
    return this.http.post(`${this.URL}/usuario1`,json);
  }

}
