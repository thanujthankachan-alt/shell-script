
echo "Enter the file name: "
read file
# Check if the file exists
if [ ! -f "$file" ]; then
echo "File not found."
exit 1
fi
with spaces
contents=$(tr '[:upper:]' '[:lower:]' < $file | sed 's/[^a-z0-9]/ /g')

words=($contents)

declare -A count
for word in "${words[@]}"; do
if [ -n "$word" ]; then
((count[$word]++))
fi
done
# Print the unique words and their counts
echo "Unique words in $file:"
for word in "${!count[@]}"; do
echo "$word: ${count[$word]}"
done
