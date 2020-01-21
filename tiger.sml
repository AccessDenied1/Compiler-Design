structure Tigh =
struct


(*fun load lexer = case lexer () of
		     SOME i => i :: load lexer
		   | NONE   => []*)

val interactive = TighLex.makeLexer (fn _ => TextIO.inputN (TextIO.stdIn,1))

fun lexfile file = let val strm = TextIO.openIn file
		   in TighLex.makeLexer (fn n => TextIO.inputN(strm,n))
		   end


(* Running with a lexer *)
fun runWithLexer lexer = let fun loop stack = case lexer () of
						  EOF      => print("")
					       |  inst => print(inst)
			 in loop []
			 end


val _ =  ( case CommandLine.arguments() of
	       [] => runWithLexer interactive
	    |  xs => (List.map (runWithLexer o lexfile) xs; ())
	 )
end
