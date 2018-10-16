.PHONY:	build push latest

PREFIX=quay.io/reverbnation
TAG = 1.5.4

build:
	docker build --pull -t $(PREFIX)/seyren:$(TAG) .

push:
	docker push $(PREFIX)/seyren:$(TAG)

latest:
	docker tag $(PREFIX)/seyren:$(TAG) $(PREFIX)/seyren:latest
	docker push $(PREFIX)/seyren:latest
