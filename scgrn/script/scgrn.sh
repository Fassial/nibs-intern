#!/bin/sh

# macro
DIR_ROOT=$(pwd)
DIR_SRC=${DIR_ROOT}/src

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
python ${DIR_SRC}/scgrn.py
# <<< excute cmd complete <<<

