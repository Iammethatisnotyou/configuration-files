CC = gcc
CFLAGS = -O3
WARNINGS = -Wall -Wextra -Wpedantic -Wshadow
LDFLAGS = -lncurses
XORGFLAGS = -lX11
SOURCE = main.c
TARGET = comp_layout

all: $(TARGET)

$(TARGET): $(SOURCE)
	$(CC) $(LDFLAGS) $(XORGFLAGS) -o $@ $(SOURCE)
clean:
	rm -f $(TARGET)
