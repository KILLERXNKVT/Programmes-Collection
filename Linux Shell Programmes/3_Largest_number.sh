# 3. To find the largest among the 3 given numbers

echo "Enter 3 Numbers with Space in between: "
read num1 num2 num3

largest=$num1
if [ $num2 -gt $largest ]
then
    largest=$num2
fi

if [ $num3 -gt $largest ]
then
    largest=$num3
fi

echo "Largest of $num1, $num2, $num3 is $largest"