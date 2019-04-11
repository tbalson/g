all: start
	@echo Start

docker-all: docker-build docker-start

docker-buiild:
	@echo "Building the damn thing"
	docker build -t tbalson/cpu .
	@echo "The damn thing is built"

docker-start:
	@echo "starting the service in container..."
	docker run -v /home/:/home/ -p 8080:8080 tbalson/cpu

docker-stop:
	@echo "stoping the service..."
	docker stop $$(docker ps -alq)
	@echo "service stopped"

docker-remove:
	@echo "removing the image..."
	docker rmi -f tbalson/cpu
	@echo "image removed"

docker-clean: docker-stop docker-remove
	@echo "DONE"

clean:
	@echo "removing service files created"
	rm -rf $(CREATED)

start:
	@echo "Lets goooo"
	pip install -U pip && \
	pip install -r requirements.txt && \
	python server.py

