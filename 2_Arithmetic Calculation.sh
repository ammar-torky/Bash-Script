#!/bin/bash
# Arithmetic Calculation in bash scripting

#=====================================#

# Author: [Ammar Torky]
# Date: 2025-05-19

#=====================================#

# This script demonstrates different ways to perform arithmetic calculations in Bash

# =====================================#
# Different methods for arithmetic operations
# =====================================#

# Get input from user
echo -n "Enter the first number: "
read f_number
echo -n "Enter the second number: "
read s_number

# Method 1: Using the 'let' command
# The let command performs arithmetic operations and assigns the result to a variable
let RESULT=$f_number+$s_number
echo "Method 1 (let): The result is $RESULT"

# Method 2: Using $(( expression ))
# This is the preferred method for arithmetic operations in modern bash
Result=$(($f_number + $s_number))
echo "Method 2 ($(( ))): The result is $Result"

# Method 3: Using $[ expression ]
# This is an older syntax, but still works
new_result=$[$f_number+$s_number]
echo "Method 3 ($[ ]): The result is $new_result"

# Method 4: Using the 'expr' command
# في مسافات بين المتغير الاول والعملية الحسابية والمتغير التاني
expr_result=$(expr $f_number + $s_number)
echo "Method 4 (expr): The result is $expr_result"

# Method 5: Using 'bc' command for more complex calculations
# bc is useful for floating point arithmetic
bc_result=$(echo "$f_number + $s_number" | bc)
echo "Method 5 (bc): The result is $bc_result"


# =====================================#
# Practical example - Simple Calculator
# =====================================#

echo -e "\nWelcome to our simple calculator"
echo -n "Enter the first number: "
read calc_num1
echo -n "Enter the second number: "
read calc_num2
echo -n "Enter the operator (+, -, *, /): "
read operator

# Using let command with the operator
let calc_result=$calc_num1$operator$calc_num2
echo "Calculator result (let): $calc_result"

# Using $(( )) syntax with the operator
calc_result2=$(($calc_num1$operator$calc_num2))
echo "Calculator result ($(( ))): $calc_result2"

# Using $[ ] syntax with the operator
calc_result3=$[$calc_num1$operator$calc_num2]
echo "Calculator result ($[ ]): $calc_result3"

