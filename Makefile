HEMTT=/tmp/hemtt
TAG=$(shell git describe --tag | sed "s/-.*-/-/")

all: build

deps:
	wget -P /tmp/ https://github.com/synixebrett/HEMTT/releases/download/v0.6.0/hemtt-v0.6.0-x86_64-unknown-linux-gnu.tar.gz
	tar xf /tmp/hemtt-v0.6.0-x86_64-unknown-linux-gnu.tar.gz -C /tmp/

build: 
	$(HEMTT) build

