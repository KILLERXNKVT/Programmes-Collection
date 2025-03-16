# 8. To check whether given file is a directory or not.

echo -n "Please enter the directory or file name you wish to search: "
read d_or_f
for filename in "/home/richuantony38/Network_lab/$d_or_f"
do
  if [ -f "$filename" ]
  then
    echo "In this path: $filename The File or Directory name $d_or_f Exists"
  else
    echo "Niether or nor the file or directory doesn't exist"
  fi
done