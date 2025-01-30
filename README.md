# Bash treasure hunt

Treasure hunt that requires using bash and other command line tools to find the
series of clues.

Clues are hidden within the file system which is created via a setup script that
will make a bunch of files with secrets hidden in them. We could use just a tar
of the scavenger hunt but we want to uniquify the clues so each person has to
find their own.

## Basic gameplay:

Player starts by running the script `start` which will build the puzzle (with
new random secrets) and give the player initial instructions.

Thereafter teh player uses `progress` to check their progress and get clues.
That script will run their solution scripts for each step, checking that they
found the correct secret.

Secrets contain random numbers generated when the puzzle is set up and are thus
different every time the scavenger hunt is built. We also store the hash of each
secret in order in the `.hashes` file when we generate the puzzle. The
`progress` script uses those hashes to confirm that the player has found the
correct secrets by hashing the secrets found by their scripts comparing against
the corresponding line in `.hashes`.

When the player has found all the secrets, `progress` prints an ASCII-art
trophy. Cheaters who hack `progress` to say they are solving puzzles when they
are not will not get a trophy because it was encryted with all the actual
secrets as a key.

## Building the puzzle

Each step in the hunt is defined by a script that is given the secret for the
next step (so we have to build backwards from the last step to the first) and
hides that clue in some way, generating whatever files are needed in the puzzle
directory and then emits the clue which will be fed to the script for the
preceding step, until we get back to the zeroth step whose clue is stored in
`puzzle/.first-clue`.

Trivial example:

```bash
#!/usr/bin/env bash

# Save the secret we are given into a super secret file
echo "$1" > secret-file.txt

# Print the clue that will be given to the user.
echo "The next secret is in secret-file.txt"
```

The argument to the script will be the secret to hide which will consist of a
random number in hex and the clue emitted by the script for the subsequent step.
