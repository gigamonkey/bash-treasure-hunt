#!/usr/bin/env bash

set -euo pipefail
shopt -s globstar

dir=$(mktemp -d)

mkdir -p "$dir/build"
rsync -r build/ "$dir/build/"
cp .version "$dir"
cp progress "$dir"
cp puzzle.gitignore "$dir/.gitignore"

cd "$dir"

cat <<'PREAMBLE'
#!/usr/bin/env bash

set -euo pipefail

opt="${1-unset}"

if [[ -e puzzle && "$opt" != "-f" ]]; then
    echo "Puzzle already built. Run with -f to rebuild."
    exit 1;
fi

if [[ "$opt" == "-f" ]]; then
    rm -rf .found .hints .version README progress puzzle
fi

cat <<EOF | base64 -d | gzip -cd | bash
PREAMBLE

readarray -t files < <(find build)

shar build progress .version .gitignore "${files[@]}" | grep -Ev '^echo . ' | gzip -c | base64

cat <<'POSTAMBLE'
EOF

chmod +x ./build/*.sh
chmod +x progress

./build/build.sh

cat <<EOF

Welcome! To get started:

  1. Read README for basic instructions.
  2  Write your first code in clue-000.sh.
  3. Run ./progress to check your progress.

If you get stuck, run ./progress --hint to get an extra hint for the current clue.

EOF
POSTAMBLE
