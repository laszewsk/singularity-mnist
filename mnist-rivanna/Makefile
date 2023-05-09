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

run-v100:
	sbatch slurm-v100.sh

run-a100:
	sbatch slurm-a100.sh

run-k80:
	sbatch slurm-k80.sh

run-rtx3090:
	sbatch slurm-rtx3090.sh

run-p100:
	sbatch slurm-p100.sh

ijob:
	ijob -c 1 -A bii_dsc_community -p bii-gpu --reservation=bi_fox_dgx --gres=gpu:a100:1 --time=0-00:10:00

shell:
	singularity shell mnist.sif

view:
	watch tail *.out


all: delete clean image run-a100 watch

all-gpu:
	make -f Makefile run-v100
	make -f Makefile run-k80
	make -f Makefile run-p100
	make -f Makefile run-rtx3090
