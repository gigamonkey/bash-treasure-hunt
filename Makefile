.PHONY: clean tar

tar := bash-treasure-hunt-$(shell date -u +%Y%m%dT%H%M%SZ).tgz

check:
	shellcheck -x **/*.sh

tar: $(tar)

puzzle:
	./build/build.sh

$(tar): check
	cd .. && tar czf bash-treasure-hunt/$@ bash-treasure-hunt/build bash-treasure-hunt/progress

clean:
	rm -rf puzzle .secrets TROPHY clue-*.sh
	rm -f bash-treasure-hunt*.tgz
