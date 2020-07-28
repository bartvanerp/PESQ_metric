#(c) Dennis Guse, 2014 (dennis.guse@alumni.tu-berlin.de)

DESTDIR =
PREFIX = /usr
BINDIR = /bin

all : build

build : bin/pesq

install : build
	install -dm755 bin/pesq "$(DESTDIR)$(PREFIX)$(BINDIR)"

distclean : clean

clean :
	rm -rf bin/
	rm -rf src/*.gch

bin :
	mkdir bin

bin/pesq : bin
	$(CC) $(CFLAGS) -o $@ src/*.c -lm