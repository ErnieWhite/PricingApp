# Makefile for Pricing Application (Win32)
# Compiler: MinGW GCC for Windows

CC = gcc
WINDRES = windres
CFLAGS = -Wall -O2 -mwindows
LDFLAGS = -mwindows
LIBS = -lcomctl32 -lgdi32

# Output executable
TARGET = PricingApp.exe

# Source files
SOURCES = main.c
RESOURCES = app.rc
RES_OBJ = app.res

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJECTS) $(RES_OBJ)
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

# Compile C source files
%.o: %.c resource.h
	$(CC) $(CFLAGS) -c $< -o $@

# Compile resource file
$(RES_OBJ): $(RESOURCES) resource.h
	$(WINDRES) -i $(RESOURCES) -o $@

# Clean build artifacts
clean:
	del /Q *.o *.res $(TARGET) 2>nul || true

# Clean for Unix-like systems (Git Bash, WSL, etc.)
clean-unix:
	rm -f *.o *.res $(TARGET)

# Rebuild everything
rebuild: clean all

.PHONY: all clean clean-unix rebuild
