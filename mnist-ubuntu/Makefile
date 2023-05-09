BUILD=mnist.def
IMAGE=mnist.sif


image:
	sudo singularity build ${IMAGE} ${BUILD}

queue: watch

watch: status

run: 
	sh ubuntu.sh

delete: 
	rm -f *.out *.err


docker-image:
	docker build -t mnist-docker -f Dockerfile .

docker-run:
#	docker run -it --gpus all --ipc=host --ulimit memlock=-1 stack=67108864 mnist-docker
	docker run -it --gpus all --ulimit memlock=-1 mnist-docker


docker-mnist:
	docker run --gpus all --ulimit memlock=-1 mnist-docker which python
	docker run --gpus all --ulimit memlock=-1 mnist-docker python --version
	docker run --volume $(PWD):/workdir --gpus all --ulimit memlock=-1 mnist-docker python /workdir/mnist.py
