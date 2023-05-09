#! /bin/sh

nvidia-smi

#cms gpu system
#cms gpu status
#cms gpu count
#cms gpu watch --gpu=0 --delay=1 --dense > gpu0.log &
#sleep 1

time singularity exec --nv mnist.sif python mnist.py | tee run.log

echo "==================================================="
#seff $SLURM_JOB_ID

