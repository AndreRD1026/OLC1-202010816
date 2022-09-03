package analizadores;
import java_cup.runtime.*;


%%



//directrices


%public 
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode


letra  = [a-zA-Z]
id     = {letra}+
numero = [0-9]+
comentario = [//]+([\S]+\s)+
// comentarioMulti = "/*"[^"*/"]* "*/" 



%%

<YYINITIAL>","   {
                    //codigo en java
                    System.out.println("Reconocio token: <coma> lexema:"+yytext());
                    return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"+"   {
                    //codigo en java
                    System.out.println("Reconocio token: <cruz> lexema:"+yytext());
                    return new Symbol(Simbolos.cruz, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"-"   {
                    //codigo en java
                    System.out.println("Reconocio token: <guion> lexema:"+yytext());
                    return new Symbol(Simbolos.guion, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"*"   {
                    //codigo en java
                    System.out.println("Reconocio token: <asterisco> lexema:"+yytext());
                    return new Symbol(Simbolos.asterisco, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"/"   {
                    //codigo en java
                    System.out.println("Reconocio token: <diagonal> lexema:"+yytext());
                    return new Symbol(Simbolos.diagonal, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"inicio"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema:"+yytext());
                    return new Symbol(Simbolos.prInicio, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"fin"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema:"+yytext());
                    return new Symbol(Simbolos.prFin, yycolumn, yyline, yytext());
                  }

<YYINITIAL>{id}  {
                    System.out.println("Reconocio token: <id> lexema:"+yytext());
                    return new Symbol(Simbolos.id, yycolumn, yyline, yytext()); 
                    }
<YYINITIAL>{comentario}  {
                    System.out.println("Reconocio token: <comentario> lexema:"+yytext());
                    }

/*

<YYINITIAL>{comentarioMulti} {
                    System.out.println("Reconocio token: <comentarioMulti> lexema: "+ yytext());
                    
                } */
<YYINITIAL> {numero} {
                    System.out.println("Reconocio token: <numero> lexema: "+ yytext());
                    return new Symbol(Simbolos.numero, yycolumn, yyline, yytext());
                }



[\t \n \f \r ] { /* Espacios en blanco se ignoran */}


.                   {
                        System.out.println("Error Lexico : "+yytext()+
                        "Linea"+(yyline+1)+" Columna "+yycolumn);    

}


