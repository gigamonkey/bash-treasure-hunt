# Bash treasure hunt

Treasure hunt that requires using bash and other command line tools to find the
series of clues.

Clues are hidden within the file system which is created via a setup script that
will make a bunch of files with secrets hidden in them. We could use just a tar
of the scavenger hunt but we want to uniquify the clues so each person has to
find their own.

## Basic gameplay:

Player starts by running the script `progress` which will create the first
solutions script and give the player instructions to read `puzzle/README` and
edit `solutions/clue-000.sh` to extract the secret from the `README`.

Player then follows the clue to find the next secret. Secrets consist of are
random numbers generated when the puzzle is set up and are thus different every
time the scavenger hunt is built. We also store the hash of each secret in order
in the `.hashes` file when we generate the puzzle. The `progress` script uses
those hashes to confirm that the player has found the correct secrets by hashing
the secrets found by their scripts comparing against the corresponding line in
`.hashes`.

Progress (as the name suggests) will report on progress through the treasure
hunt and will print a banner when the player finds the last secret.

## Building the puzzle

Each step in the hunt is defined by a script that is given the secret for the
next step (so we have to build backwards from the last step to the first) and
hides that clue in some way, generating whatever files are needed in the puzzle
directory and then emits the clue which will be fed to the script for the
preceding step, until we get back to the zeroth step which generates
`puzzle/README` containing the first secret.

Trivial example:

```bash
#!/usr/bin/env bash

echo "$1" > second-secret.txt

echo "The next secret is in second-secret.txt"
```

The argument to the script will be the secret to hide which will consist of a
random number in hex and the clue emitted by the script for the subsequent step.

Each script is invoked in an environment where the functions from functions.sh
have been exported.
