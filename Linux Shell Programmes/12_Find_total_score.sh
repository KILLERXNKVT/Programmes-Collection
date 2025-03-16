# 12. Find total score

echo -n "Enter your name: "
read name
echo -n "Enter the score obtained for Maths: "
read score1
echo -n "Enter the score obtained for English: "
read score2
echo -n "Enter the score obtained for Physics: "
read score3

let total=score1+score2+score3
echo "Total Mark Obtained by $name for 3 Subject is: $total"