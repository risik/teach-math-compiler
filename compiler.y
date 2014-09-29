%{
#include <stdio.h>
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%%
e : e '+' e     { printf("+ "); }
  | e '-' e     { printf("- "); }
  | e '*' e     { printf("* "); }
  | e '/' e     { printf("/ "); }
  | NUMBER      { printf("%d ", yylval); }
  | '(' e ')'   { }
  ;
%%

int main() { 
  int res = yyparse(); 
  printf("\n");
  return res;
}

int yyerror(char *message)
{
    fprintf(stderr, "ERROR: %s\n", message);
}
