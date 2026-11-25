all: main

lib:
	mkdir -p lib

lib/add.o: src/add.c include/add.h | lib
	gcc -Iinclude -Wall -c src/add.c -o lib/add.o

lib/sub.o: src/sub.c include/sub.h | lib
	gcc -Iinclude -Wall -c src/sub.c -o lib/sub.o

lib/libcal.a: lib/add.o lib/sub.o
	ar rcs lib/libcal.a lib/add.o lib/sub.o

main: main.c lib/libcal.a
	gcc -Iinclude -Wall main.c -Llib -lcal -o main

clean:
	rm -f lib/add.o lib/sub.o main

.PHONY: all clean
