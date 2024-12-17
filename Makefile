
CFLAGS=-Wall
CFLAGS+=`pkg-config --cflags raylib`

LIBS=-lGL -lm -lpthread -ldl -lrt
LIBS+=`pkg-config --libs raylib`
LIBS+=`pkg-config --libs x11`

all:
	gcc src/main.c $(CFLAGS) $(LIBS)
