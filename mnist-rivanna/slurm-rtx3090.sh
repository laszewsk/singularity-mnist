#! /bin/sh

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=gpu
#SBATCH --account=nssac_students
#SBATCH --gres=gpu:rtx3090:1
#SBATCH --job-name=mnist-1-rtx3090
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err

nvidia-smi

singularity exec --nv mnist.sif python mnist.py

echo "==================================================="
seff $SLURM_JOB_ID
