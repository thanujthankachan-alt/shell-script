#!/bin/bash

echo -n "Enter a number: "
read number

sum=0
# Use a temporary variable if you want to keep the original number for the output
original=$number

while [ $number -gt 0 ]
do
    digit=$((number % 10))
    sum=$((sum + digit * digit))
    number=$((number / 10))
done

echo "The sum of the squares of the digits in $original is $sum."
