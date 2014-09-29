%{
#include "compiler.h"
%}

%%

[0-9]+          { 
                    yylval=atoi(yytext); 
                    return NUMBER; 
                }
[ \t\n]         { }
[\+\-\*\/\(\)]  { return *yytext; }

%%

int yywrap() { return 1; }
