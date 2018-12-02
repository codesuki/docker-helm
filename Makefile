.PHONY: upgrade

VERSION ?= v2.11.0

upgrade:
	sed -i "" "s/^ARG VERSION=.*$$/ARG VERSION=$$VERSION/" Dockerfile
	sed -i "" "s/^VERSION ?= .*$$/VERSION ?= $$VERSION/" Makefile
	git add Dockerfile Makefile
	git commit -m "chore: upgrade helm to $$VERSION"
	git tag -a -m $$VERSION $$VERSION

build: Dockerfile
	docker build . -t codesuki/helm
