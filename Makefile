PREFIX = springmt

build25:
	cd 2.5 && docker build --pull -t ${PREFIX}/google-ruby:2.5 .

build26:
	cd 2.6 && docker build --pull --build-arg ruby_version=2.6.5 -t ${PREFIX}/google-ruby:2.6 .

push25: build25 build26
	docker push ${PREFIX}/google-ruby:2.5

push26: build26
	docker push ${PREFIX}/google-ruby:2.6
