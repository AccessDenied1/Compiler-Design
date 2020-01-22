
%.lex.sml: %.lex
	mllex $<


%.grm.sml: %.grm
	mlyacc $<

all: tigc 

PHONY: all clean test

clean:
	@echo "Cleaning the intermediate files.."
	@rm -f *.lex.sml
	@rm -f tigc
	@echo "Done!"

test:
	@echo "No test cases"

<<<<<<< HEAD
tigc: tiger.lex.sml tiger.mlb tokens.sml tiger.sml
=======
tigc: tiger.mlb tokens.sml tiger.sml tiger.lex.sml
>>>>>>> 440f964cfe201b3b445a0fa80b08514a510cc6cd
	@mlton -output tigc tiger.mlb
