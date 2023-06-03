#!/bin/bash
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=lhtran
#SBATCH -p gpu
#SBATCH --gres=gpu:rtx2080:1
#SBATCH -t 3:00:00
#SBATCH -c 2
#SBATCH -a 1-1
#SBATCH --mem=8g
#SBATCH -o /home/lhtran/class/cheme_577/challenge_5/logs/out.%a
#SBATCH -e /home/lhtran/class/cheme_577/challenge_5/logs/out.%a

GROUP_SIZE=1

#source activate /software/conda/envs/tensorflow
#source activate mlfold
#source activate mlfold

for I in $(seq 1 $GROUP_SIZE)
do
    J=$(($SLURM_ARRAY_TASK_ID * $GROUP_SIZE + $I - $GROUP_SIZE))
    CMD=$(sed -n "${J}p" /home/lhtran/class/cheme_577/challenge_5/superfold_cmd_monomer )
    echo "${CMD}" | bash
done
