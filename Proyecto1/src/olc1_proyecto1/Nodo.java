/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package olc1_proyecto1;

import java.util.ArrayList;

/**
 *
 * @author andreramirez
 */
public class Nodo {
    
    public String Etiqueta;
    public ArrayList<Nodo> hijos = new ArrayList<>();
    public String valor;
    public int idNod;
    
    
    public void AddHijos(Nodo hijo){
        hijos.add(hijo);
    }
    
    public void setEtiqueta(String Etiqueta){
        this.Etiqueta = Etiqueta;
    }
    
    public String getEtiqueta(){
        return Etiqueta;
    }
    
    public ArrayList<Nodo> getHijos(){
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
