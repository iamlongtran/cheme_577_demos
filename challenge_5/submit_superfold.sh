#!/bin/bash
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=END
#SBATCH --mail-user=lhtran
#SBATCH -t 3:00:00
#SBATCH -c 4
#SBATCH -N 1
#SBATCH --mem=6g
#SBATCH -a 1-1
#SBATCH -o /home/lhtran/class/cheme_577/challenge_5/logs/out.%a
#SBATCH -e /home/lhtran/class/cheme_577/challenge_5/logs/out.%a

GROUP_SIZE=1
#source activate /software/conda/envs/mlfold
for I in $(seq 1 $GROUP_SIZE)
do
    J=$(($SLURM_ARRAY_TASK_ID * $GROUP_SIZE + $I - $GROUP_SIZE))
    CMD=$(sed -n "${J}p" /home/lhtran/class/cheme_577/challenge_5/superfold_cmd )
    echo "${CMD}" | bash
done
