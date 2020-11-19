###################################
# Created on 22:05, Nov. 16th, 2020
# Author: fassial
# Filename: scgrn.py
###################################
# dep
import os
import sys
import glob
import random
import pandas as pd
import seaborn as sns
from arboreto.utils import load_tf_names
from arboreto.algo import grnboost2
from pyscenic.rnkdb import FeatherRankingDatabase as RankingDatabase
from pyscenic.utils import modules_from_adjacencies
from pyscenic.prune import prune2df, df2regulons
from pyscenic.aucell import aucell
# local dep
import utils
import infer_grn

# macro
DIR_ROOT = os.path.join(os.getcwd())
DIR_DATA = os.path.join(DIR_ROOT, "data")
DIR_RESOURCE = os.path.join(DIR_ROOT, "resource")
DIR_OUTPUT = os.path.join(DIR_ROOT, "output")
if not os.path.exists(DIR_OUTPUT): os.mkdir(DIR_OUTPUT)

# def expr func
def expr(seed = 1):
    ## Phase 0: Set random seed
    # random.seed(seed)
    # set fnames
    DIR_OUTPUT_SEED = os.path.join(DIR_OUTPUT, ("seed-%d" % (seed)))
    if not os.path.exists(DIR_OUTPUT_SEED): os.mkdir(DIR_OUTPUT_SEED)
    # set input fnames
    sce_fname = os.path.join(DIR_DATA, "pituitary_filtered.loom")
    tf_fname = os.path.join(DIR_RESOURCE, "mm_mgi_tfs.txt")
    db_fnames = glob.glob(os.path.join(DIR_RESOURCE, "mm10_*.mc9nr.feather"))
    ma_fname = os.path.join(DIR_RESOURCE, "motifs-v9-nr.mgi-m0.001-o0.0.tbl")
    # set output fnames
    adj_fname = os.path.join(DIR_OUTPUT_SEED, "adjacencies.tsv")
    motifs_fname = os.path.join(DIR_OUTPUT_SEED, "motifs.csv")
    regulons_fname = os.path.join(DIR_OUTPUT_SEED, "regulons.csv")
    auc_fname = os.path.join(DIR_OUTPUT_SEED, "auc-mtx.csv")
    # get sce & tf_names & dbs
    sce = utils.get_data_lm(
        sce_fname = sce_fname
    )
    tf_names = load_tf_names(tf_fname); print(f"Loaded {len(tf_names)} TFs...", file = sys.stdout)
    dbs = [RankingDatabase(
        fname=fname,
        name=os.path.splitext(os.path.basename(fname))[0]
    ) for fname in db_fnames]
    ## Phase I: Inference of co-expression modules
    print("Phase I: Inference of co-expression modules")
    # get & save adj
    adj = infer_grn.infer_grn(
        sce_fname = sce_fname,
        tf_names = tf_names,
        rand_seed = seed
    )
    adj.to_csv(adj_fname, index=False, sep="\t")
    print("Phase I complete!")

# def main func
def main():
    seeds = range(0, 10, 1)
    for i in seeds: expr(seed = i)

if __name__ == "__main__":
    main()

