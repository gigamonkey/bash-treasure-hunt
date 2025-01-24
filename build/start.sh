#!/usr/bin/env bash

#
# Generate the starting file. Doesn't need to emit a clue because it's the
# first.
#

set -euo pipefail

cat <<EOF > README
This is your first clue. Every secret you find will be of the form:

  <id>: <clue>

The <id> is just some gibberish that we use to verify that you've found the
right secret. Note, however, that the secret may be arbitrarily hidden from you
so extracting it may require you to decoded it in some way that will be
described in the clue.

For each clue you should write a bash script in the solutions/ directory named
clue-XXX.sh where XXX is the number of the clue starting from clue-000.sh which
should exract the secret from this file.

Each script should just output the secret. But don't find the script by hand and
write a script that echos it: you're not a monkey banging rocks together! Write
a script that automates extracting the secret so if you were given a new
scavenger hunt with the same clues but different ids you code would solve it.

You can use the command 'make check' to check that you've collected the right
secrets. It will run your scripts and verify that you found the right thing.

The <clue> part of the secret will be some human readable text that decribes how
to find the next secret. It should always be possible to extract the secret and
clue using command line tools. Here's your first secret:

  $1

EOF
