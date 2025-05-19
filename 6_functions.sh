#!/bin/bash
# This script demonstrates various ways to work with functions in bash scripting

#=====================================#

# Author: [Ammar Torky]
# Date: 2025-05-19

#=====================================#

# =====================================#
# Basic Function Examples
# =====================================#

# Simple function with no parameters
echo -e "\n=== Basic Function Examples ==="

echo -e "\n1. Simple function with no parameters:"
simple_function() {
    echo "This is a simple function"
    echo "It doesn't take any parameters"
}

# Call the function
simple_function

# Function with parameters
echo -e "\n2. Function with parameters:"
greet() {
    echo "Hello, $1! How are you today?"
}

# Call the function with a parameter
greet "Ammar"
greet "World"

# Function with multiple parameters
echo -e "\n3. Function with multiple parameters:"
introduce() {
    echo "Let me introduce $1, who is $2 years old and works as a $3"
}

# Call the function with multiple parameters
introduce "Ammar" "30" "Developer"

# =====================================#
# Functions with Return Values
# =====================================#

echo -e "\n=== Functions with Return Values ==="

# Function using 'return' (can only return numeric exit status 0-255)
echo -e "\n1. Function using 'return' statement:"
check_number() {
    if [ $1 -gt 10 ]; then
        return 0  # Success (true in bash)
    else
        return 1  # Failure (false in bash)
    fi
}

# Call the function and check its return value
check_number 15
if [ $? -eq 0 ]; then
    echo "The number is greater than 10"
else
    echo "The number is not greater than 10"
fi

check_number 5

# $? is refer to the return value of the last command if it zero so the commad excuted successfully and anything else means it failed
if [ $? -eq 0 ]
then 
    echo "The number is really  greater than 10"
else 
    echo "The number is not greater than 10"
fi  


# Function using echo to return a value
echo -e "\n2. Function using echo to return a value:"
get_sum() {
    local result=$(( $1 + $2 ))
    echo $result
}

# Capture the output of the function
sum=$(get_sum 10 20)
echo "The sum is: $sum"

# Function using a global variable to return a value
echo -e "\n3. Function using a global variable:"
calculate_product() {
    PRODUCT=$(( $1 * $2 ))
}

# Call the function and use the global variable
calculate_product 5 7
echo "The product is: $PRODUCT"

# =====================================#
# Local Variables in Functions
# =====================================#

echo -e "\n=== Local Variables in Functions ==="

# Function with local variables
echo -e "\n1. Function with local variables:"
demonstrate_local() {
    local local_var="I am local"
    global_var="I am global"
    echo "Inside function: local_var = $local_var"
    echo "Inside function: global_var = $global_var"
}

# Call the function and check variables
demonstrate_local
echo "Outside function: global_var = $global_var"
echo "Outside function: local_var = $local_var"  # This will be empty

# =====================================#
# Function Overriding
# =====================================#

echo -e "\n=== Function Overriding ==="

# Define a function
echo -e "\n1. Function overriding example:"
my_function() {
    echo "This is the original function"
}

# Call the original function
my_function

# Override the function
my_function() {
    echo "This is the overridden function"
}

# Call the overridden function
my_function

# =====================================#
# Practical Examples
# =====================================#

echo -e "\n=== Practical Function Examples ==="

# Function to check if a file exists
echo -e "\n1. Function to check if a file exists:"
check_file() {
    if [ -f "$1" ]; then
        echo "File $1 exists"
        return 0
    else
        echo "File $1 does not exist"
        return 1
    fi
}

# Test the function
check_file "/etc/passwd"

# Function to display system information
echo -e "\n3. Function to display system information:"
system_info() {
    echo "System Information:"
    echo "-------------------"
    echo "Hostname: $(hostname)"
    echo "Kernel: $(uname -r)"
    echo "Uptime: $(uptime -p)"
    echo "CPU: $(grep 'model name' /proc/cpuinfo | head -1 | cut -d ':' -f 2 | sed 's/^[ \t]*//')"
    echo "Memory: $(free -h | grep Mem | awk '{print $2}')"
    echo "Disk Usage: $(df -h / | tail -1 | awk '{print $5}')"
}

# Display system information
system_info

# Clean up temporary files
rm -f /tmp/test_file.txt /tmp/test_file.txt.bak /tmp/my_functions.sh
