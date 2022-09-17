/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package analizadores;

import java.util.ArrayList;
import olc1_proyecto1.Nodo;

/**
 *
 * @author andreramirez
 */
public class Nodo1 {
     public String Etiqueta;
    public ArrayList<Nodo1> hijos = new ArrayList<>();
    public String valor;
    public int idNod;
    
    
    public void AddHijos(Nodo1 hijo){
        hijos.add(hijo);
    }
    
    public void setEtiqueta(String Etiqueta){
        this.Etiqueta = Etiqueta;
    }
    
    public String getEtiqueta(){
        return Etiqueta;
    }
    
    public ArrayList<Nodo1> getHijos(){
        return hijos;
    }

    public int getIdNod() {
        return idNod;
    }

    public void setIdNod(int idNod) {
        this.idNod = idNod;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }
}
