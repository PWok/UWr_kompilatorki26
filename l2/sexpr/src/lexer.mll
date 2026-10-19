{

open Lexing
open Parser

}

let whitespace = [' ' '\t' '\r']
let digit = ['0'-'9']

let spec = "0b" | "0o" | "0x"
let int = ['-' '+']? spec? digit+ 

let id = [^ '\000'-'\031' '\127' '"' '\'' '#' ',' ':' '\\' '(' ')' '-' '+' '0'-'9' ' ' '\t' '\r' '\n'] [^ '\000'-'\031' '\127' '"' '\'' '#' ',' ':' '\\' '(' ')' ' ' '\t' '\r' '\n']*

let str_body = ['a'-'z' '0'-'9' 'A'-'Z']+ (* lepiej stringi *)
let id_body = str_body


rule token = parse
    '\n'
    { Lexing.new_line lexbuf;
      token lexbuf
    }
  | whitespace+ { token lexbuf }
  | eof  { EOF }
  | '('  { LPAREN }
  | ')'  { RPAREN }
  | int as x { INT (int_of_string x)}
  | '"' str_body as s '"' { STRING s }
  | "'" id_body as s "'" { ID s } 
  | id as s { ID s }
  | ';' { comment lexbuf}

and comment = parse
     '\n' 
     { Lexing.new_line lexbuf;
      token lexbuf
     }
    | _ {comment lexbuf}


{



}