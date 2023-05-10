NAME=mnist
BUILD=mnist.def
IMAGE=mnist.sif

submit:
	sbatch slurm-rtx3090.sh
	sinfo
	squeue

image: image-nvidia image-docker

image-nvidia:
	time sudo singularity build --force ${NAME}-nvidia.sif ${NAME}-nvidia.def

image-docker:
	time sudo singularity build --force ${NAME}-docker.sif ${NAME}-docker.def

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
	-make -f Makefile docker-mnist > docker-mnist.out 2>&1
	@echo
	@echo ============================
	@echo SINGULARITY
	@echo ============================
	-make -f Makefile run > run.out 2>&1


b:
	nvidia-smi
	#docker run -it --gpus all --ulimit memlock=-1 local/mnist-docker
	singularity exec --nv --env TAG=nvidia,CARD=RTX3090 ${NAME}-nvidia.sif python ${NAME}.py > singularity-${NAME}-nvidia.out 2>&1
	singularity exec --nv --env TAG=docker,CARD=RTX3090 ${NAME}-docker.sif python ${NAME}.py > singularity-${NAME}-docker.out 2>&1



