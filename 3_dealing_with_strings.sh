#!/bin/bash
# This script demonstrates various ways to deal with strings

#=====================================#

# Author: [Ammar Torky]
# Date: 2025-05-19

#=====================================#

# =====================================#
# String Manipulation in Bash
# =====================================#

# Sample string to work with
str1="i love linux than windows , linux more better"
echo "Original string: $str1"

# =====================================#
# String Replacement
# =====================================#

# Replace the first occurrence of 'linux' with 'mac'
echo -e "\n# Replace first occurrence only:"
echo ${str1/linux/mac} # i love mac than windows , linux more better

# Replace all occurrences of 'linux' with 'mac'
echo -e "\n# Replace all occurrences:"
echo ${str1//linux/mac} # i love mac than windows , mac more better

# =====================================#
# String Slicing
# =====================================#
# Syntax: ${variable:offset:length}
# Bash slicing is zero-indexed just like Python.
# offset	الموضع اللي هتبدأ منه (من 0)
# length	عدد الأحرف اللي هتاخدهم

echo -e "\n# String slicing examples:"
echo "First 10 characters: ${str1:0:10}" # i love lin
echo "Characters 10-14: ${str1:10:5}" # ux th
echo "Last 7 characters: ${str1: -7}" # better
echo "4 characters starting from 7th from the end: ${str1: -7:4}" # bett

# =====================================#
# Additional String Operations
# =====================================#

# String length
echo -e "\n# String length:"
echo "Length of string: ${#str1}"

# Convert to uppercase
echo -e "\n# Convert to uppercase:"
echo ${str1^^}

# Convert to lowercase
echo -e "\n# Convert to lowercase:"
echo ${str1,,}

# Convert first character to uppercase
echo -e "\n# Capitalize first character:"
echo ${str1^}