#!/bin/bash
# This script demonstrates various forms of LOOPS in bash scripting

#=====================================#

# Author: [Ammar Torky]
# Date: 2025-05-19

#=====================================#

# =====================================#
# For Loop Examples
# =====================================#

echo "=== For Loop Examples ==="

# Basic for loop with a list
echo -e "\n1. Basic for loop with a list:"
for fruit in apple banana orange grape
do
    echo "Current fruit: $fruit"
done

# For loop with a range
echo -e "\n2. For loop with a range:"
for i in {1..5}
do
    echo "Number: $i"
done

# For loop with a range and step
echo -e "\n3. For loop with a range and step:"
for i in {0..10..2}
do
    echo "Even number: $i"
done

# C-style for loop
echo -e "\n4. C-style for loop:"
for ((i=0; i<5; i++))
do
    echo "Counter: $i"
done

# For loop to iterate through files
echo -e "\n5. For loop to iterate through files in /etc (first 3 only):"
count=0
for file in /etc/*
do
    if [ $count -lt 3 ]; then
        echo "File: $file"
        count=$((count+1))
    else
        break
    fi
done

# =====================================#
# While Loop Examples
# =====================================#

echo -e "\n=== While Loop Examples ==="

# Basic while loop
echo -e "\n1. Basic while loop:"
counter=1
while [ $counter -le 5 ]
do
    echo "While loop counter: $counter"
    counter=$((counter+1))
done

# Reading file line by line with while loop
echo -e "\n2. Reading file line by line (first 3 lines of /etc/passwd):"
count=0
while read -r line
do
    if [ $count -lt 3 ]; then
        echo "Line $((count+1)): $line"
        count=$((count+1))
    else
        break
    fi
done < /etc/passwd

# =====================================#
# Until Loop Examples
# =====================================#

echo -e "\n=== Until Loop Examples ==="

# Basic until loop (runs until condition becomes true)
echo -e "\n1. Basic until loop:"
counter=5
until [ $counter -le 0 ]
do
    echo "Until loop counter: $counter"
    counter=$((counter-1))
done

# =====================================#
# Loop Control: break and continue
# =====================================#

echo -e "\n=== Loop Control Examples ==="

# Break example
echo -e "\n1. Break example:"
for i in {1..10}
do
    if [ $i -eq 5 ]; then
        echo "Breaking at $i"
        break
    fi
    echo "Number: $i"
done

# Continue example
echo -e "\n2. Continue example (skip even numbers):"
for i in {1..10}
do
    if [ $((i % 2)) -eq 0 ]; then
        continue
    fi
    echo "Odd number: $i"
done
