type sexpr = 
  | Int of int
  | Str of string
  | Id of string
  | Sexpr of sexpr list