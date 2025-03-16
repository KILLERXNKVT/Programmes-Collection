# 17. Remove a file or directory

echo "Enter the filename or directoryname to be removed: "
read remove

if [ -f "$remove" ]; 
then
  echo "File exists"
  rm -i $remove
  echo "Succesfully File deleted"
elif [ -d "$remove" ]; 
then
  echo "Directory exists"
  rmdir $remove
  echo "Successfully Directory deleted"
else
  echo "File or directory does not exits"
fi