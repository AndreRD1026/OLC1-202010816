%{
  //Declarciones y tambien las importaciones
  const {Declaracion} = require('../instrucciones/Declaracion.ts');
  const {Impresion} = require('../instrucciones/Imprimir.ts');
  const {Bloque} = require('../instrucciones/bloque.ts');
  const {Asignacion} = require('../instrucciones/Asignacion.ts');
  const {Casteo} = require('../instrucciones/Casteo.ts');
  const {Incremento} = require('../instrucciones/Incremento.ts')
  const {Decremento} = require('../instrucciones/Decremento.ts')
  const {Vector} = require('../instrucciones/Vector.ts')

%}

%lex
%options case-insensitive

letra  [a-zA-Z]
variable ([\_][^\n\_]* [\_])
cadena [\"][^\"]*[\"]
caracter ([\'][^\n\']* [\'])
numero [0-9]+([.][0-9]+)?
bool    "true"|"false"    

%%

\s+                   /* skip whitespace */
"//".*                              // comentario simple línea
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/] // comentario multiple líneas

{cadena}        return 'cadena'
{numero}        return 'numero'
{bool}          return 'bool'
{caracter}      return 'char'


"String"   return 'pr_string'
"Int"   return 'pr_int'
"Boolean" return 'pr_bool'
"Char" return 'pr_char'
"Double" return 'pr_double'
"Print" return 'pr_print'
"New" return 'pr_new'


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
    | CASTEO {$$=$1;}
    | INCREMENTO {$$=$1;}
    | DECREMENTO {$$=$1;}
    | ENCAPSULAMIENTO {$$=$1;}
    | VECTORES {$$=$1;}
    | IMPRIMIR {$$=$1;}
;


DECLARACIONES:  TIPOS 'expreID' '=' OPERACIONA ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | TIPOS 'expreID' '=' 'cadena' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | TIPOS 'expreID' '=' 'char' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | TIPOS 'expreID' '=' 'bool' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | TIPOS LISTAVARIABLES  '=' OPERACIONA ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | TIPOS LISTAVARIABLES  '=' 'cadena' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | TIPOS LISTAVARIABLES  '=' 'char' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | TIPOS LISTAVARIABLES  '=' 'bool' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
    | TIPOS LISTAVARIABLES ';' {$$= new Declaracion($2,$1,@1.first_line,@1.first_column); }
    | TIPOS 'expreID' ';' {$$= new Declaracion($2,$1,@1.first_line,@1.first_column); }
;

LISTAVARIABLES: 'expreID' LISTAVARIABLES2 {$$=$2;}
;

LISTAVARIABLES2: ',' 'expreID' LISTAVARIABLES2 {$$=$2;}
                | ',' 'expreID'
;


ASIGNACIONES: 'expreID' '=' OPERACIONA ';' {$$= new Asignacion($3);}
            | 'expreID' '=' 'cadena' ';' {$$= new Asignacion($3);}
            | 'expreID' '=' 'bool' ';' {$$= new Asignacion($3);}
            | 'expreID' '=' 'char' ';' {$$= new Asignacion($3);}
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

CASTEO: TIPOS 'expreID' '=' '(' TIPOS ')' 'numero' ';' {$$= new Casteo($7);}
        | TIPOS 'expreID' '=' '(' TIPOS ')' 'cadena' ';' {$$= new Casteo($7);}
        | TIPOS 'expreID' '=' '(' TIPOS ')' 'char' ';' {$$= new Casteo($7);}
        | TIPOS 'expreID' '=' '(' TIPOS ')' 'bool' ';' {$$= new Casteo($7);}
;

INCREMENTO: 'expreID' '+' '+' ';' {$$= new Incremento($1);}
;

DECREMENTO: 'expreID' '-' '-' ';' {$$= new Decremento($1);}
;


ENCAPSULAMIENTO: '{' LISTAINSTRUCCIONES '}' { $$= new Bloque($2,@1.first_line,@1.first_column);}
                | '{' 'cadena' ',' 'cadena' '}' { $$= new Bloque($4,@1.first_line,@1.first_column);}
;

VECTORES: TIPOS '[' ']' 'expreID' '=' 'pr_new' TIPOS '[' 'numero' ']' ';' {$$= new Vector($4);}
        | TIPOS '[' ']' '[' ']' 'expreID' '=' 'pr_new' TIPOS '[' '(' TIPOS ')' 'cadena' ']' '[' 'numero' ']' ';' {$$= new Vector($6);}
;

TIPOS: 'pr_int' {$$=$1;}
    |'pr_char' {$$=$1;}
    |'pr_string' {$$=$1;}
    | 'pr_bool' {$$=$1;}
    | 'pr_double' {$$=$1;}
;


IMPRIMIR: 'pr_print' '(' 'cadena' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
;