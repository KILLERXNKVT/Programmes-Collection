LIST="some string with a substring you want to match"
SOURCE="substring"
if echo "$LIST" | grep -q "$SOURCE"; then
  echo "matched";
else
  echo "no match";
fi
