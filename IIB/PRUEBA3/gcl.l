%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

[0-9]+(\.[0-9]+)?   { yylval.dval = atof(yytext); return NUM; }

[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return ID; }

"+"     { return MAS; }
"-"     { return MENOS; }
"*"     { return POR; }
"/"     { return DIV; }
"("     { return PARI; }
")"     { return PARD; }

[ \t]+  ;               /* ignorar espacios y tabs */

\n      { return FIN; } /* fin de la expresion */

.       { printf("Caracter no reconocido: %s\n", yytext); }

%%

int yywrap(void){
    return 1;
}
