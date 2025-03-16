# 9. Count number of files in a Directory

if [ -d "$@" ]
then
  echo -n "Number of Files: "
  find "$@" -type f | wc -l
  echo -n "Number of Directories: "
  find "$@" -type d | wc -l
  echo
  echo  -n "No. of Files and Directories in the current path: "
  ls | wc -l
  echo  -n "No. of Files and Directories (+ hidden) in the current path: "
  ls -a | wc -l
fi