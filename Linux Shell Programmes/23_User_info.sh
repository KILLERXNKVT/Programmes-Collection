# 23. User info

echo -n "Logged in users: " 
who
echo 

echo -n "Loggin Names: " 
users
echo

echo -n "Current Shell: "
echo $SHELL
echo

echo -n "Home Directory: "
echo $HOME
echo

echo-n "Operating System type: "
uname -o
echo $OSTYPE
echo

echo "Path Settings: "
echo $PATH
echo

echo -n "Current working directory: "
pwd
echo

echo -n "No.of logged in users: "
users|wc -w
