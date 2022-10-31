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
const {If} = require('../instrucciones/If.ts')
const {SwitchG} = require('../instrucciones/Switch.ts')
const {WhileG} = require('../instrucciones/While.ts')
const {For} = require('../instrucciones/For.ts')
const {DoWhile} = require('../instrucciones/DoWhile.ts')
const {Break} = require('../instrucciones/Break.ts')
const {Continue} = require('../instrucciones/Continue.ts')
const {Return} = require('../instrucciones/Return.ts')
const {Funcion} = require('../instrucciones/Funcion.ts')
const {Metodo} = require('../instrucciones/Metodo.ts')
const {Ejecutar} = require('../instrucciones/Ejecutar.ts')
const {Lower} = require('../instrucciones/Lower.ts')
const {Upper} = require('../instrucciones/Upper.ts')
const {Round} = require('../instrucciones/Round.ts')
const {Length} = require('../instrucciones/Length.ts')
const {Typeof} = require('../instrucciones/Typeof.ts')
const {ToString} = require('../instrucciones/ToString.ts')
const {ToCharArray} = require('../instrucciones/ToCharArray.ts')
const {Push} = require('../instrucciones/Push.ts')
const {Pop} = require('../instrucciones/Pop.ts')
const {Run} = require('../instrucciones/Run.ts')

%}

%lex
%options case-insensitive

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
"Println" return 'pr_println'
"New" return 'pr_new'
"If" return 'pr_if'
"Elif" return 'pr_elif'
"Else" return 'pr_else'
"Case" return 'pr_case'
"Switch" return 'pr_switch'
"Default" return 'pr_default'
"While" return 'pr_while'
"For" return 'pr_for'
"Do" return 'pr_do'
"Break" return 'pr_break'
"Continue" return 'pr_continue'
"Return" return 'pr_return'
"Void" return 'pr_void'
"toLower" return 'pr_tolower'
"toUpper" return 'pr_toupper'
"Round" return 'pr_round'
"Length" return 'pr_length'
"Typeof" return 'pr_typeof'
"ToString" return 'pr_tostring'
"ToCharArray" return 'pr_tochararray'
"Push" return 'pr_push'
"Pop" return 'pr_pop'
"Run" return 'pr_run'


"." return '.'
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
"<"  return '<'
">"  return '>'
">=" return ">="
"<=" return "<="
"&&"  return '&&'
"==" return "=="
"!=" return "!="
":"  return ':'
"|" return '|'



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
%left '>'
%left '<'
%left '>='
%left '<='
%left '=='
%left '&&'
%left '!='
%left '|'
%right '!'

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
    | IF {$$=$1;}
    | SWITCH {$$=$1;}
    | WHILE {$$=$1;}
    | FOR {$$=$1;}
    | DOWHILE {$$=$1;}
    | BREAK {$$=$1;}
    | CONTINUE {$$=$1;}
    | RETURN {$$=$1;}
    | FUNCIONES {$$=$1;}
    | METODO  {$$=$1;}
    | EJECUTAR {$$=$1;}
    | PRINT {$$=$1;}
    | PRINTLN {$$=$1;}
    | TOLOWER {$$=$1;}
    | TOUPPER {$$=$1;}
    | ROUND {$$=$1;}
    | LENGTH {$$=$1;}
    | TYPEOF {$$=$1;}
    | TOSTRING {$$=$1;}
    | TOCHARARRAY {$$=$1;}
    | PUSH {$$=$1;}
    | POP {$$=$1;}
    | RUN {$$=$1;}
    | error {console.log("error sintactico")}
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


ASIGNACIONES: 'expreID' '=' OPERACIONA ';' {$$= new Asignacion($1, $3,@1.first_line,@1.first_column);}
            | 'expreID' '=' 'cadena' ';' {$$= new Asignacion($1, $3,@1.first_line,@1.first_column);}
            | 'expreID' '=' 'bool' ';' {$$= new Asignacion($1, $3,@1.first_line,@1.first_column);}
            | 'expreID' '=' 'char' ';' {$$= new Asignacion($1, $3,@1.first_line,@1.first_column);}
            | 'expreID' '=' 'expreID' ';'  {$$= new Asignacion($1, $3,@1.first_line,@1.first_column);}
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

RELACIONAL: EXPRESION '>' EXPRESION {$$=$1 + '>' + $3;}
        | EXPRESION '<' EXPRESION {$$=$1 + '<' + $3;}
        | EXPRESION '>=' EXPRESION {$$=$1 + '>=' + $3;}
        | EXPRESION '<=' EXPRESION {$$=$1 + '<=' + $3;}
        | EXPRESION '==' EXPRESION {$$=$1 + '==' + $3;}
        | EXPRESION '!=' EXPRESION {$$=$1 + '!=' + $3;}
;

LOGICO: EXPRESION '|' EXPRESION {$$=$1 + '|' + $3;}
        | EXPRESION '&&' EXPRESION {$$=$1 + '&&' + $3;}
        | EXPRESION '!' EXPRESION {$$=$1 + '!' + $3;}
;

CASTEO: TIPOS 'expreID' '=' '(' TIPOS ')' 'numero' ';' {$$= new Casteo($2, $1, $5, $7);}
        | TIPOS 'expreID' '=' '(' TIPOS ')' 'cadena' ';' {$$= new Casteo($2, $1, $5, $7);}
        | TIPOS 'expreID' '=' '(' TIPOS ')' 'char' ';' {$$= new Casteo($2, $1, $5, $7);}
        | TIPOS 'expreID' '=' '(' TIPOS ')' 'bool' ';' {$$= new Casteo($2, $1, $5, $7);}
;

INCREMENTO: 'expreID' '+' '+' ';' {$$= new Incremento($1);}
;

DECREMENTO: 'expreID' '-' '-' ';' {$$= new Decremento($1);}
;


ENCAPSULAMIENTO: '{' LISTAINSTRUCCIONES '}' { $$= new Bloque($2,@1.first_line,@1.first_column);}
                | '{' 'cadena' ',' 'cadena' '}' { $$= new Bloque($4,@1.first_line,@1.first_column);}
;

VECTORES: DECLARARVECTOR {$$=$1;}
        | ACCESOVECTOR {$$=$1;}
        | MODIFICARVECTOR {$$=$1;}
;

DECLARARVECTOR: TIPOS '[' ']' 'expreID' '=' 'pr_new' TIPOS '[' 'numero' ']' ';' {$$= new Vector($4);}
        | TIPOS '[' ']' '[' ']' 'expreID' '=' 'pr_new' TIPOS '[' '(' TIPOS ')' 'cadena' ']' '[' 'numero' ']' ';' {$$= new Vector($6);}
        | TIPOS '[' ']' '[' ']' 'expreID' '=' 'pr_new' TIPOS '[' 'numero' ']' '[' 'numero' ']' ';' {$$= new Vector($6);}
        | TIPOS '[' ']' 'expreID' '='  '{' LISTAVALORES '}' ';' {$$= new Vector($4);}
        | TIPOS '[' ']' '[' ']' 'expreID' '=' '{' '{' LISTAVALORES '}' ',' '{' LISTAVALORES '}' '}' ';' {$$= new Vector($6);}
;

ACCESOVECTOR: TIPOS 'expreID' '=' 'expreID' '[' 'numero' ']' ';' {$$= new Vector($2);}
        | TIPOS 'expreID' '=' 'expreID' '[' 'numero' ']' '[' 'numero' ']' ';' {$$= new Vector($2);}
        
;

MODIFICARVECTOR: 'expreID' '[' 'numero' ']' '=' 'cadena' ';' {$$= new Vector($1);}
        | 'expreID' '[' 'numero' ']'  '=' 'cadena' '+' 'expreID' '[' 'numero' ']' ';' {$$= new Vector($2);}
;

TIPOS: 'pr_int' {$$=$1;}
    |'pr_char' {$$=$1;}
    |'pr_string' {$$=$1;}
    | 'pr_bool' {$$=$1;}
    | 'pr_double' {$$=$1;}
;

LISTAVALORES: 'cadena' ',' 'cadena' {$$=$1;}
            | 'numero' ',' 'numero' {$$=$1;}
;


IF: 'pr_if' '(' CONDICIONIF ')' '{' LISTAINSTRUCCIONES '}' { $$= new If($6,@1.first_line,@1.first_column);}
    | 'pr_if' '(' CONDICIONIF ')' '{' LISTAINSTRUCCIONES '}' 'pr_else' '{' LISTAINSTRUCCIONES '}' { $$= new If($6,@1.first_line,@1.first_column);}
    | 'pr_if' '(' CONDICIONIF ')' '{' LISTAINSTRUCCIONES '}' 'pr_elif' '(' CONDICIONIF ')' '{' LISTAINSTRUCCIONES '}' 'pr_else' '{' LISTAINSTRUCCIONES '}' { $$= new If($6,@1.first_line,@1.first_column);}
;

CONDICIONIF: 'expreID' OPERAD 'numero' {$$=$1;}
        | 'expreID' OPERAD 'cadena' {$$=$1;}
        | 'expreID' OPERAD 'caracter' {$$=$1;}
        | 'expreID' OPERAD 'bool' {$$=$1;}
        | 'expreID' OPERAD 'numero' '&&' 'expreID' OPERAD 'numero'  {$$=$1;}
;

OPERAD: '<' {$$=$1;}
        | '>' {$$=$1;}
        | '<=' {$$=$1;}
        | '>=' {$$=$1;}
        | "==" {$$=$1;}
        | "!=" {$$=$1;}
;


SWITCH: 'pr_switch' '(' 'expreID' ')' '{' LISTACASE 'pr_default' ':' LISTAINSTRUCCIONES  '}' {$$= new SwitchG($3);}
;



LISTACASE: 'pr_case' 'numero' ':' LISTAINSTRUCCIONES LISTACASE {$$=$4;}
        | 'pr_case' 'numero' ':' LISTAINSTRUCCIONES {$$=$4;}
;


WHILE: 'pr_while' '(' CONDICIONIF ')' '{' LISTAINSTRUCCIONES '}' {$$= new WhileG($4);}
;

FOR: 'pr_for' '(' TIPOS 'expreID' '=' 'numero' ';' 'expreID' OPERAD 'numero' ';' 'expreID' '+' '+' ')' '{' LISTAINSTRUCCIONES '}' {$$= new For($17);}
    | 'pr_for' '(' 'expreID' '=' 'numero' ';' 'expreID' OPERAD 'numero' ';' 'expreID' '=' EXPRESIONES ')' '{' LISTAINSTRUCCIONES '}' {$$= new For($17);}
;

DOWHILE: 'pr_do' '{' LISTAINSTRUCCIONES '}' 'pr_while' '(' CONDICIONIF ')' ';' {$$ = new DoWhile($3);}
;

BREAK: 'pr_break' ';' {$$=new Break($1);}
;

CONTINUE: 'pr_continue' ';' {$$=new Continue($1);}
;

RETURN: 'pr_return' ';' {$$=new Return($1);}
;


FUNCIONES: 'expreID' '(' LISTAPARAMETROS ')' ':' TIPOS '{' LISTAINSTRUCCIONES '}' {$$=new Funcion($8);}
;

LISTAPARAMETROS: TIPOS 'expreID' {$$=$1;}
                | LISTAPARAMETROS ',' TIPOS 'expreID' {$$=$1;}
;

METODO: 'expreID' '(' ')' ':' 'pr_void' '{' LISTAINSTRUCCIONES '}' {$$= new Metodo($7);}
        | 'expreID' '(' ')' '{' LISTAINSTRUCCIONES '}' {$$= new Metodo($5);}
        | 'expreID' '(' 'LISTAPARAMETROS' ')' ':' 'pr_void' '{' LISTAINSTRUCCIONES '}' {$$= new Metodo($7);}
        | 'expreID' '(' 'LISTAPARAMETROS' ')' '{' LISTAINSTRUCCIONES '}' {$$= new Metodo($5);}
        
;

EJECUTAR: 'expreID' '(' ')' ';' {$$= new Ejecutar($1);}
;


PRINT: 'pr_print' '(' 'cadena' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_print' '(' 'expreID' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_print' '(' 'cadena' ')' '+' 'expreID' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_print' '(' 'expreID' ')' '+' 'expreID' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_print' '(' 'cadena' ')' '+' 'numero' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_print' '(' 'expreID' ')' '+' 'numero' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
;

PRINTLN: 'pr_println' '(' 'cadena' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'expreID' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'cadena' ')' '+' 'expreID' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'expreID' ')' '+' 'expreID' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'cadena' ')' '+' 'numero' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'expreID' ')' '+' 'numero' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'expreID' '+' 'numero' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'cadena' '+' 'numero' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'cadena' '+' 'expreID' '+' 'cadena' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'expreID' '+' 'expreID' '+' 'cadena' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
    | 'pr_println' '(' 'expreID' '+' 'cadena' '+' 'expreID' ')' ';' {$$= new Impresion($3,@1.first_line,@1.first_column);}
;

TOLOWER: TIPOS 'expreID' '=' 'pr_tolower' '(' 'cadena' ')' ';' {$$ = new Lower($2);}
        | TIPOS 'expreID' '=' 'pr_tolower' '(' 'cadena' '+' 'numero' ')' ';' {$$= new Lower($2);}
;

TOUPPER: TIPOS 'expreID' '=' 'pr_toupper' '(' 'cadena' ')' ';' {$$ = new Upper($2);}
        | TIPOS 'expreID' '=' 'pr_toupper' '(' 'cadena' '+' 'numero' ')' ';' {$$= new Upper($2);}
;

ROUND: TIPOS 'expreID' '=' 'pr_round' '(' 'numero' ')' ';' {$$= new Round($2);}
;


LENGTH:  TIPOS 'expreID' '=' 'pr_length' '(' 'expreID' ')' ';' {$$= new Length($2);}
        | TIPOS 'expreID' '=' 'pr_length' '(' 'expreID' '[' 'numero' ']' ')' ';' {$$= new Length($2);}
        |'pr_length' '(' 'expreID' ')' ';' {$$= new Length($3);}
;

TYPEOF: 'pr_typeof' '(' 'numero' ')' ';' {$$ = new Typeof($3);}
        |TIPOS 'expreID' '=' 'pr_typeof' '(' 'numero' ')' ';' {$$= new Typeof($2); }
        |TIPOS 'expreID' '=' 'pr_typeof' '(' 'expreID' ')' ';' {$$= new Typeof($2); }
;

TOSTRING: 'pr_tostring' '(' 'numero' ')' ';' {$$ = new ToString($3);}
        |TIPOS 'expreID' '=' 'pr_tostring' '(' 'numero' ')' ';' {$$= new ToString($6); }
        |TIPOS 'expreID' '=' 'pr_tostring' '(' 'expreID' ')' ';' {$$= new ToString($6); }
        |TIPOS 'expreID' '=' 'pr_tostring' '(' 'bool' ')' ';' {$$= new ToString($6); }
;


PUSH: 'expreID' '.' 'pr_push' '(' 'numero' ')' ';' {$$= new Push($5);}
    | 'expreID' '.' 'pr_push' '(' 'cadena' ')' ';' {$$= new Push($5);}
    | 'expreID' '.' 'pr_push' '(' 'caracter' ')' ';' {$$= new Push($5);}
    | 'expreID' '.' 'pr_push' '(' ')' ';' {$$= new Push($5);}
;

POP: 'expreID' '.' 'pr_pop' '(' 'numero' ')' ';' {$$= new Pop($5);}
    | 'expreID' '.' 'pr_pop' '(' 'cadena' ')' ';' {$$= new Pop($5);}
    | 'expreID' '.' 'pr_pop' '(' 'caracter' ')' ';' {$$= new Pop($5);}
    | 'expreID' '.' 'pr_pop' '(' ')' ';' {$$= new Pop($5);}
;

RUN: 'pr_run' 'expreID' '(' ')' ';' {$$= new Run($2);}
    | 'pr_run' 'expreID' '(' 'numero' ')' ';' {$$= new Run($2);}
    | 'pr_run' 'expreID' '(' 'cadena' ')' ';' {$$= new Run($2);}
    | 'pr_run' 'expreID' '(' 'caracter' ')' ';' {$$= new Run($2);}
;