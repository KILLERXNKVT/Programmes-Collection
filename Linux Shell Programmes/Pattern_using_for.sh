echo -n "Enter The Pattern Length: "
read rows
number=1

for((i=1; i<=rows; i++))
do
  for((j=1; j<=rows - i; j++))
  do
    echo -n "  "
  done
  number=$i
  for((j=1; j<=2*i - 1; j++))
  do
    #echo -n "* "
    echo -n "$number "
    number=$((number + 1))
  done
  echo
done