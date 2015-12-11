SOURCES= first.s second.s third.s fourth.s fifth.s sixth.s seventh.s ninth.s tenth.s eleventh.s twelfth.s
OBJTAR= eleventh.o
OBJ= $(SOURCES:%.s=%.o)

all: $(OBJTAR)
	gcc -o prog $(OBJTAR)
	rm $(OBJTAR)

%.o: %.s
	as -mfpu=neon -o $@ $<

run: all
	./prog
