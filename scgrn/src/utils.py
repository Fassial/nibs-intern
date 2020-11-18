###################################
# Created on 22:20, Nov. 16th, 2020
# Author: fassial
# Filename: utils.py
###################################
# dep
import pandas as pd
import scanpy as sp
# local dep

# macro

# def get_data_lm func
def get_data_lm(sce_fname, sparse = False):
    # read sce
    sce = sp.read_loom(
        sce_fname,
        sparse = sparse
    )
    return sce.to_df()

# def get_data_csv func
def get_data_csv(sce_fname):
    # read sce
    sce = pd.read_csv(sce_fname,
        sep = '\t',
        header = 0,
        index_col = 0
    )
    return sce

