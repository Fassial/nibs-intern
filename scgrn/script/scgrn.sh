#!/bin/sh

#SBATCH -J scgrn
#SBATCH -p q_cn
#SBATCH -n 1
#SBATCH -c 32
#SBATCH -o scgrn.out
#SBATCH -e scgrn.err

# >>> module load >>>
# load nothing, use local env
# <<< module load complete <<<

# >>> excute cmd >>>
python ../src/scgrn.py
# <<< excute cmd complete <<<

