
set -euo pipefail

touch me.txt
var=me.txt

echo "asdfasdf 
$1
 asdfasdf  
something something 
 gfdgs" > $var

echo "The secret is in the second line of $var"


