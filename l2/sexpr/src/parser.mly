%{
  open Ast
%}
%token <int> INT
%token <string> STRING
%token <string> ID
%token LPAREN
%token RPAREN
%token EOF
%start <Ast.sexpr> prog
%%


prog:
  | v = sexpr ; EOF {v}
  ;

sexpr:
  | i = INT { Int i }
  | s = STRING { Str s }
  | i = ID { Id i}
  | LPAREN; sl = list(sexpr); RPAREN { Sexpr sl}
  ;