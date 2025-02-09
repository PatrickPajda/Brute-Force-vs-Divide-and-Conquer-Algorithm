# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall

# Executable names
BRUTEFORCE_EXEC = bruteforce
DIVIDECONQUER_EXEC = divideconquer
CREATE_EXEC = create

# Source files
BRUTEFORCE_SRC = bruteforce.cpp
DIVIDECONQUER_SRC = divideconquer.cpp
CREATE_SRC = create.cpp

# Input files
INPUT_FILES = output100.txt output200.txt output300.txt output400.txt output500.txt output600.txt output700.txt output800.txt output900.txt output1000.txt output1500.txt output2000.txt output2500.txt output3000.txt output4000.txt output5000.txt output6000.txt output7000.txt output8000.txt output9000.txt output100000.txt

# Default target
all: $(CREATE_EXEC) $(BRUTEFORCE_EXEC) $(DIVIDECONQUER_EXEC)

# Compile create.cpp
$(CREATE_EXEC): $(CREATE_SRC)
	$(CXX) $(CXXFLAGS) -o $@ $<

# Compile bruteforce.cpp
$(BRUTEFORCE_EXEC): $(BRUTEFORCE_SRC)
	$(CXX) $(CXXFLAGS) -o $@ $<

# Compile divideconquer.cpp
$(DIVIDECONQUER_EXEC): $(DIVIDECONQUER_SRC)
	$(CXX) $(CXXFLAGS) -o $@ $<

# Generate input files using create.cpp
generate: $(CREATE_EXEC)
	@./$(CREATE_EXEC) 100
	@./$(CREATE_EXEC) 200
	@./$(CREATE_EXEC) 300
	@./$(CREATE_EXEC) 400
	@./$(CREATE_EXEC) 500
	@./$(CREATE_EXEC) 600
	@./$(CREATE_EXEC) 700
	@./$(CREATE_EXEC) 800
	@./$(CREATE_EXEC) 900
	@./$(CREATE_EXEC) 1000
	@./$(CREATE_EXEC) 1500
	@./$(CREATE_EXEC) 2000
	@./$(CREATE_EXEC) 2500
	@./$(CREATE_EXEC) 3000
	@./$(CREATE_EXEC) 3500
	@./$(CREATE_EXEC) 4000
	@./$(CREATE_EXEC) 5000
	@./$(CREATE_EXEC) 6000
	@./$(CREATE_EXEC) 7000
	@./$(CREATE_EXEC) 8000
	@./$(CREATE_EXEC) 9000
	@./$(CREATE_EXEC) 100000

# Run brute force algorithm with input files
run-bruteforce: $(BRUTEFORCE_EXEC)
	@for file in $(INPUT_FILES); do \
		echo "Running $(BRUTEFORCE_EXEC) with $$file"; \
		./$(BRUTEFORCE_EXEC) < $$file; \
	done

# Run divide and conquer algorithm with input files
run-divideconquer: $(DIVIDECONQUER_EXEC)
	@for file in $(INPUT_FILES); do \
		echo "Running $(DIVIDECONQUER_EXEC) with $$file"; \
		./$(DIVIDECONQUER_EXEC) < $$file; \
	done

# Clean up generated files
clean:
	rm -f $(CREATE_EXEC) $(BRUTEFORCE_EXEC) $(DIVIDECONQUER_EXEC) $(INPUT_FILES)

# Phony targets
.PHONY: all generate run-bruteforce run-divideconquer clean
