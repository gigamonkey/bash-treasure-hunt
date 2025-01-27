.PHONY: clean

check:
	shellcheck -x **/*.sh

puzzle:
	./build/build.sh

clean:
	rm -rf puzzle .secrets TROPHY clue-*.sh
