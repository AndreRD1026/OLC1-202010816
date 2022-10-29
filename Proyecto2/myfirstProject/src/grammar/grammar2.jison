%{
  //Declarciones y tambien las importaciones
  const {Declaracion} = require('../instrucciones/Declaracion.ts');
  const {Impresion} = require('../instrucciones/Imprimir.ts');
  const {Bloque} = require('../instrucciones/bloque.ts');
  const {Asignacion} = require('../instrucciones/Asignacion.ts');


%}

%lex
%options case-insensitive

letra  [a-zA-Z]
variable ([\_][^\n\_]* [\_])
cadena [\"][^\"]*[\"]
caracter ([\'][^\n\']* [\'])
numero [0-9]+([.][0-9]+)?

%%

\s+                   /* skip whitespace */
"//".*                              // comentario simple línea
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/] // comentario multiple líneas

{cadena}        return 'cadena'
{numero}        return 'numero'


"String"   return 'pr_string'
"Int"   return 'pr_int'
"Print" return 'pr_print'


";"  return ';'
","  return ','
"+"  return '+'
"-"  return '-'
"*"  return '*'
"/"  return '/'
"%"  return '%'
")"  return ')'
"("  return '('
"}"  return '}'
"{"  return '{'
"["  return '['
"]"  return ']'
"="  return '='
","  return ','

([a-zA-Z_])[a-zA-Z0-9_ñÑ]*	return 'expreID';

<<EOF>>		            return 'EOF'

.   { 
        console.log("error lexico: "+yytext +"En la linea: " + yylloc.first_line +", En la columna: "+ yylloc.first_column);
    }


/lex
%left '+'
%left '-'
%left '*'
%left '/'
%left '%'

%start INIT

%%


INIT :  LISTAINSTRUCCIONES  EOF  {return $1;}
;

LISTAINSTRUCCIONES: LISTAINSTRUCCIONES INSTRUCCION { $1.push($2);  $$= $1;  }
                |  INSTRUCCION {$$=[$1]}  
;

INSTRUCCION :
    DECLARACIONES {$$=$1;}
    | ASIGNACIONES {$$=$1;}
    | IMPRIMIR {$$=$1;}
;


DECLARACIONES:  'pr_int' 'expreID' '=' OPERACIONA ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | 'pr_string' 'expreID' '=' 'cadena' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | 'pr_int' LISTAVARIABLES ';' {$$= new Declaracion($2,$1,@1.first_line,@1.first_column); }
    | 'pr_string' LISTAVARIABLES ';' {$$= new Declaracion($2,$1,@1.first_line,@1.first_column); }
;

LISTAVARIABLES: 'expreID' LISTAVARIABLES2 {$$=$2;}
;

LISTAVARIABLES2: ',' 'expreID' LISTAVARIABLES2 {$$=$2;}
                | ',' 'expreID' {$$=$2;}
;


ASIGNACIONES: 'expreID' '=' OPERACIONA ';' {$$= new Asignacion();}
;

OPERACIONA: OPERACIONA EXPRESIONES {$$=$1;}
            | EXPRESIONES {$$=$1;}
;

EXPRESIONES: EXPRESION {$$=$1;}
            | RELACIONAL {$$=$1;}
            | LOGICO {$$=$1;}
;

EXPRESION: EXPRESION '+' EXPRESION {$$=$1 + '+' + $3;}
            | EXPRESION '-' EXPRESION {$$=$1 + '-' + $3;}
            | EXPRESION '*' EXPRESION {$$=$1 + '*' + $3;}
            | EXPRESION '/' EXPRESION {$$=$1 + '/' + $3;}
            | EXPRESION '%' EXPRESION {$$=$1 + '%' + $3;}
            | '(' EXPRESION ')' {$$= "(" + $2 + ")";}
            | '[' EXPRESION ']' {$$= "[" + $2 + "]";}
            | 'numero' {$$=$1;}
;


IMPRIMIR: 'pr_print' '(' 'cadena' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
;