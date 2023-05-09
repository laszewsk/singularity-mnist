#! /bin/sh

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=nssac_students
#SBATCH --gres=gpu:v100:1
#SBATCH --job-name=mnist-1-v100
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err

nvidia-smi

#cms gpu system
#cms gpu status
#cms gpu count
#cms gpu watch --gpu=0 --delay=1 --dense > gpu0.log &

singularity exec --nv mnist.sif python mnist.py

echo "==================================================="
seff $SLURM_JOB_ID

