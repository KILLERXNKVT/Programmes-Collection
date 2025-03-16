# 10. Reverse a number

echo "Enter the number to be reversed: "
read num
sd=0
rev=0
while [ $num -gt 0 ]
do
sd=$(( $num % 10))
rev=$(( $rev * 10 + $sd ))
num=$(( $num/10 ))
done
echo "Reverse of Number is $rev"