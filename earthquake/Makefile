BUILD=mnist.def
IMAGE=mnist.sif

image:
	cp ${BUILD} build.def
	sudo /opt/singularity/3.7.1/bin/singularity build output_image.sif build.def
	cp output_image.sif ${IMAGE}
	make -f Makefile clean

clean:
	rm -rf build.def output_image.sif

queue: watch

delete:
	rm -f *.out *.err
	rm -f *_output.ipynb

submit:
	sbatch slurm-a100-ipynb.sh

watch: status

status:
	watch squeue --format=\"%.18i %.9P %.50j %.8u %.8T %.10M %.9l %.6D %R\" --me

run:
	singularity exec --nv mnist.sif papermill mnist.ipynb mnist_output.ipynb

shell:
	singularity shell --nv mnist.sif

all: delete clean image submit watch