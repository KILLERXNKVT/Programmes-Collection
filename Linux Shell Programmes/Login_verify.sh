# AND logic program

echo "Enter the username: "
read username
echo "Enter the password: "
read password

if [[($username == "admin" && $password == "secret")]];
then
  echo "Valid User"
else
  echo -e "\n Invalid User"
fi