#! /bin/sh

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --time=01:00:00
#SBATCH --partition=bii-gpu
#SBATCH --account=nssac_students
#SBATCH --gres=gpu:v100:1
#SBATCH --job-name=mnist-v100
#SBATCH --output=v100-%u-%j.out
#SBATCH --error=v100-%u-%j.err

module purge 
module load singularity

hostname
echo "SLURM_CPUS_ON_NODE: $SLURM_CPUS_ON_NODE"
echo "SLURM_CPUS_PER_GPU: $SLURM_CPUS_PER_GPU"
echo "SLURM_GPU_BIND: $SLURM_GPU_BIND"
echo "SLURM_JOB_ACCOUNT: $SLURM_JOB_ACCOUNT"
echo "SLURM_JOB_GPUS: $SLURM_JOB_GPUS"
echo "SLURM_JOB_ID: $SLURM_JOB_ID"
echo "SLURM_JOB_PARTITION: $SLURM_JOB_PARTITION"
echo "SLURM_JOB_RESERVATION: $SLURM_JOB_RESERVATION"
echo "SLURM_SUBMIT_HOST: $SLURM_SUBMIT_HOST"

echo "Working in $(pwd)"
# echo "Repository Revision: $(git rev-parse HEAD)"
# echo "Python Version: $(singularity exec mnist.sif python --version)"
# echo "Running on host: $(hostname -a)"

module purge
module load singularity

nvidia-smi

#cms gpu system
#cms gpu status
#cms gpu count
#cms gpu watch --gpu=0 --delay=1 --dense > gpu0.log &

singularity exec --nv mnist.sif python mnist.py

echo "==================================================="
seff $SLURM_JOB_ID

