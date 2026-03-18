#!/bin/bash

echo "Enter an integer:"
read number

# Check if number is less than 1
if (( number < 1 ))
then
    echo "Please enter a positive integer."
    exit 1
fi

flag=1

for (( i = 2; i * i <= number; i++ ))
do
    if (( number % i == 0 ))
    then
        flag=0
        break
    fi
done

if (( number == 1 ))
then
    echo "1 is neither prime nor composite."
elif (( flag == 1 ))
then
    echo "$number is a prime number."
else
    echo "$number is not a prime number."
fi
