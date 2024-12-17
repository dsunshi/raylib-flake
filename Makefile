

CFLAGS=-Wall -Wextra -pedantic
PKGS=x11 raylib
CFLAGS+=`pkg-config --cflags $(PKGS)`

LIBS=-lGL -lm -lpthread -ldl -lrt
LIBS+=`pkg-config --libs $(PKGS)`

all:
	gcc src/main.c $(CFLAGS) $(LIBS)
