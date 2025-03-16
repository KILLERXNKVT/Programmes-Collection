# 5. To find how many terminals has this user logged in

echo "Enter LOGNAME OR UID"
read input

# checking if input is a UID or LOGNAME
if [[ $input ]] && [ $input -eq $input 2>/dev/null ]
  # If input is UID
  then
    echo "Number of terminals are "
    cat /etc/passwd | grep $input -c 

  # If input is LOGNAME
  else
        cat /etc/passwd>userlist
        echo "Number of terminals are "
        grep -c $input userlist
fi