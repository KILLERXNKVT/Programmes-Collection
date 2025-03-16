# 4. Program to develop a Calculator

clear
decision="y"

while [ $decision = "y" ] 
do
echo
echo "Enter The First numbers: "
read num1
echo "Enter The Second numbers: "
read num2

echo "What operation would you like to perform:" 
echo "============================"
echo "1. Addition"
echo "2. Subtraction"
echo "3. Multiplication"
echo "4. Division"
echo "============================"
echo "Enter The Choice: "
read choice

case $choice in
  1)result=$((num1 + num2))
    echo "Result: $result" ;;
  2)result=$((num1 - num2))
    echo "Result: $result" ;;
  3)result=$((num1 * num2))
    echo "Result: $result" ;;
  4)result=$((num1 / num2))
    echo "Result: $result" ;;
  *)echo "Invalid choice, Choose 1 to 4 only!!!!" 
    ;;
esac

echo "Do you want to continue? (y/n):"
read decision
decision=${decision,,}
if [ $decision != "y" ]
then 
  echo "Thank you for using the Calculator"
  exit
fi
echo
done