# To add a step to the puzzle

## Step 1: Write a script with some short but meaningful name ending in .sh

The script will called with one argument which will be the secret to hide. It
should then hide the secret somehow. It will be run in the puzzle directory so
any relative file names will be relative to that.

The script should output one line containing the human-readable clue describing
how to find the secret to standard out.

## Step 2: Add to STEPS

Add the base name of the script (i.e. without the .sh extension) to the STEPS
file in whatever position you want it to occur in the treasure hunt.

## Step 3: (Optional) Write a solution

Write a script with the same name in ../solutions/ that extracts the secret,
i.e. a script that a player might write to solve this step of the hunt.
