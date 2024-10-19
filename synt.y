%{
#include <stdio.h>   // Include for printf

// Declare yylex and yyerror to avoid undeclared function errors
int yylex();  // la fonction qui lance l'annaliseur lexicale       
void yyerror(const char *s); // la syntax ta3ha mattbdlch , hia li nprintiw biha 
%}

%token mc_pmg mc_begin mc_end mc_int vg pvg idf mc_var mc_cst mc_real mc_chaine

%%

S: mc_pmg idf T mc_begin mc_end { printf("syntaxe correcte\n"); YYACCEPT; }
; 
T: mc_var H { printf("syntaxe correcte\n"); YYACCEPT; }
;
H: mc_int B pvg 
 | mc_real B pvg
 | mc_chaine B_ARRAY pvg 
;
B:  idf
 | B vg idf  { printf("syntaxe correcte\n"); YYACCEPT; }
;

B_ARRAY: idf '[' mc_cst ']'  // Déclaration de tableau de type char, ex: t[11]
 | B_ARRAY vg idf '[' mc_cst ']'
;

%%

// Explicitly declare return type for main
int main() 
{
    yyparse();
    return 0;  // Return 0 to indicate successful execution
}

// Explicitly declare return type for yywrap
int yywrap()
{
    return 1;  // Return 1 to indicate end of input (default behavior)
}

// Define yyerror function to handle syntax errors
void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}