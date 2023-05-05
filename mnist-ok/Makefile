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

watch: status

status:
	watch squeue --format=\"%.18i %.9P %.50j %.8u %.8T %.10M %.9l %.6D %R\" --me

delete: 
	rm -f *.out *.err

submit_v100:
	sbatch slurm-v100.sh

submit_a100:
	sbatch slurm-a100.sh

submit_k80:
	sbatch slurm-k80.sh

submit_rtx3090:
	sbatch slurm-rtx3090.sh

submit_p100:
	sbatch slurm-p100.sh
