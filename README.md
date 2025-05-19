# 🐧 Bash Scripting Notes

<div align="center">
  <img src="https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Bash"/>
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux"/>
  <img src="https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Shell Script"/>
</div>

<br>

> A comprehensive guide to Bash scripting with practical examples for beginners and intermediate users.

## 📋 Table of Contents
- [🐧 Bash Scripting Notes](#-bash-scripting-notes)
  - [📋 Table of Contents](#-table-of-contents)
  - [🖨️ Echo and Variables Basics](#️-echo-and-variables-basics)
    - [Echo Command](#echo-command)
    - [Variables in Bash](#variables-in-bash)
    - [Command Execution Examples](#command-execution-examples)
  - [🔢 Arithmetic Calculations](#-arithmetic-calculations)
    - [Using let Command](#using-let-command)
    - [Using Double Parentheses](#using-double-parentheses)
    - [Using Square Brackets](#using-square-brackets)
    - [Using expr Command](#using-expr-command)
    - [Using bc Command](#using-bc-command)
    - [Simple Calculator Example](#simple-calculator-example)
  - [📝 String Manipulation](#-string-manipulation)
    - [String Replacement](#string-replacement)
    - [String Slicing](#string-slicing)
    - [Additional String Operations](#additional-string-operations)
  - [🔄 Control Structures](#-control-structures)
    - [Conditional Statements (if)](#conditional-statements-if)
    - [Loops (for)](#loops-for)
    - [Loops (while)](#loops-while)
    - [Loops (until)](#loops-until)
    - [Loop Control: break and continue](#loop-control-break-and-continue)
  - [🔧 Functions](#-functions)
  - [📥 Argument Handling](#-argument-handling)
  - [📂 File Operations](#-file-operations)
  - [🚀 Practical Examples](#-practical-examples)

## 🖨️ Echo and Variables Basics

### Echo Command

The `echo` command is one of the basic commands in bash for printing to the screen:

```bash
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
```

### Variables in Bash

In bash, system variables are typically uppercase, while user-defined variables are lowercase:

```bash
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
```

### Command Execution Examples

Different ways to execute or display commands:

```bash
# Print current date and time
echo $(date)      # هيطبع التاريخ والوقت الحالي

# Same result as above (command execution)
echo `date`       # هيطبع نفس نتيجة السطر فوق (تنفيذ الأمر)

# Print the literal string 'date'
echo 'date'       # هيطبع الكلمة "date" حرفيًا
```

## 🔢 Arithmetic Calculations

Bash provides several ways to perform arithmetic calculations.

### Using let Command

The `let` command performs arithmetic operations and assigns the result to a variable:

```bash
# Basic addition using let
let RESULT=5+3
echo "The result is $RESULT"  # Output: The result is 8

# Using variables with let
x=10
y=5
let RESULT=x+y
echo "The result is $RESULT"  # Output: The result is 15

# Other operations
let "x += 1"   # Increment x by 1
let "y -= 2"   # Decrement y by 2
let "z = x * y"  # Multiplication
```

### Using Double Parentheses

This is the preferred method for arithmetic operations in modern bash using the `$(( ))` syntax:

```bash
# Basic arithmetic
result=$(( 5 + 3 ))
echo "The result is $result"  # Output: The result is 8

# Using variables
x=10
y=5
result=$(( x + y ))
echo "The result is $result"  # Output: The result is 15

# Other operations
$(( x += 1 ))   # Increment x by 1
$(( y -= 2 ))   # Decrement y by 2
z=$(( x * y ))  # Multiplication
```

### Using Square Brackets

This is an older syntax using `$[ ]`, but still works:

```bash
# Basic arithmetic
result=$[ 5 + 3 ]
echo "The result is $result"  # Output: The result is 8

# Using variables
x=10
y=5
result=$[ x + y ]
echo "The result is $result"  # Output: The result is 15
```

### Using expr Command

The `expr` command evaluates expressions and outputs the result:

```bash
# Note: expr requires spaces between operands and operators
result=$(expr 5 + 3)
echo "The result is $result"  # Output: The result is 8

# Using variables
x=10
y=5
result=$(expr $x + $y)
echo "The result is $result"  # Output: The result is 15

# في مسافات بين المتغير الاول والعملية الحسابية والمتغير التاني
```

### Using bc Command

The `bc` command is useful for more complex calculations, especially with floating point numbers:

```bash
# Basic arithmetic
result=$(echo "5 + 3" | bc)
echo "The result is $result"  # Output: The result is 8

# Floating point arithmetic
result=$(echo "5.5 + 3.2" | bc)
echo "The result is $result"  # Output: The result is 8.7

# Setting scale for decimal precision
result=$(echo "scale=2; 10 / 3" | bc)
echo "The result is $result"  # Output: The result is 3.33
```

### Simple Calculator Example

A simple calculator that can perform basic operations:

```bash
echo "Welcome to our simple calculator"
echo -n "Enter the first number: "
read num1
echo -n "Enter the second number: "
read num2
echo -n "Enter the operator (+, -, *, /): "
read operator

# Using let command with the operator
let result=$num1$operator$num2
echo "Calculator result: $result"

# Alternative using $(( )) syntax
result2=$(($num1$operator$num2))
echo "Calculator result: $result2"
```

## 📝 String Manipulation

Bash provides several ways to manipulate strings.

### String Replacement

You can replace parts of a string using pattern substitution:

```bash
# Sample string to work with
str1="i love linux than windows , linux more better"
echo "Original string: $str1"

# Replace the first occurrence of 'linux' with 'mac'
echo ${str1/linux/mac} # i love mac than windows , linux more better

# Replace all occurrences of 'linux' with 'mac'
echo ${str1//linux/mac} # i love mac than windows , mac more better
```

### String Slicing

You can extract parts of a string using slicing:

```bash
# Syntax: ${variable:offset:length}
# Bash slicing is zero-indexed just like Python.
# offset - الموضع اللي هتبدأ منه (من 0)
# length - عدد الأحرف اللي هتاخدهم

str1="i love linux than windows , linux more better"

# First 10 characters
echo ${str1:0:10} # i love lin

# Characters 10-14
echo ${str1:10:5} # ux th

# Last 7 characters
echo ${str1: -7} # better

# 4 characters starting from 7th from the end
echo ${str1: -7:4} # bett
```

### Additional String Operations

Bash provides other useful string operations:

```bash
str1="i love linux than windows , linux more better"

# String length
echo "Length of string: ${#str1}"

# Convert to uppercase
echo ${str1^^}

# Convert to lowercase
echo ${str1,,}

# Convert first character to uppercase
echo ${str1^}
```

## 🔄 Control Structures

### Conditional Statements (if)

Example of using nested conditional statements:

```bash
# Simple if statement example
if [ "$gender" == "M" ]; then
    echo "You are a man"
else
    echo "You are a woman"
fi

# Example of nested if statements
if [ "$gender" == "M" ]; then
    if [ $your_age -gt $friend_age ]; then
        echo "You both are men and you are older than your friend"
    elif [ $your_age -lt $friend_age ]; then
        echo "You both are men and your friend is older than you"
    else
        echo "You both are men and the same age"
    fi
elif [ "$gender" == "F" ]; then
    if [ $your_age -gt $friend_age ]; then
        echo "You both are women and you are older than your friend"
    elif [ $your_age -lt $friend_age ]; then
        echo "You both are women and your friend is older than you"
    else
        echo "You both are women and the same age"
    fi
else
    echo "Error: Invalid gender input"
fi
```

### Loops (for)

Using for loops to iterate over a list of items:

```bash
# Iterate over a list of files
for i in $(ls); do
    echo "This is the file name $i"
done

# Iterate over a list of numbers
for i in 1 2 3 4 5; do
    echo "Number: $i"
done
```

### Loops (while)

Using while loops to iterate until a condition is met:

```bash
# Count from 0 to 14 using a while loop
count_with_while() {
    i=0
    while [ $i -lt 15 ]; do
        echo "This is the number $i"
        i=$((i+1))
    done
}
```

### Loops (until)

Using until loops to iterate until a condition is met (opposite of while):

```bash
# Count from 0 to 15 using an until loop
count_with_until() {
    i=0
    until [ $i -gt 15 ]; do
        echo "This is the number $i"
        i=$((i+1))
    done
}
```

### Loop Control: break and continue

Bash provides `break` and `continue` statements to control loop execution:

```bash
# Break example - exits the loop when i equals 5
for i in {1..10}
do
    if [ $i -eq 5 ]; then
        echo "Breaking at $i"
        break
    fi
    echo "Number: $i"
done

# Continue example - skips the current iteration when i is even
for i in {1..10}
do
    if [ $((i % 2)) -eq 0 ]; then
        continue
    fi
    echo "Odd number: $i"
done
```

## 🔧 Functions

Defining and calling functions in bash:

```bash
# Simple function to add two numbers
sum_function() {
    local num1=$1
    local num2=$2
    sum=$((num1 + num2))
    echo "The sum of $num1 and $num2 is: $sum"
}

# Interactive function to calculate sum
calculate_sum() {
    echo "Enter first number:"
    read num1
    echo "Enter second number:"
    read num2
    sum_function $num1 $num2
}

# Function to sum command line arguments
sum_arguments() {
    echo $(($1 + $2))
}
```

## 📥 Argument Handling

Different ways to handle command line arguments:

```bash
show_arguments() {
    echo "Using \$*:"
    for i in $*; do
        echo " arguments are $i"
    done

    echo "Using \$@:"
    for i in $@; do
        echo " arguments are $i"
    done

    echo "Number of arguments: $#"
}
```

## 📂 File Operations

List all files in the current directory:

```bash
list_files() {
    for i in $(ls); do
        echo "This is the file name $i"
    done
}
```

Check if a specific file exists:

```bash
test_function() {
    local name=$1
    local found=0

    for i in $(ls); do
        if [ "$name" == "$i" ]; then
            echo "File exists"
            found=1
            break
        fi
    done

    if [ $found -eq 0 ]; then
        echo "File does not exist"
    fi
}
```

## 🚀 Practical Examples

Script to compare ages between two people based on gender:

```bash
compare_ages() {
    echo "This is a bash script file to check the age of you and your friend"
    echo "Please enter your age:"
    read your_age
    echo "Please enter your friend's age:"
    read friend_age
    echo "Enter Your Gender (M/F)"
    read gender

    if [ "$gender" == "M" ]; then
        if [ $your_age -gt $friend_age ]; then
            echo "You both are men and you are older than your friend"
        elif [ $your_age -lt $friend_age ]; then
            echo "You both are men and your friend is older than you"
        else
            echo "You both are men and the same age"
        fi
    elif [ "$gender" == "F" ]; then
        if [ $your_age -gt $friend_age ]; then
            echo "You both are women and you are older than your friend"
        elif [ $your_age -lt $friend_age ]; then
            echo "You both are women and your friend is older than you"
        else
            echo "You both are women and the same age"
        fi
    else
        echo "Error: Invalid gender input"
    fi
}
```

---

<div align="center">
  <p>Created with ❤️ by Ammar Torky</p>
  <p>© 2025 All Rights Reserved</p>
</div>
