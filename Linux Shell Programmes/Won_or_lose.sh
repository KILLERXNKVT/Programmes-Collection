# OR logic program

echo "Enter any number: "
read n

if [[($n -eq 15 || $n -eq 45)]]
then
   echo "You Won The Game"
else
   echo "You Lose The Game"
fi