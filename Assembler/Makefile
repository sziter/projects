SOURCES= first.s second.s third.s fourth.s fifth.s sixth.s
OBJTAR= sixth.o
OBJ= $(SOURCES:%.s=%.o)

all: $(OBJ)
	gcc -o prog $(OBJTAR)
	rm $(OBJ)

%.o: %.s
	as -o $@ $<

run: all
	./prog
