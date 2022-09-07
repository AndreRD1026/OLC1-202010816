/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package olc1_proyecto1;

import analizadores.Analizador_Lexico;
import analizadores.Analizador_sintactico;
import java.io.BufferedReader;
import java.io.FileReader;

/**
 *
 * @author andreramirez
 */
public class OLC1_Proyecto1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        //Interfaz_Grafica prueba = new Interfaz_Grafica();
        //prueba.setVisible(true);
         try {

            Analizador_Lexico lexico = new Analizador_Lexico(
                    new BufferedReader(new FileReader("./entrada.olc"))
            );
            Analizador_sintactico sintactico = new Analizador_sintactico(lexico);
            sintactico.parse();

        } catch (Exception e) {
        }
        
    }
    
}
