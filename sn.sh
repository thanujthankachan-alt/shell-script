echo "Enter a number:"
read number
smallest=${number:0:1}
for (( i=1; i<${#number}; i++ )); do
digit=${number:i:1}
if (( digit < smallest )); then
MLMCE, ETTUMANUR
3920MCA136 NETWORKING & SYSTEM ADMINISTRATION LAB
DEPT. OF COMPUTER APPLICATIONS
smallest=$digit
fi
done
echo "Smallest digit: $smallest"
