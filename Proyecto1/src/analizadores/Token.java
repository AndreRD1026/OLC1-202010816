/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package analizadores;

import java.util.LinkedList;

/**
 *
 * @author andreramirez
 */
public class Token {

    String tipo, lexema;
    Token[] ListaCaracteres;
    int size;
    boolean operador;

    public Token(String tipo, String lexema, boolean operador) {
        this.tipo = tipo;
        this.lexema = lexema;
        this.operador = operador;
        this.size = 0;
    }

    public Token(String tipo, String lexema, LinkedList<Token> Lista) {
        this.tipo = tipo;
        this.lexema = lexema;
        Token[] lista = new Token[Lista.size()];
        int c = 0;
        for (int i = 0; i < Lista.size(); i++) {

            lista[i] = (Lista.get(i));
            c++;
        }
        size = c;
        this.ListaCaracteres = lista;
    }

    public String getLexema() {
        return lexema;
    }

    public void setLexema(String lex) {
        lexema = lex;
    }

    public String getTipo() {
        return tipo;
    }

    public Token getCaracter(int i) {
        return ListaCaracteres[i];
    }

    public boolean getOperador() {
        return operador;
    }

    public void setOperador(boolean op) {
        operador = op;
    }

    public int getSize() {
        return size;
    }

}
