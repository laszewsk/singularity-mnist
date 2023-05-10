BUILD=mnist.def
IMAGE=mnist.sif

submit:
	sbatch slurm-rtx3090.sh
	sinfo
	squeue

image:
	time sudo singularity build ${IMAGE} ${BUILD}

queue: watch

watch: status

run: 
	time sh ubuntu.sh

delete: 
	rm -f *.out *.err


docker-image:
	time docker build -t local/mnist-docker -f Dockerfile .

docker-run:
#	docker run -it --gpus all --ipc=host --ulimit memlock=-1 stack=67108864 mnist-docker
	docker run -it --gpus all --ulimit memlock=-1 local/mnist-docker


docker-mnist:
	# docker run --gpus all --ulimit memlock=-1 local/mnist-docker which python
	# docker run --gpus all --ulimit memlock=-1 local/mnist-docker python --version
	time docker run --volume $(PWD):/workdir --gpus all --ulimit memlock=-1 local/mnist-docker python /workdir/mnist.py

from-docker:
	sudo singularity build mnist-docker-local.sif docker-daemon://local/mnist-docker:latest

convert:
	pip install spython
	spython recipe Dockerfile > s.def
	cat s.def

benchmark:
	@echo ============================
	@echo DOCKERFILE
	@echo ============================
	@ make -f Makefile docker-mnist
	@echo
	@echo ============================
	@echo SINGULARITY
	@echo ============================
	@ make -f Makefile run
