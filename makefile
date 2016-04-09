IDIR =src/include
CC=gcc
CFLAGS=-I$(IDIR) -W -Wall -Werror

ODIR=./src
LDIR =../lib

LIBS=-lm

_DEPS = functions.h macros.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = brookshear-emulator.o functions.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

Brookshear-Emulator: $(OBJ)
	gcc -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f ./*.o $(ODIR)/*.o *~ core $(IDIR)/*~ ./Brookshear-Emulator
