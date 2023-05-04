#! /bin/sh

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=bii_dsc_community
#SBATCH --gres=gpu:v100:1
#SBATCH --job-name=mnist-1
#SBATCH --output=%u-%j.out
#SBATCH --error=%u-%j.err

nvidia-smi

singularity exec --nv mnist.sif papermill python mnist.ipynb

echo "==================================================="
seff $SLURM_JOB_ID
