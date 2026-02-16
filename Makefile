.PHONY: clean

dir	:= $(notdir $(shell pwd))
version := $(shell date -u +%Y%m%dT%H%M%SZ)

all: start

build: clean
	./build/build.sh

check:
	shellcheck -x **/*.sh progress run-in-docker

puzzle:
	./build/build.sh

start: check .version make-start.sh
	./make-start.sh > $@
	chmod +x $@

.version:
	echo $(version) > $@

clean:
	rm -f .version
	rm -f README
	rm -f TREASURE
	rm -f clue-*.sh
	rm -f start
	rm -rf .found
	rm -rf .hints
	rm -rf puzzle
