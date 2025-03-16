# 16. Read a file

file='For_reverse.txt'
while read line;
do
echo $line
done < $file