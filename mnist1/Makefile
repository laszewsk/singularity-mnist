BUILD=mnist.def
IMAGE=mnist.sif

image:
	cp ${BUILD} build.def
	sudo /opt/singularity/3.7.1/bin/singularity build output_image.sif build.def
	cp output_image.sif ${IMAGE}
	make -f Makefile clean

clean:
	rm -rf build.def output_image.sif

queue: 
	squeue -u ${USER}

delete: 
	rm -f *.out *.err	

submit:
	sbatch slurm-v100.sh
