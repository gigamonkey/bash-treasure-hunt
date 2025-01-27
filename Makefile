.PHONY: clean tar

dir	:= $(notdir $(shell pwd))
version := $(shell date -u +%Y%m%dT%H%M%SZ)
tar	:= $(dir)-$(version).tgz

foo:
	echo $(dir)

check:
	shellcheck -x **/*.sh

tar: $(tar)

puzzle:
	./build/build.sh

$(tar): check .version README
	cd .. && tar czf $(dir)/$@ $(dir)/build $(dir)/progress $(dir)/.version $(dir)/README

.version:
	echo $(version) > $@

clean:
	rm -rf puzzle
	rm -f .secrets
	rm -f TROPHY
	rm -f clue-*.sh
	rm -f $(dir)*.tgz
	rm -f .version
