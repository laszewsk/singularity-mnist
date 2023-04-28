#! /bin/sh

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=bii_dsc_community
#SBATCH --gres=gpu:v100:1
#SBATCH --job-name=MYNAME
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err

nvidia-smi
singularity exec --nv mnist.sif python mnist.py
seff $SLURM_JOB_ID
