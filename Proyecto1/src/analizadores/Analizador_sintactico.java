
//----------------------------------------------------
// The following code was generated by CUP v0.11b 20160615 (GIT 4ac7450)
//----------------------------------------------------

package analizadores;

import java.util.LinkedList;
import java_cup.runtime.Symbol;
import java_cup.runtime.XMLElement;

/** CUP v0.11b 20160615 (GIT 4ac7450) generated parser.
  */
@SuppressWarnings({"rawtypes"})
public class Analizador_sintactico extends java_cup.runtime.lr_parser {

 public final Class getSymbolContainer() {
    return Simbolos.class;
}

  /** Default constructor. */
  @Deprecated
  public Analizador_sintactico() {super();}

  /** Constructor which sets the default scanner. */
  @Deprecated
  public Analizador_sintactico(java_cup.runtime.Scanner s) {super(s);}

  /** Constructor which sets the default scanner. */
  public Analizador_sintactico(java_cup.runtime.Scanner s, java_cup.runtime.SymbolFactory sf) {super(s,sf);}

  /** Production table. */
  protected static final short _production_table[][] = 
    unpackFromStrings(new String[] {
    "\000\027\000\002\002\004\000\002\002\005\000\002\004" +
    "\004\000\002\004\003\000\002\005\003\000\002\005\003" +
    "\000\002\005\003\000\002\005\003\000\002\006\003\000" +
    "\002\006\003\000\002\006\003\000\002\010\011\000\002" +
    "\011\011\000\002\011\011\000\002\012\005\000\002\012" +
    "\004\000\002\013\011\000\002\013\011\000\002\007\006" +
    "\000\002\020\007\000\002\014\005\000\002\021\005\000" +
    "\002\021\005" });

  /** Access to production table. */
  public short[][] production_table() {return _production_table;}

  /** Parse-action table. */
  protected static final short[][] _action_table = 
    unpackFromStrings(new String[] {
    "\000\073\000\004\026\004\001\002\000\012\004\023\036" +
    "\013\041\011\071\015\001\002\000\004\002\006\001\002" +
    "\000\004\002\001\001\002\000\016\004\ufff7\036\ufff7\041" +
    "\ufff7\044\ufff7\071\ufff7\073\ufff7\001\002\000\014\004\023" +
    "\036\013\041\011\071\015\073\ufffe\001\002\000\004\004" +
    "\067\001\002\000\016\004\ufffd\036\ufffd\041\ufffd\044\ufffd" +
    "\071\ufffd\073\ufffd\001\002\000\004\004\034\001\002\000" +
    "\016\004\ufffb\036\ufffb\041\ufffb\044\ufffb\071\ufffb\073\ufffb" +
    "\001\002\000\006\004\030\011\031\001\002\000\004\073" +
    "\027\001\002\000\016\004\ufffc\036\ufffc\041\ufffc\044\ufffc" +
    "\071\ufffc\073\ufffc\001\002\000\016\004\ufffa\036\ufffa\041" +
    "\ufffa\044\ufffa\071\ufffa\073\ufffa\001\002\000\016\004\ufff8" +
    "\036\ufff8\041\ufff8\044\ufff8\071\ufff8\073\ufff8\001\002\000" +
    "\016\004\ufff9\036\ufff9\041\ufff9\044\ufff9\071\ufff9\073\ufff9" +
    "\001\002\000\004\022\024\001\002\000\004\011\025\001" +
    "\002\000\004\007\026\001\002\000\016\004\uffef\036\uffef" +
    "\041\uffef\044\uffef\071\uffef\073\uffef\001\002\000\004\002" +
    "\000\001\002\000\004\007\033\001\002\000\004\007\032" +
    "\001\002\000\016\004\uffec\036\uffec\041\uffec\044\uffec\071" +
    "\uffec\073\uffec\001\002\000\016\004\uffeb\036\uffeb\041\uffeb" +
    "\044\uffeb\071\uffeb\073\uffeb\001\002\000\006\006\044\037" +
    "\043\001\002\000\004\037\036\001\002\000\004\033\037" +
    "\001\002\000\004\040\040\001\002\000\004\011\041\001" +
    "\002\000\004\007\042\001\002\000\016\004\ufff4\036\ufff4" +
    "\041\ufff4\044\ufff4\071\ufff4\073\ufff4\001\002\000\012\027" +
    "\050\032\052\033\051\037\ufff2\001\002\000\004\004\045" +
    "\001\002\000\006\006\044\037\047\001\002\000\004\037" +
    "\ufff3\001\002\000\004\037\ufff2\001\002\000\004\040\061" +
    "\001\002\000\004\040\056\001\002\000\004\040\053\001" +
    "\002\000\004\010\054\001\002\000\004\007\055\001\002" +
    "\000\016\004\ufff6\036\ufff6\041\ufff6\044\ufff6\071\ufff6\073" +
    "\ufff6\001\002\000\004\011\057\001\002\000\004\007\060" +
    "\001\002\000\016\004\ufff5\036\ufff5\041\ufff5\044\ufff5\071" +
    "\ufff5\073\ufff5\001\002\000\006\030\062\031\063\001\002" +
    "\000\004\007\065\001\002\000\004\007\064\001\002\000" +
    "\016\004\ufff0\036\ufff0\041\ufff0\044\ufff0\071\ufff0\073\ufff0" +
    "\001\002\000\016\004\ufff1\036\ufff1\041\ufff1\044\ufff1\071" +
    "\ufff1\073\ufff1\001\002\000\004\043\072\001\002\000\004" +
    "\042\070\001\002\000\004\004\071\001\002\000\004\043" +
    "\uffed\001\002\000\012\004\023\036\013\041\011\071\015" +
    "\001\002\000\004\044\074\001\002\000\016\004\uffee\036" +
    "\uffee\041\uffee\044\uffee\071\uffee\073\uffee\001\002\000\004" +
    "\073\uffff\001\002" });

  /** Access to parse-action table. */
  public short[][] action_table() {return _action_table;}

  /** <code>reduce_goto</code> table. */
  protected static final short[][] _reduce_table = 
    unpackFromStrings(new String[] {
    "\000\073\000\004\002\004\001\001\000\024\004\015\005" +
    "\007\006\011\007\016\010\021\011\020\013\006\020\013" +
    "\021\017\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\024\004\074\005\007\006\011\007\016" +
    "\010\021\011\020\013\006\020\013\021\017\001\001\000" +
    "\004\014\065\001\001\000\002\001\001\000\004\012\034" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\004\012\045\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\002\001\001\000\002\001" +
    "\001\000\002\001\001\000\002\001\001\000\002\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001\000" +
    "\002\001\001\000\002\001\001\000\002\001\001\000\002" +
    "\001\001\000\002\001\001\000\022\005\072\006\011\007" +
    "\016\010\021\011\020\013\006\020\013\021\017\001\001" +
    "\000\002\001\001\000\002\001\001\000\002\001\001" });

  /** Access to <code>reduce_goto</code> table. */
  public short[][] reduce_table() {return _reduce_table;}

  /** Instance of action encapsulation class. */
  protected CUP$Analizador_sintactico$actions action_obj;

  /** Action encapsulation object initializer. */
  protected void init_actions()
    {
      action_obj = new CUP$Analizador_sintactico$actions(this);
    }

  /** Invoke a user supplied parse action. */
  public java_cup.runtime.Symbol do_action(
    int                        act_num,
    java_cup.runtime.lr_parser parser,
    java.util.Stack            stack,
    int                        top)
    throws java.lang.Exception
  {
    /* call code in generated class */
    return action_obj.CUP$Analizador_sintactico$do_action(act_num, parser, stack, top);
  }

  /** Indicates start state. */
  public int start_state() {return 0;}
  /** Indicates start production. */
  public int start_production() {return 0;}

  /** <code>EOF</code> Symbol index. */
  public int EOF_sym() {return 0;}

  /** <code>error</code> Symbol index. */
  public int error_sym() {return 1;}




     public static LinkedList<TError> errores = new LinkedList<TError>(); 

    public static String tipo="Lista";
    public String codigoTraducido="";

    
    /**
     * Método al que se llama automáticamente ante algún error sintactico.
     **/ 
    public void syntax_error(Symbol s){ 
        System.out.println("Error Sintáctico en la Línea " + (s.left) +
        " Columna "+s.right+ ". No se esperaba este componente: " +s.value+"."); 
    } 

    /**
     * Método al que se llama automáticamente ante algún error sintáctico 
     * en el que ya no es posible una recuperación de errores.
     **/ 
    public void unrecovered_syntax_error(Symbol s) throws java.lang.Exception{ 
        System.out.println("Error síntactico irrecuperable en la Línea " + 
        (s.left)+ " Columna "+s.right+". Componente " + s.value + 
        " no reconocido."); 
    }  


/** Cup generated class to encapsulate user supplied action code.*/
@SuppressWarnings({"rawtypes", "unchecked", "unused"})
class CUP$Analizador_sintactico$actions {
  private final Analizador_sintactico parser;

  /** Constructor */
  CUP$Analizador_sintactico$actions(Analizador_sintactico parser) {
    this.parser = parser;
  }

  /** Method 0 with the actual generated action code for actions 0 to 300. */
  public final java_cup.runtime.Symbol CUP$Analizador_sintactico$do_action_part00000000(
    int                        CUP$Analizador_sintactico$act_num,
    java_cup.runtime.lr_parser CUP$Analizador_sintactico$parser,
    java.util.Stack            CUP$Analizador_sintactico$stack,
    int                        CUP$Analizador_sintactico$top)
    throws java.lang.Exception
    {
      /* Symbol object for return from actions */
      java_cup.runtime.Symbol CUP$Analizador_sintactico$result;

      /* select the action based on the action number */
      switch (CUP$Analizador_sintactico$act_num)
        {
          /*. . . . . . . . . . . . . . . . . . . .*/
          case 0: // $START ::= INICIO EOF 
            {
              Object RESULT =null;
		int start_valleft = ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)).left;
		int start_valright = ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)).right;
		Object start_val = (Object)((java_cup.runtime.Symbol) CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)).value;
		RESULT = start_val;
              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("$START",0, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          /* ACCEPT */
          CUP$Analizador_sintactico$parser.done_parsing();
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 1: // INICIO ::= prInicio INSTRUCCIONES prFin 
            {
              Object RESULT =null;
		System.out.println("FIN DE ANALISIS");
              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INICIO",0, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-2)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 2: // INSTRUCCIONES ::= INSTRUCCION INSTRUCCIONES 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INSTRUCCIONES",2, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 3: // INSTRUCCIONES ::= INSTRUCCION 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INSTRUCCIONES",2, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 4: // INSTRUCCION ::= DECLARACIONES 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INSTRUCCION",3, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 5: // INSTRUCCION ::= ASIGNACIONES 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INSTRUCCION",3, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 6: // INSTRUCCION ::= IF 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INSTRUCCION",3, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 7: // INSTRUCCION ::= IMPRIMIR 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INSTRUCCION",3, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 8: // DECLARACIONES ::= INGRESARNUM 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("DECLARACIONES",4, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 9: // DECLARACIONES ::= INGRESARCADENA 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("DECLARACIONES",4, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 10: // DECLARACIONES ::= INGRESARBOOLEANO 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("DECLARACIONES",4, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 11: // INGRESARNUM ::= prIngresar var prComo prNumero prConValor numero tpuntoycoma 
            {
              Object RESULT =null;
		int aleft = ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-5)).left;
		int aright = ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-5)).right;
		String a = (String)((java_cup.runtime.Symbol) CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-5)).value;
		int nleft = ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)).left;
		int nright = ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)).right;
		String n = (String)((java_cup.runtime.Symbol) CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)).value;
		 codigoTraducido+= a + " = " + n + "\n";
              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INGRESARNUM",6, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-6)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 12: // INGRESARCADENA ::= prIngresar var prComo prCadena prConValor Cadena tpuntoycoma 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INGRESARCADENA",7, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-6)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 13: // INGRESARCADENA ::= prIngresar VARIABLES prComo prCadena prConValor Cadena tpuntoycoma 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INGRESARCADENA",7, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-6)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 14: // VARIABLES ::= var tcoma VARIABLES 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("VARIABLES",8, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-2)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 15: // VARIABLES ::= var prComo 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("VARIABLES",8, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-1)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 16: // INGRESARBOOLEANO ::= prIngresar var prComo prBoolean prConValor prVerdadero tpuntoycoma 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INGRESARBOOLEANO",9, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-6)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 17: // INGRESARBOOLEANO ::= prIngresar var prComo prBoolean prConValor prFalso tpuntoycoma 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("INGRESARBOOLEANO",9, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-6)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 18: // ASIGNACIONES ::= var tflecha Cadena tpuntoycoma 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("ASIGNACIONES",5, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-3)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 19: // IF ::= prSi CONDICION prEntonces INSTRUCCION prFinSi 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("IF",14, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-4)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 20: // CONDICION ::= var prEsIGUAL var 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("CONDICION",10, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-2)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 21: // IMPRIMIR ::= prImprimir Cadena tpuntoycoma 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("IMPRIMIR",15, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-2)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /*. . . . . . . . . . . . . . . . . . . .*/
          case 22: // IMPRIMIR ::= prImprimir var tpuntoycoma 
            {
              Object RESULT =null;

              CUP$Analizador_sintactico$result = parser.getSymbolFactory().newSymbol("IMPRIMIR",15, ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.elementAt(CUP$Analizador_sintactico$top-2)), ((java_cup.runtime.Symbol)CUP$Analizador_sintactico$stack.peek()), RESULT);
            }
          return CUP$Analizador_sintactico$result;

          /* . . . . . .*/
          default:
            throw new Exception(
               "Invalid action number "+CUP$Analizador_sintactico$act_num+"found in internal parse table");

        }
    } /* end of method */

  /** Method splitting the generated action code into several parts. */
  public final java_cup.runtime.Symbol CUP$Analizador_sintactico$do_action(
    int                        CUP$Analizador_sintactico$act_num,
    java_cup.runtime.lr_parser CUP$Analizador_sintactico$parser,
    java.util.Stack            CUP$Analizador_sintactico$stack,
    int                        CUP$Analizador_sintactico$top)
    throws java.lang.Exception
    {
              return CUP$Analizador_sintactico$do_action_part00000000(
                               CUP$Analizador_sintactico$act_num,
                               CUP$Analizador_sintactico$parser,
                               CUP$Analizador_sintactico$stack,
                               CUP$Analizador_sintactico$top);
    }
}

}
