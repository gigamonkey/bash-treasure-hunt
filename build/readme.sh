#!/usr/bin/env bash

set -euo pipefail

echo "$1" > FIRST_SECRET

cat <<EOF > README

The goal of this treasure hunt is to find secrets hidden in the $PUZZLE
directory. Each secret will be of the form:

  <id>: <clue>

where <id> is an eight-digit hex number that we use to verify that you've found
the right secret and the <clue> is a human readable description of how to find
the next secret.

Once you've found all the secrets you will unlock your treasure chest.

Note, however, while some of the secrets are in plain text somewhere under the
$PUZZLE directory, others are hidden in some arbitrary way. To extract them you
will have to write code to both locate and then decode them. The clues will
descibe what you need to do.

For each clue you should write a bash script in this directory named clue-XXX.sh
where XXX is the number of the clue starting with clue-000.sh. The progress
script will create those scripts for you.

Each one of those scripts just needs to extract the secret for that step based
on the clue and print it to their standard output.

N.B. do not find the secret by hand and then write a script that echos it!
You're not a monkey banging rocks together. Write a script that automates
extracting the secret so if you were given a new treasure hunt with the same
clues but different IDs your code would solve it.

Use the progress script in this directory to run your scripts and check that
you've collected the right secrets. It will run your scripts and verify that you
found the right thing and then will show you the clue part of the most recently
found secret. If you're stuck you can run ./progress --hint to get an extra
hint for the current step.

To extract you first secret add code to clue-000.sh to print out the contents of
the file $PUZZLE/FIRST_SECRET.

Note that all the data your scripts need to operate on will live in the $PUZZLE
directory.

EOF

echo "Secret is in $PUZZLE/FIRST_SECRET"
