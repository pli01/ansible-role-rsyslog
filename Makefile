PACKAGENAME ?= ansible-role-rsyslog
VERSION ?= $(shell [ -f VERSION ] && cat VERSION || echo "latest" )

version:
	@echo $(PACKAGENAME) $(VERSION)
package: build
	@echo '# $@ STARTING'
	@bash ./tools/package.sh $(PACKAGENAME) $(VERSION)
	@echo '# $@ SUCCESS'
clean: clean-dist clean-build
clean-dist:
	rm -rf dist ||true
clean-build:
	rm -rf build ||true


.PHONY: test build

build: clean build-step

build-step:
	@echo '# $@ STARTING'
	bash ./tools/build.sh $(PACKAGENAME) $(VERSION)
	@echo '# $@ SUCCESS'

test: build unit-test
	@echo '# $@ SUCCESS'

unit-test:
	@echo '# $@ STARTING'
	( cd build/$(PACKAGENAME)-$(VERSION)/tests && bash unit-test.sh $(PACKAGENAME) $(VERSION) )
	@echo '# $@ SUCCESS'
