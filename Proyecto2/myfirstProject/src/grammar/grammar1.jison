%{
  //Declarciones y tambien las importaciones
  const {Declaracion} = require('../instrucciones/Declaracion.ts');
  const {Asignacion} = require('../instrucciones/Asignacion.ts');
%}

%lex
%options case-insensitive


number  [0-9]+("."[0-9]+)?
id      ([a-z]+|[0-9]+|[_]+)*      
cadena   "\""  [^\"]* "\""   
bool    "True"|"False"
char ([\'][^\n\']*[\'])

%%

\s+                   /* skip whitespace */
"//".*                              // comentario simple línea
[/][][^][]+([^/][^][]+)*[/] // comentario multiple líneas


{number}               return 'expreNUMBER' 
{cadena}               return 'expreCADENA' 
{bool}                 return 'expreBOOL'
{char}                 return 'expreCHAR'


"string"   return 'pr_string'
"int"   return 'pr_int'
"char"   return 'pr_char'
"print"   return 'Systemoutprintln'
"double"  return 'pr_double'
"boolean" return 'pr_boolean'

";"  return ';'
")"  return ')'
"("  return '('
"}"  return '}'
"{"  return '{'
"["  return '['
"]"  return ']'
"="  return '='
","  return ','
"+"  return '+'
"-"  return '-'
""  return ''
"/"  return '/'
"^"  return '^'
"%"  return '%' 
([a-zA-Z_])[a-zA-Z0-9_ñÑ]*	return 'expreID';

<<EOF>>		            return 'EOF'


.   { 
        console.log("error lexico: "+yytext +"En la linea: " + yylloc.first_line +", En la columna: "+ yylloc.first_column);

    }


/lex
%left '+' '-'
%left '*' '/'
%left '^' '%'
%start INIT

%%


INIT :  LISTAINSTRUCCIONES  EOF  {return $1;}
;


LISTAINSTRUCCIONES: LISTAINSTRUCCIONES INSTRUCCION { $1.push($2);  $$= $1;  }
                |  INSTRUCCION {$$=[$1]}  
                | error { console.error('Este es un error sintáctico: ' + yytext + ', en la linea: ' + this.$.first_line + ', en la columna: ' + this.$.first_column); }
;


INSTRUCCION : DECLARACION {$$=$1;}
        | ASIGNACION {$$=$1;}
;

DECLARACION: 'pr_int' IDENT '=' OPERACIONES ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
        |    'pr_string' IDENT '=' 'expreCADENA' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
        |    'pr_double' IDENT '=' 'expreNUMBER' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
        |    'pr_boolean' IDENT '=' 'expreBOOL' ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
        |    'pr_char' IDENT '=' 'expreCHAR'  ';' {$$= new Declaracion($2,$1,$4,@1.first_line,@1.first_column); }
        |    'pr_int' IDENT ';' {$$= new Declaracion($2,$1,1,@1.first_line,@1.first_column); }
        |    'pr_string' IDENT ';' {$$= new Declaracion($2,$1,"empty",@1.first_line,@1.first_column); }
        |    'pr_double' IDENT ';' {$$= new Declaracion($2,$1,1.0,@1.first_line,@1.first_column); }
        |    'pr_boolean' IDENT ';' {$$= new Declaracion($2,$1,"True",@1.first_line,@1.first_column); }
        |    'pr_char' IDENT ';' {$$= new Declaracion($2,$1,'F',@1.first_line,@1.first_column); }
;
ASIGNACION: IDENT '=' OPERACIONES ';' {$$= new Asignacion($1,$3,@1.first_line,@1.first_column);}
        | IDENT '=' expreCADENA ';' {$$= new Asignacion($1,$3,@1.first_line,@1.first_column);}
        | IDENT '=' 'expreBOOL' ';' {$$= new Asignacion($1,$3,@1.first_line,@1.first_column);}
        | IDENT '=' 'expreCHAR' ';' {$$= new Asignacion($1,$3,@1.first_line,@1.first_column);} 
;
IDENT: IDENT ',' 'expreID' {$$=$3;}
        | 'expreID' {$$=$1;}
;

OPERACIONES: OPERACIONES '+' OPERACIONES {$$=$1 + "+" + $3;}
        | OPERACIONES '-' OPERACIONES {$$=$1 + "-" + $3;}
        | OPERACIONES '' OPERACIONES {$$=$1 + "" + $3;}
        | OPERACIONES '/' OPERACIONES {$$=$1 + "/" + $3;}
        | OPERACIONES '^' OPERACIONES {$$=$1 + "^" + $3;}
        | OPERACIONES '%' OPERACIONES {$$=$1 + "%" + $3;}
        | '(' OPERACIONES ')' {$$= "(" + $2 + ")";}
        | '[' OPERACIONES ']'{$$= "[" + $2 + "]";}
        | 'expreNUMBER' {$$=$1;}
        | 'expreID' {$$=$1;}
;