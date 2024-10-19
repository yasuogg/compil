%{

#include "synt.tab.h"

int nb_ligne=1;

%}

lettre [a-zA-Z_]

chiffre [0-9]

IDF {lettre}({lettre}|{chiffre})*

cst {chiffre}+

%%

Program return mc_pmg;  
begin return mc_begin;
end return mc_end;
var return mc_var;
int return mc_int;
real return mc_real;
, return vg;
; return pvg;
chaine return mc_chaine;
{cst} return mc_cst;
{IDF} return idf;

[ \t]

\n {nb_ligne++; }

. printf("erreur lexicale à la ligne %d \n",nb_ligne);

