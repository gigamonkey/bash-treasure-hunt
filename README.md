# Bash treasure hunt

Treasure hunt that requires using bash and other command line tools to find the
series of clues.

Clues are hidden within the file system which is created via a setup script that
will make a bunch of files with secrets hidden in them. We could use just a tar
of the scavenger hunt but we want to uniquify the clues so each person has to
find their own.

## Basic gameplay:

Player starts by reading the file START which contains the first secret and
write a script in `solutions` that extracts that secret.


Player then follows the clue to find the next secret. Secrets consist of are
random numbers generated when the puzzle is set up and are thus unique for
scavenger hunt. We also store the hash of each secret in order in the `.hashes`
file when we generate the puzzle. Then we can confirm that the player has found
the correct secrets by hashing the secrets found by their scripts comparing
against the corresponding line in `.hashes` but there's no way to forge the
secrets since they're just random and are only stored wherever they are hidden.

## Basic structure to build the puzzle.

Each step is defined by a script that is given the secret for the next step (so
we have tot build from the end) and hides that clue in some way, generating
whatever files are needed in the puzzle directory and then emits the clue which
will be fed to the script for the preceding step, until we get back to the
zeroth step which generates `puzzle/README` containing the first secret.

Trivial example:

```bash
#!/usr/bin/env bash

echo "$1" > second-secret.txt
```

The argument to the script will be the secret to hide which will consist of a
random number in hex and the clue emitted by the script for the subsequent step.

## Final prize

Final prize may be some ASCII art trophy with the username in it. If we
generated the puzzle on a server we could cryptographically sign the `.hashes`
file and then the trophy could be non-forgeable. But not worth it for now.
Probably just build something like this into the `check` script.

```
echo -e "$USERNAME:\nYou win!" | figlet > trophy.txt
echo >> trophy.txt
shasum < secrets.txt | cut -c -40 >> trophy.txt
```
