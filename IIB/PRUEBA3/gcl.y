%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);

/* Tabla de simbolos muy simple para las variables (id) */
#define MAXVAR 100
typedef struct { char nombre[64]; double valor; } Variable;
Variable tabla[MAXVAR];
int nvar = 0;

double getValor(char *nombre){
    for(int i = 0; i < nvar; i++){
        if(strcmp(tabla[i].nombre, nombre) == 0) return tabla[i].valor;
    }
    /* Si la variable no existe, se crea con valor 0 y se avisa */
    strcpy(tabla[nvar].nombre, nombre);
    tabla[nvar].valor = 0;
    nvar++;
    printf("Aviso: variable '%s' no definida, se asume valor 0\n", nombre);
    return 0;
}
%}

%union {
    double dval;
    char *sval;
}

%token <dval> NUM
%token <sval> ID
%token MAS MENOS POR DIV PARI PARD FIN

%type <dval> E Eprima T Tprima F

%%

programa:
      programa linea
    | /* vacio */
    ;

linea:
      E FIN         { printf("Resultado = %g\n", $1); }
    | FIN            /* linea en blanco */
    ;

E: T Eprima            { $$ = $1 + $2; }
    ;

Eprima:
      MAS T Eprima     { $$ = $2 + $3; }
    | MENOS T Eprima   { $$ = -$2 + $3; }
    | /* vacio */       { $$ = 0; }
    ;

T: F Tprima             { $$ = $1 * $2; }
    ;

Tprima:
      POR F Tprima     { $$ = $2 * $3; }
    | DIV F Tprima     { $$ = (1.0 / $2) * $3; }
    | /* vacio */       { $$ = 1; }
    ;

F:
      PARI E PARD      { $$ = $2; }
    | ID                { $$ = getValor($1); free($1); }
    | NUM               { $$ = $1; }
    ;

%%

void yyerror(const char *s){
    fprintf(stderr, "Error sintactico: %s\n", s);
}

int main(void){
    printf("Ingrese expresiones aritmeticas (+, -, *, /, parentesis, id, num).\n");
    printf("Presione Ctrl+D para salir.\n\n");
    yyparse();
    return 0;
}
