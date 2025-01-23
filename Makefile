.PHONY: check

solvers := $(wildcard solutions/clue-*.sh)
secrets := $(patsubst solutions/clue-%.sh,.secret-%,$(solvers))

check: $(secrets)
	@./check

.secret-%: solutions/clue-%.sh
	@bash $< > $@

clean:
	@rm -f .secret-*
