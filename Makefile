fastapi:
	rye run fastapi dev main.py

build:
	docker build -t docker-image .

run:
	docker run -it --rm --name test -p 8080:8080 docker-image bash -c "fastapi dev main.py --host 0.0.0.0 --port 8080"



up:	build run