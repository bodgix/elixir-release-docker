all: release

docker-image:
	docker build -t elixir-centos:latest .

release: docker-image
	docker run -v ${PWD}:/opt/build --rm -it elixir-centos:latest /opt/build/bin/build
