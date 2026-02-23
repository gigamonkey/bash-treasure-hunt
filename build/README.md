# To add a step to the puzzle

## Step 1: Write a script with some short but meaningful name ending in .sh

The script will be called with one argument which will be the secret to hide.
Which will be one line of text. It should then hide the secret somehow. The
script will be run in the puzzle directory so any relative file names will be
relative to that. And it will be run in an environment where the functions from
`functions.sh` have been exported. Commonly useful functions should be added
there.

The script should output one line containing the human-readable clue describing
how to find the secret to standard out.

## Step 2: Add to STEPS

Add the base name of the script (i.e. without the `.sh` extension) to the STEPS
file in whatever position you want it to occur in the treasure hunt. Try to be
thoughtful about where you put your puzzle in the overall flow.

## Step 3: Write a hint

Write a hint file with the same basename as the script but with a `.txt`
extension containing human-readable text giving some kind of hint about how to
solve the step. This is a good place to introduce useful commands that a player
might not know about.

## Step 4: Write a solution

Write a script with the same name in `../solutions/` that extracts the secret,
i.e. a script that a player might write to solve this step of the hunt.

## Step 5: Run `make check`

Run the `make check` to run shellcheck on all the shell scripts to make sure
everything is clean.

# What makes a good puzzle step?

The goal of the treasure hunt is to give solvers a chance to pratice and learn
about bash basics and unix commands. As a rule of thumb, solving a puzzle step
should not require writing a complex multi-line bash program. The most stylish
steps can be solved with a single pipeline.
