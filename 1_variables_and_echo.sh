#!/bin/bash

#!/bin/bash
# Variables and Echo Command Examples
# This script demonstrates various uses of echo command and variable handling in bash

#=====================================#

# Author: [Ammar Torky]
# Date: 2025-05-19

#=====================================#


# ===== Echo Command Examples =====

# Basic echo command - will print a new line by default
echo "please enter your name: "

# Echo without newline - will not print a new line
echo -n "please enter your name: "

# Echo with escape sequences - using the escape option to print a new line "\n"
echo -e "please enter your name: \n"

# Print a range of numbers or letters
echo {1..10}      # {start..end}
echo {1..10..2}   # {start..end..step}
echo {a..z}       # Print lowercase alphabet
echo {A..Z}       # Print uppercase alphabet

# Redirecting output to a file
echo "Test me bro" >> file.txt  # >> used for append
echo "Test me bro" > file.txt   # > used for overwrite content of file

# Using tr command with echo
# Convert to uppercase using tr command
echo -e "hello, this is a test sentence written in lowercase and we gonna convert it to uppercase \n" | tr 'a-z' 'A-Z'

# Remove all digits from the sentence
echo -e "hello, this is a test sentence 1234566 642445 \n" | tr -d [:digit:]


# ===== Variables in Bash =====
# Linux system variables are typically UPPERCASE, while user-defined variables are lowercase
# المتعارف عليه ان متغيرات اللينكس بتبقي capital ومتغيرات اليوزر اللي يعرفها تبقي small

# Method 1: Explicit assignment
myname=Ammar
echo "welcome, $myname"

# Method 2: Reading from user input
echo -n "please enter your first name: "
read f_name
echo -n "please enter your last name: "
read l_name

# Method 3: Assigning command output to a variable
# Using $() syntax (preferred method)
day=$(date)
# Or using backticks (older method)
day=`date`

# Displaying variable values
echo "welcome, $f_name $l_name"
echo "today is $day"
