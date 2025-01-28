EOF

chmod +x ./build/*.sh
chmod +x progress

./build/build.sh

cat <<EOF

Welcome! To get started:

  1. Read README for basic instructions.
  2  Write your first code in clue-000.sh.
  3. Run this script again to check your progress.

EOF
