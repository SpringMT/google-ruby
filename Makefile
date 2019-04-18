PREFIX = springmt

build25:
	cd 2.5 && docker build --pull -t ${PREFIX}/google-ruby:2.5 .

build26:
	cd 2.6 && docker build --pull -t ${PREFIX}/google-ruby:2.6 .

push: build25 build26
	docker push ${PREFIX}/google-ruby:2.5
	docker push ${PREFIX}/google-ruby:2.6

