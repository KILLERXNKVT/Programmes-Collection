# 6. To reverse the contents of a file 
# Execute as "bash Reverse.sh filename.extension"

if [ $# -eq 1 ]
then
    if [ -f $file ]
    then
    a=`rev $1`
    echo "Actual Content of $1"
    cat $1
    echo
    echo
    echo "Reverse of $1 is->"
    echo "$a"
    else
    echo "File does not exist "
    fi 
else
echo "Please enter file name or path"
fi