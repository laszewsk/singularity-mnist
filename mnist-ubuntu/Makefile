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
	time docker build -t local/mnist-docker -f Dockerfile-docker .
	time docker build -t local/mnist-nvidia -f Dockerfile-nvidia .

docker-run:
	docker run -it --gpus all --ipc=host --ulimit memlock=-1 stack=67108864 mnist-docker
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
	#nvidia-smi

	docker run --env TAG=docker-nvidia-gpu --env CARD=RTX3090 --volume $(PWD):/workdir --gpus all --ulimit memlock=-1 local/mnist-nvidia python /workdir/mnist.py > docker-${NAME}-gpu-nvidia.out 2>&1
	docker run --env TAG=docker-docker-gpu --env CARD=RTX3090 --volume $(PWD):/workdir --gpus all --ulimit memlock=-1 local/mnist-docker python /workdir/mnist.py > docker-${NAME}-gpu-docker.out 2>&1

	docker run --env TAG=docker-nvidia-cpu --env CARD=RTX3090 --volume $(PWD):/workdir --ulimit memlock=-1 local/mnist-nvidia python /workdir/mnist.py > docker-${NAME}-cpu-nvidia.out 2>&1
	docker run --env TAG=docker-docker-cpu --env CARD=RTX3090 --volume $(PWD):/workdir --ulimit memlock=-1 local/mnist-docker python /workdir/mnist.py > docker-${NAME}-cpu-docker.out 2>&1

	singularity exec --nv --env TAG=singularity-nvidia-gpu,CARD=RTX3090 ${NAME}-nvidia.sif python ${NAME}.py > singularity-${NAME}-gpu-nvidia.out 2>&1
	singularity exec --nv --env TAG=singularity-docker-gpu,CARD=RTX3090 ${NAME}-docker.sif python ${NAME}.py > singularity-${NAME}-gpu-docker.out 2>&1

	singularity exec --env TAG=singularity-nvidia-cpu,CARD=RTX3090 ${NAME}-nvidia.sif python ${NAME}.py > singularity-${NAME}-cpu-nvidia.out 2>&1
	singularity exec --env TAG=singularity-docker-cpu,CARD=RTX3090 ${NAME}-docker.sif python ${NAME}.py > singularity-${NAME}-cpu-docker.out 2>&1



