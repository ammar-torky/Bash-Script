#!/bin/bash
# Conditional Statements in bash scripting

#=====================================#

# Author: [Ammar Torky]
# Date: 2025-05-19

#=====================================#

# =====================================#
# Basic Syntax of if-elif-else
# =====================================#

# if [ condition ]
# then
#   command1
#   command2
#   ...
# elif [ condition ]
# then
#   command3
#   command4
#   ...
# else
#   command5
# fi

# =====================================#
# Example 1: Check User ID
# =====================================#

echo "Checking user ID..."
if [ $UID -eq 0 ]
then
    echo "Welcome $LOGNAME, You are root"
elif [ $UID == 1000 ]
then
    echo "Welcome $LOGNAME, You are real ammar not fake one"
else
    echo "who are you MF?"
fi

# =====================================#
# Example 2: File Existence Check
# =====================================#

echo -e "\nChecking if file exists..."
FILE="/etc/passwd"
if [ -f "$FILE" ]
then
    echo "File $FILE exists"
    echo "First 3 lines of $FILE:"
    head -n 3 "$FILE"
else
    echo "File $FILE does not exist"
fi

# =====================================#
# Example 3: String Comparison
# =====================================#

echo -e "\nComparing strings..."
STR1="Linux"
STR2="linux"

if [ "$STR1" = "$STR2" ]
then
    echo "Strings are equal (case sensitive)"
elif [ "${STR1,,}" = "${STR2,,}" ]
then
    echo "Strings are equal (case insensitive)"
else
    echo "Strings are different"
fi

# =====================================#
# Example 4: Numeric Comparison
# =====================================#

echo -e "\nComparing numbers..."
NUM1=10
NUM2=20

if [ $NUM1 -eq $NUM2 ]
then
    echo "$NUM1 equals $NUM2"
elif [ $NUM1 -lt $NUM2 ]
then
    echo "$NUM1 is less than $NUM2"
else
    echo "$NUM1 is greater than $NUM2"
fi