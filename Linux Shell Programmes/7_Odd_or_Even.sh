# 7. Program to check whether the given number is even or odd

echo "Enter a number to check odd or even: "
read number

result=$(( $number % 2 ))
if (( $result != 0 ))
then
   echo "$number is an Odd number"
else
   echo "$number is an Even number"
fi