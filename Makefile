.ONESHELL:
.PHONY: arm64
.PHONY: amd64

.PHONY: all
all: book-build

.PHONY: book-build
book-build:
	cd book && mdbook build
