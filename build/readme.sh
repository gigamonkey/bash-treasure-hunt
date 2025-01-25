#!/usr/bin/env bash

#
# Generate the starting file. Doesn't need to emit a clue because it's the
# first.
#

set -euo pipefail

echo "$1" > FIRST_SECRET

cat <<EOF > README

The goal of this treasure hunt is to find secrets hidden in the puzzle
directory. Each secret will be of the form:

  <id>: <clue>

where <id> is an eight-digit hex number that we use to verify that you've found
the right secret and the <clue> is a human readable description of how to find
the next secret.

Once you've found all the secrets you will unlock your trophy.

Note, however, that the secret may be hidden in some arbitrary way; extracting
it may require you to locate and then decode it in some way. But the clue should
descibe what you need to do.

For each clue you should write a bash script in this directory named clue-XXX.sh
where XXX is the number of the clue starting with clue-000.sh. These scripts
just need to extract the secret based on the clue and print it to their standard
output.

N.B. do not find the secret by hand and then write a script that echos it!
You're not a monkey banging rocks together. Write a script that automates
extracting the secret so if you were given a new treasure hunt with the same
clues but different ids your code would solve it.

Use the progress script in this directory to run your scripts and check that
you've collected the right secrets. It will run your scripts and verify that you
found the right thing and then will show you the clue part of the most recently
found secret.

To extract you first secret add code to clue-000.sh to print out the contents of
the file $PUZZLE/FIRST_SECRET.

Note that all the data your scripts need to operate on will live in the puzzle
directory.

EOF

echo "Don't need a clue here"
