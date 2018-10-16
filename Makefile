.PHONY:	build push

PREFIX=quay.io/reverbnation
TAG = 1.5.3

build:
	docker build --pull -t $(PREFIX)/seyren:$(TAG) .


push:
	docker push $(PREFIX)/seyren:$(TAG)