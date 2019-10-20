release: docker-image

docker-image:
	docker build -t elixir-centos:latest .

release:
	docker run -v ${PWD}:/opt/build --rm -it elixir-centos:latest /opt/build/bin/build
