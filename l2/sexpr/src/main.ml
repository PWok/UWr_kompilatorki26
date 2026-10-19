open Ast

let parse (s : string) : sexpr =
  Parser.prog Lexer.token (Lexing.from_string s)
