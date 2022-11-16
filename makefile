all:

format:
	npx prettier -w index.html

check:
	npx prettier --check index.html
	npx jshint --extract=always index.html

spellcheck:
	aspell --home-dir=. --check --dont-backup index.html
	aspell --home-dir=. --check --dont-backup readme.md
