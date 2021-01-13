###################################
# Created on 22:20, Nov. 16th, 2020
# Author: fassial
# Filename: utils.py
###################################
# dep
import os
import pandas as pd
import scanpy as sp
from collections import defaultdict
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
        sep = ',',
        header = 0,
        index_col = 0
    )
    return sce

# def UTILS_GET_DATA_FUNC dict
UTILS_GET_DATA_FUNC = defaultdict(lambda : get_data_csv, {
    ".loom": get_data_lm,
    ".csv": get_data_csv
})

# def get_data func
def get_data(sce_fname):
    sce = UTILS_GET_DATA_FUNC[os.path.splitext(sce_fname)[1]](
        sce_fname = sce_fname
    )
    return sce

