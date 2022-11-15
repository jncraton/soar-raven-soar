all:

format:
	npx prettier -w index.html

check:
	npx prettier --check index.html
	npx jshint --extract=always index.html
