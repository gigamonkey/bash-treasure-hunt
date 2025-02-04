
set -euo pipefail

touch me.txt
var=me.txt
echo "$1" > $var
echo "asdfasdf /n $1 /n asdfasdf /m something something /n penis" >> $var

echo The secret is in the second line of $var


