#!/bin/sh

# macro
DIR_ROOT=$(pwd)
DIR_SCRIPT=${DIR_ROOT}/script
DIR_SRC=${DIR_ROOT}/src
DIR_DATA=${DIR_ROOT}/data
DIR_RESOURCE=${DIR_ROOT}/resource
DIR_OUTPUT=${DIR_ROOT}/output
ADJ_FNAME=adjacencies.tsv
REGULONS_FNAME=regulons.csv
AUC_FNAME=auc-mtx.csv

# >>> module load >>>
# load nothing, use local env
# <<< module load complete <<<

# >>> excute cmd >>>
echo "Start pyscenic 2~3(supported by docker)..."
for seeddir in ${DIR_OUTPUT}/*; do
    echo "Phase II: Prune modules for targets with cis regulatory footprints (aka RcisTarget)"
    echo "Processing "${seeddir##*/}"..."
    docker run -it -v $PWD:$PWD aertslab/pyscenic:0.9.18 \
        pyscenic ctx \
        ${DIR_OUTPUT}/seed-0/${ADJ_FNAME} \
        ${DIR_RESOURCE}/mm10__refseq-r80__10kb_up_and_down_tss.mc9nr.feather \
        ${DIR_RESOURCE}/mm10__refseq-r80__500bp_up_and_100bp_down_tss.mc9nr.feather \
        --annotations_fname ${DIR_RESOURCE}/motifs-v9-nr.mgi-m0.001-o0.0.tbl \
        --expression_mtx_fname ${DIR_DATA}/pituitary_filtered.loom \
        --mode "dask_multiprocessing" \
        --output ${seeddir}/${REGULONS_FNAME} \
        --num_workers 16
    echo "Phase II complete!"
    echo "Phase III: Cellular regulon enrichment matrix (aka AUCell)"
    docker run -it -v $PWD:$PWD aertslab/pyscenic:0.9.18 \
        pyscenic aucell \
        ${DIR_DATA}/pituitary_filtered.loom \
        ${seeddir}/${REGULONS_FNAME} \
        --output ${seeddir}/pituitary_SCENIC.loom \
        --num_workers 16
    echo "Phase III complete!"
done
# <<< excute cmd complete <<<

