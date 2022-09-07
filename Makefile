test: bats
test2: rspec

rspec:
	bundle exec rspec --color --format documentation
bats: build
	bats test/httpd.bats
build:
	docker-compose build


