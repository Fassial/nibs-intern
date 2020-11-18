###################################
# Created on 22:05, Nov. 16th, 2020
# Author: fassial
# Filename: scgrn.py
###################################
# dep
import os
import glob
import random
import seaborn as sns
from arboreto.utils import load_tf_names
from arboreto.algo import grnboost2
from pyscenic.rnkdb import FeatherRankingDatabase as RankingDatabase
from pyscenic.utils import modules_from_adjacencies
from pyscenic.prune import prune2df, df2regulons
from pyscenic.aucell import aucell
# local dep
import utils

# macro
DIR_ROOT = os.path.join(os.getcwd(), "..")
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
    db_fnames = glob.glob(os.path.join(DIR_RESOURCE, "mm10-*.mc9nr.feather"))
    ma_fname = os.path.join(DIR_RESOURCE, "motifs-v9-nr.mgi-m0.001-o0.0.tbl")
    # set output fnames
    adj_fname = os.path.join(DIR_OUTPUT_SEED, "adjacencies.tsv")
    motifs_fname = os.path.join(DIR_OUTPUT_SEED, "motifs.csv")
    regulons_fname = os.path.join(DIR_OUTPUT_SEED, "regulons.csv")
    auc_fname = os.path.join(DIR_OUTPUT_SEED, "aucell.csv")
    # get sce & tf_names & dbs
    sce = utils.get_data_lm(
        sce_fname = sce_fname
    )
    tf_names = load_tf_names(tf_fname)
    dbs = [RankingDatabase(
        fname=fname,
        name=os.path.splitext(os.path.basename(fname))[0]
    ) for fname in db_fnames]
    ## Phase I: Inference of co-expression modules
    # get & save adj
    adj = grnboost2(
        expression_data = sce,
        tf_names = tf_names,
        verbose = True,
        seed = seed
    )
    adj.to_csv(adj_fname, index=False, sep="\t")
    # derive potential regulomes from these co-expression modules
    modules = list(modules_from_adjacencies(adj, sce))
    ## Phase II: Prune modules for targets with cis regulatory footprints (aka RcisTarget)
    # get & save motifs
    motifs = prune2df(dbs, modules, ma_fname); motifs.to_csv(motifs_fname)
    # get & save regulons
    regulons = df2regulons(motifs); regulons.to_csv(regulons_fname)
    ## Phase III: Cellular regulon enrichment matrix (aka AUCell)
    auc_mtx = aucell(sce, regulons, num_workers = 1); auc_mtx.to_csv(auc_fname)
    sns.clustermap(auc_mtx, figsize=(12,12))

# def main func
def main():
    seeds = range(0, 1, 1)
    for i in seeds: expr(seed = i)

if __name__ == "__main__":
    main()

