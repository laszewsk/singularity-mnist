image:
	sudo singularity build mnist.sif mnist.def

copy:
	time scp mnist.def rivanna:
	time scp mnist.sif rivanna:

