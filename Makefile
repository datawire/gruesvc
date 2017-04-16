all: docker-images gruesvc.yaml

VERSION=0.1.0

.ALWAYS:

docker-images: gruesvc-image

gruesvc-image: .ALWAYS
	docker build -t dwflynn/gruesvc:$(VERSION) .
	if [ -n "$(DOCKER_REGISTRY)" ]; then \
		docker push $(DOCKER_REGISTRY)/gruesvc:$(VERSION); \
	fi
