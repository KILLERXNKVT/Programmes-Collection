echo "Enter the file name with extension: "
read file

echo "Enter old string to be replaced: "
read oldtxt
echo "Enter new string: "
read newtxt
echo "File before replace"
cat $file
sed -i "s/$oldtxt/$newtxt/" $file
echo "File after replace"
cat $file

echo "Before coversion of second line into upper case: "
cat $file
res=`awk 'NR==2 {print toupper($0);exit}' $file`
res1=`awk 'NR==2' $file`
sed -i "s/$res1/$res/"  $file
echo "After coversion of second line into upper case: "
cat $file
