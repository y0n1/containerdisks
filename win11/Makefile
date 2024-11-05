all: convert build deploy

convert:
	@./setup.sh convert

build: convert
	podman build --build-arg FILENAME=$$(./setup.sh get_file_name) -t ghcr.io/y0n1/containerdisks:win11-24h2-en-us-x64 .

deploy: build
	podman push ghcr.io/y0n1/containerdisks:win11-24h2-en-us-x64

clean:
	@echo "Cleaning up..."
	rm -rf disk/*

.PHONY: all convert build deploy clean
