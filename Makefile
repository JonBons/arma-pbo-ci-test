HEMTT=hemtt
TAG=$(shell git describe --tag | sed "s/-.*-/-/")

all: build

deps:
	wget -P /tmp/ https://github.com/synixebrett/HEMTT/releases/download/v0.6.0/hemtt-v0.6.0-x86_64-unknown-linux-gnu.tar.gz
	tar xf /tmp/hemtt-v0.6.0-x86_64-unknown-linux-gnu.tar.gz -C /tmp/
	cp /tmp/hemtt /usr/local/bin/
	rm -Rf /tmp/hemtt-v0.6.0-x86_64-unknown-linux-gnu.tar.gz
	rm -Rf /tmp/hemtt

build: 
	$(HEMTT) build --release

