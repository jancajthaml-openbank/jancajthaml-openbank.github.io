.ONESHELL:

.PHONY: all
all: gitbook-build

.PHONY: gitbook-build
book-build:
	mdbook build

