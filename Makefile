.ONESHELL:

.DEFAULT_GOAL := all

.PHONY: all
all: book-build

.PHONY: book-build
book-build:
	mdbook build