#! /bin/sh

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=nssac_students
#SBATCH --gres=gpu:a100:1
#SBATCH --job-name=mnist-1-a100
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err

nvidia-smi

singularity exec --nv mnist.sif python mnist.py

echo "==================================================="
seff $SLURM_JOB_ID
