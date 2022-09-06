package analizadores;
import java_cup.runtime.*;


%%


%{
    public static LinkedList<TError> errores = new LinkedList<TError>(); 
%}

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
//var = {letra}+
var = ([\_][^\n\_]* [\_])
cadena = ([\"][^\n\"]* [\"])
//caracter = ([\'][^\n\']* [\'])
//numero_int = [0-9]+
//numero_float = [0-9]+([.][0-9]+)?
numero = [0-9]+([.][0-9]+)?
comentario = ("//" [^"\n"]+)
comentarioMulti = "/*"[^"*/"]*"*/"



%%
<YYINITIAL>"."   {
                    //codigo en java
                    System.out.println("Reconocio token: <punto> lexema: "+yytext());
                    return new Symbol(Simbolos.tpunto, yycolumn, yyline, yytext());
                  }

<YYINITIAL>","   {
                    //codigo en java
                    System.out.println("Reconocio token: <coma> lexema: "+yytext());
                    return new Symbol(Simbolos.tcoma, yycolumn, yyline, yytext());
                  }
<YYINITIAL>";"   {
                    //codigo en java
                    System.out.println("Reconocio token: <puntoycoma> lexema: "+yytext());
                    return new Symbol(Simbolos.tpuntoycoma, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"+"   {
                    //codigo en java
                    System.out.println("Reconocio token: <cruz> lexema: "+yytext());
                    return new Symbol(Simbolos.tcruz, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"-"   {
                    //codigo en java
                    System.out.println("Reconocio token: <guion> lexema: "+yytext());
                    return new Symbol(Simbolos.tguion, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"*"   {
                    //codigo en java
                    System.out.println("Reconocio token: <asterisco> lexema: "+yytext());
                    return new Symbol(Simbolos.tasterisco, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"/"   {
                    //codigo en java
                    System.out.println("Reconocio token: <diagonal> lexema: "+yytext());
                    return new Symbol(Simbolos.tdiagonal, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"("   {
                    //codigo en java
                    System.out.println("Reconocio token: <parentesisAbre> lexema: "+yytext());
                    return new Symbol(Simbolos.tparA, yycolumn, yyline, yytext());
                  }
<YYINITIAL>")"   {
                    //codigo en java
                    System.out.println("Reconocio token: <parentesisCierra> lexema: "+yytext());
                    return new Symbol(Simbolos.tparC, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"_"   {
                    //codigo en java
                    System.out.println("Reconocio token: <guion_bajo> lexema: "+yytext());
                    return new Symbol(Simbolos.tguionBajo, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"->"   {
                    //codigo en java
                    System.out.println("Reconocio token: <flecha> lexema: "+yytext());
                    return new Symbol(Simbolos.tflecha, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"¿"   {
                    //codigo en java
                    System.out.println("Reconocio token: <flecha> lexema: "+yytext());
                    return new Symbol(Simbolos.tinterrogaciona, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"?"   {
                    //codigo en java
                    System.out.println("Reconocio token: <interrogacion> lexema: "+yytext());
                    return new Symbol(Simbolos.tinterrogacionc, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"="   {
                    //codigo en java
                    System.out.println("Reconocio token: <igual> lexema: "+yytext());
                    return new Symbol(Simbolos.tigual, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"inicio"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prInicio, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"boolean"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prBoolean, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"verdadero"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prVerdadero, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"falso"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFalso, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"numero"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prNumero, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"cadena"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prCadena, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"potencia"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prPotencia, yycolumn, yyline, yytext());
                  }


<YYINITIAL>"mod"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prMod, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"ingresar"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prIngresar, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"como"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prComo, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"con_valor"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prConValor, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"si"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prSi, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"entonces"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prEntonces, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"fin_si"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFinSi, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"o_si"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prOSi, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"de_lo_contrario"  {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prDeloContrario, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"fin"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFin, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"segun"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prSegun, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"hacer"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prHacer, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"fin_segun"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFinSegun, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"para"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prPara, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"hasta"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prHasta, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"fin_para"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFinPara, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"con incremental"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prIncremental, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"mientras"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prMientras, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"fin_mientras"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFinMientras, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"repetir"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prRepetir, yycolumn, yyline, yytext());
                  }
<YYINITIAL>"hasta_que"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prHastaQue, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"retornar"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prRetornar, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"metodo"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prMetodo, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"con_parametros"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prConParametros, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"fin_metodo"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFinMetodo, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"funcion"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFuncion, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"fin_funcion"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prFinFuncion, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"ejecutar"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prEjecutar, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"imprimir"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prImprimir, yycolumn, yyline, yytext());
                  }

<YYINITIAL>"imprimir_nl"   {
                    //codigo en java
                    System.out.println("Reconocio palabra_reservada, lexema: "+yytext());
                    return new Symbol(Simbolos.prImprimirNl, yycolumn, yyline, yytext());
                  }

<YYINITIAL>{var}  {
                    System.out.println("Reconocio token: <variable> lexema: "+yytext());
                    return new Symbol(Simbolos.var, yycolumn, yyline, yytext()); 
                    }

<YYINITIAL>{cadena} {
                    System.out.println("Reconocio token: <cadena> lexema: "+ yytext());
                    return new Symbol(Simbolos.Cadena, yycolumn, yyline, yytext());
                }

<YYINITIAL>{comentario}  {
                    System.out.println("Reconocio token: <comentario> lexema: "+yytext());
                    }

<YYINITIAL>{comentarioMulti} {
                    System.out.println("Reconocio token: <comentarioMulti> lexema: "+ yytext());
                    
                } 

<YYINITIAL> {numero} {
                    System.out.println("Reconocio token: <numero> lexema: "+ yytext());
                    return new Symbol(Simbolos.numero, yycolumn, yyline, yytext());
                }


[\t \n \f \r ] { /* Espacios en blanco se ignoran */}


.       {
            System.out.println("Error Lexico : "+yytext()+ " Linea "+(yyline+1)+" Columna "+yycolumn);    
            TError tmp= new TError("Lexico", yytext(),"NO PERTENECE AL LENGUAJE", yyline, yycolumn );
            errores.add(tmp);
}


