CC     = gcc
CFLAGS =

LEX    = lex
LFLAGS =

YACC   = yacc

LN     = gcc
LNFLAGS=

SRC    = scan.l compiler.y

OBJ    = scan.o compiler.o

all:	compiler

test: all
	./compiler < test1.txt

compiler: $(OBJ)
	$(LN) $(LNFLAGS) -o compiler $(OBJ)

scan.c: scan.l compiler.h
	$(LEX) $(LFLAGS) -o scan.c scan.l

compiler.c compiler.h: compiler.y
	$(YACC) --output=compiler.c --defines=compiler.h compiler.y

clean:; @rm -f compiler scan.c compiler.c compiler.h *.o
