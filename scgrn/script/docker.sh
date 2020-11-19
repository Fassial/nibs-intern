#!/bin/sh

# >>> module load >>>
# load nothing, use local env
# <<< module load complete <<<

# >>> excute cmd >>>
echo "Phase II: Prune modules for targets with cis regulatory footprints (aka RcisTarget)"
pyscenic ctx \
    ../output/seed-0/adjacencies.tsv \
    ../resource/mm10__refseq-r80__10kb_up_and_down_tss.mc9nr.feather \
    ../resource/mm10__refseq-r80__500bp_up_and_100bp_down_tss.mc9nr.feather \
    --annotations_fname ../resource/motifs-v9-nr.mgi-m0.001-o0.0.tbl \
    --expression_mtx_fname ../data/pituitary_filtered.loom \
    --mode "dask_multiprocessing" \
    --output ./regulons.csv \
    --num_workers 16
echo "Phase II complete!"
echo "Phase III: Cellular regulon enrichment matrix (aka AUCell)"

echo "Phase III complete!"
# <<< excute cmd complete <<<

