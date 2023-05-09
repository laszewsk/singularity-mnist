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

