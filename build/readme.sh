#!/usr/bin/env bash

#
# Generate the starting file. Doesn't need to emit a clue because it's the
# first.
#

set -euo pipefail

echo "$1" > FIRST_SECRET

cat <<EOF > README
This is your first clue. Every secret you find will be of the form:

  <id>: <clue>

The <id> is just some gibberish that we use to verify that you've found the
right secret. Once you've found all the secrets you will unlock your trophy.

Note, however, that the secret may be arbitrarily hidden from you so extracting
it may require you to decode it in some way that will be described in the clue.

For each clue you should write a bash script in this directory named clue-XXX.sh
where XXX is the number of the clue starting with clue-000.sh. These scripts
just need to extract the secret based on the clue and print it to their standard
output.

Don't find the secret by hand and then write a script that echos it: you're not
a monkey banging rocks together! Write a script that automates extracting the
secret so if you were given a new treasure hunt with the same clues but
different ids your code would solve it.

Use the progress script in the main to run your scripts ad check that you've
collected the right secrets. It will run your scripts and verify that you found
the right thing and then show you the clue part of the most recently found
secret which will be some human readable text that decribes how to find the next
secret.

It should always be possible to extract the secret using command line tools.
Your first secret is in the file puzzle/FIRST_SECRET.

Note that all the data your scripts need to operate on will live in the puzzle
directory.

EOF
