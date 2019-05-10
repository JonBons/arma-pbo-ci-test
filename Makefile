HEMTT=hemtt
TAG=$(shell git describe --tag | sed "s/-.*-/-/")

all: removeAll \
	build \
	remove

deploy: all
	rm -Rf .builds/$(TAG)/
	mkdir -p .builds/$(TAG)/
	cp -Rf .build/keys/ .builds/$(TAG)/

deps:
	wget -P /tmp/ https://github.com/synixebrett/HEMTT/releases/download/v0.6.0/hemtt-v0.6.0-x86_64-unknown-linux-gnu.tar.gz
	tar xf /tmp/hemtt-v0.6.0-x86_64-unknown-linux-gnu.tar.gz -C /tmp/
	cp /tmp/hemtt /usr/local/bin/
	rm -Rf /tmp/hemtt-v0.6.0-x86_64-unknown-linux-gnu.tar.gz
	rm -Rf /tmp/hemtt


prepare:
	mkdir -p .build/
	mkdir -p .build/bin/
	mkdir -p .build/keys

test: prepare
	git clone https://github.com/TheMysteriousVincent/sqf.git .build/sqf
	python3 .build/sqf/sqflint.py -d Eisengrind.Tanoa
	python3 tools/config_style_checker.py

remove:
	rm -Rf .build/bin
	rm -Rf .build/sqf

removeAll:
	rm -Rf .build/

build: 
	$(HEMTT) build

