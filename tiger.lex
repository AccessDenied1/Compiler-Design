type lexresult             = tokens
fun eof ()                 = EOF
fun charsToInt m (x :: xs) = charsToInt (10 * m + ord x - ord #"0") xs
  | charsToInt m []        = m

fun toSigned (#"-" :: xs) = ~ (charsToInt 0 xs)
  | toSigned (#"~" :: xs) = ~ (charsToInt 0 xs)
  | toSigned (#"+" :: xs) =   charsToInt 0 xs
  | toSigned xs           =   charsToInt 0 xs

val toInt  = toSigned o String.explode

%%
%structure TigerLex
whitespace=[\ \r\t\n];
digit=[0-9];
%%
{whitespace}+     => (lex()  (* White spaces are ignored *) );
"#".*\n           => (lex()  (* A line comment *)           );
[+-~]?{digit}+    => (print (yytext));
"+"               => (PLUS("+"));
"-"               => (MINUS("-"));
"*"               => (MUL("*"));
"/"               => (DIV("/"));
