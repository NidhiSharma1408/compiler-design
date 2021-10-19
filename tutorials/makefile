src = calculator
objfiles = $(src).tab.o  lex.yy.o

a.out : $(objfiles)
	cc $(objfiles) -o calc

$(src).tab.c : $(src).y
	bison -d -v $(src).y

lex.yy.c : $(src).l
	flex $(src).l

$(src).tab.o: $(src).tab.c
	cc -Wall -c $(src).tab.c

lex.yy.o : lex.yy.c
	cc -Wall -c lex.yy.c

clean :
	rm calc $(src).tab.c $(src).tab.h lex.yy.c $(objfiles)
