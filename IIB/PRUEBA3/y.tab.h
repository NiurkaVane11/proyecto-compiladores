#ifndef _yy_defines_h_
#define _yy_defines_h_

#define NUM 257
#define ID 258
#define MAS 259
#define MENOS 260
#define POR 261
#define DIV 262
#define PARI 263
#define PARD 264
#define FIN 265
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE {
    double dval;
    char *sval;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
