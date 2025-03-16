# 11. Add and Substract

echo -n "Enter two values space separated: " 
read a b
#add=$(( $a + $b ))
#sub=$(( $a - $b ))
let add=a+b
let sub=a-b
echo "Addition of $a and $b is $add"
echo "Subtraction of $a and $b is $sub"