 /* JFlex example: partial Java language lexer specification */
 package analizadores;
 import java_cup.runtime.*;


    /*
     * This class is a simple example lexer.
     */
%%

%public
%class analizador_lexico3
%cupsym Simbolos3
%cup
%char
%column
%full
%ignorecase
%line
%unicode



    LineTerminator = \r|\n|\r\n
    InputCharacter = [^\r\n]
    WhiteSpace     = {LineTerminator} | [ \t\f]

    /* comments */

    letra = [:jletter:]
    digito = [:jletterdigit:]
    guion = "_"
    comilla = \u0022
    punto = "."|"+"
    id = ({letra}|{digito}|{guion})+
    frase = ({comilla}({id}|{conjER}+)+{comilla})
    //conjunto ="->" ({id}|"~"|",")+~";"
    o = \u007C
    conjER = {o}|{punto}|"*"|"?"
    declaracion = "{"{id}"}"
    //er =({frase}|{declaracion}|{conjER})
    //ER = {er}({er}|{WhiteSpace})+


%%

    /* keywords */

    <YYINITIAL> {
      /* identifiers */

      {frase}                   { System.out.println("Reconocio tokenAL2: <frase>lexema:"+yytext());
                                     return new Symbol(Simbolos3.frase,yycolumn, yyline, yytext()); }

      /* operators */
      {o}                            { System.out.println("Reconocio tokenAL2: <o>lexema:"+yytext());
                                                                      return new Symbol(Simbolos3.o,yycolumn, yyline, yytext()); }
      {declaracion}                            { System.out.println("Reconocio token: <declaracion>lexema:"+yytext());
                                                                            return new Symbol(Simbolos3.declaracion,yycolumn, yyline, yytext()); }
      "+"                            { System.out.println("Reconocio tokenAL2: <mas>lexema:"+yytext());
                                                                            return new Symbol(Simbolos3.mas,yycolumn, yyline, yytext()); }
      "*"                            { System.out.println("Reconocio tokenAL2: <asterisco>lexema:"+yytext());
                                                                                 return new Symbol(Simbolos3.asterisco,yycolumn, yyline, yytext()); }
      "?"                            { System.out.println("Reconocio tokenAL2: <pregunta>lexema:"+yytext());
                                                                                       return new Symbol(Simbolos3.pregunta,yycolumn, yyline, yytext()); }
      "("                            { System.out.println("Reconocio tokenAL2: <pregunta>lexema:"+yytext());
                                                                                              return new Symbol(Simbolos3.abre_parentesis,yycolumn, yyline, yytext()); }
      ")"                            { System.out.println("Reconocio tokenAL2: <pregunta>lexema:"+yytext());
                                                                                               return new Symbol(Simbolos3.cierra_parentesis,yycolumn, yyline, yytext()); }

      {WhiteSpace}                   { /* ignore */ }
    }



    /* error fallback */
    .                              { System.out.println("Illegal character <"+
                                                        yytext()+">"); }