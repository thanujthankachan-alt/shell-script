#!/bin/bash

echo "Enter a set of numbers separated by spaces:"
read -a numbers

sum_even=0
sum_odd=0

for num in "${numbers[@]}"
do
    if (( num % 2 == 0 ))
    then
        (( sum_even += num ))
    else
        (( sum_odd += num ))
    fi
done

echo "Sum of the even numbers is: $sum_even"
echo "Sum of the odd numbers is: $sum_odd"
