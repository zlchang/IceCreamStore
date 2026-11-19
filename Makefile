CXX      := g++
CXXFLAGS := -std=c++20 -Wall -Wextra -g
#BUILD_DIR := build
TARGET   := app

# Automatically find all .cpp files in the current directory
SRCS     := $(wildcard *.cc)
#OBJS     := $(patsubst %.cc, S(BUILD_DIR)/%.o, $(SRCS))
OBJS     := $(SRCS:.cc=.o)

# Default target (runs when you just type `make`)
all: $(TARGET)

# Link object files into the final executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Compile each .cpp file into a .o object file
%.o: %.cc
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Remove generated build files
clean:
	rm -f $(OBJS) $(TARGET)

# Declare targets that do not represent actual files
.PHONY: all clean

