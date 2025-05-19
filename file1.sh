#!/bin/bash

# Age comparison script
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

# List files function
list_files() {
    for i in $(ls); do
        echo "This is the file name $i"
    done
}

# While loop counter
count_with_while() {
    i=0
    while [ $i -lt 15 ]; do
        echo "This is the number $i"
        i=$((i+1))
    done
}

# Until loop counter
count_with_until() {
    i=0
    until [ $i -gt 15 ]; do
        echo "This is the number $i"
        i=$((i+1))
    done
}

# Sum function
sum_function() {
    local num1=$1
    local num2=$2
    sum=$((num1 + num2))
    echo "The sum of $num1 and $num2 is: $sum"
}

# Sum calculator
calculate_sum() {
    echo "Enter first number:"
    read num1
    echo "Enter second number:"
    read num2
    sum_function $num1 $num2
}

# Sum arguments
sum_arguments() {
    echo $(($1 + $2))
}

# Demonstrate argument handling
show_arguments() {
    echo "Using \$*:"
#!/bin/bash

# # Age comparison script
# compare_ages() {
#     echo "This is a bash script file to check the age of you and your friend"
#     echo "Please enter your age:"
#     read your_age
#     echo "Please enter your friend's age:"
#     read friend_age
#     echo "Enter Your Gender (M/F)"
#     read gender

#     if [ "$gender" == "M" ]; then
#         if [ $your_age -gt $friend_age ]; then
#             echo "You both are men and you are older than your friend"
#         elif [ $your_age -lt $friend_age ]; then
#             echo "You both are men and your friend is older than you"
#         else
#             echo "You both are men and the same age"
#         fi
#     elif [ "$gender" == "F" ]; then
#         if [ $your_age -gt $friend_age ]; then
#             echo "You both are women and you are older than your friend"
#         elif [ $your_age -lt $friend_age ]; then
#             echo "You both are women and your friend is older than you"
#         else
#             echo "You both are women and the same age"
#         fi
#     else
#         echo "Error: Invalid gender input"
#     fi
# }

# # List files function
# list_files() {
#     for i in $(ls); do
#         echo "This is the file name $i"
#     done
# }

# # While loop counter
# count_with_while() {
#     i=0
#     while [ $i -lt 15 ]; do
#         echo "This is the number $i"
#         i=$((i+1))
#     done
# }

# # Until loop counter
# count_with_until() {
#     i=0
#     until [ $i -gt 15 ]; do
#         echo "This is the number $i"
#         i=$((i+1))
#     done
# }

# # Sum function
# sum_function() {
#     local num1=$1
#     local num2=$2
#     sum=$((num1 + num2))
#     echo "The sum of $num1 and $num2 is: $sum"
# }

# # Sum calculator
# calculate_sum() {
#     echo "Enter first number:"
#     read num1
#     echo "Enter second number:"
#     read num2
#     sum_function $num1 $num2
# }

# # Sum arguments
# sum_arguments() {
#     echo $(($1 + $2))
# }

# # Demonstrate argument handling
# show_arguments() {
#     echo "Using \$*:"
#     for i in $*; do
#         echo " arguments are $i"
#     done

#     echo "Using \$@:"
#     for i in $@; do
#         echo " arguments are $i"
#     done

#     echo "Number of arguments: $#"
# }

# # Examples - preserved as requested
# echo $(date)      # هيطبع التاريخ والوقت الحالي
# echo `date`       # هيطبع نفس نتيجة السطر فوق (تنفيذ الأمر)
# echo 'date'       # هيطبع الكلمة "date" حرفيًا

# # Improved file check function
# test_function() {
#     local name=$1
#     local found=0

#     for i in $(ls); do
#         if [ "$name" == "$i" ]; then
#             echo "File exists"
#             found=1
#             break
#         fi
#     done

#     if [ $found -eq 0 ]; then
#         echo "File does not exist"
#     fi
# }





# Improved file check function
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




