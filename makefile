# Compiler settings - Can be customized.
CC = clang
CFLAGS = -Wall -Wextra -std=c11

# Target binary
TARGET = db

# Source files
SOURCES = main.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Phony targets for build and run
.PHONY: build run

# Default target
all: build

# Build target
build: $(TARGET)

# Compile and link the target binary
$(TARGET): $(OBJECTS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJECTS)

# Rule for compiling source files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Run target
run: build
	./$(TARGET)

# Clean up generated files
clean:
	rm -f $(TARGET) $(OBJECTS)
