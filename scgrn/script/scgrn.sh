#!/bin/sh

#SBATCH -J scgrn
#SBATCH -p q_cn
#SBATCH -n 1
#SBATCH -c 48
#SBATCH -o scgrn.out
#SBATCH -e scgrn.err

# >>> module load >>>
# module load python/3.6.2
module load scenic/0.10.0
# <<< module load complete <<<

# >>> excute cmd >>>
python ../src/scgrn.py
# <<< excute cmd complete <<<

