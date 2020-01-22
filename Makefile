
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

tigc: tiger.mlb tokens.sml tiger.sml tiger.lex.sml
	@mlton -output tigc tiger.mlb
