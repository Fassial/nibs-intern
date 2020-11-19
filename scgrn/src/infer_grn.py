###################################
# Created on 18:03, Nov. 18th, 2020
# Author: fassial
# Filename: infer_grn.py
###################################
# dep
import sys
import time
import tqdm
import pandas as pd
from multiprocessing import Pool, cpu_count
from arboreto.algo import _prepare_input
from arboreto.core import SGBM_KWARGS, RF_KWARGS, EARLY_STOP_WINDOW_LENGTH
from arboreto.core import to_tf_matrix, target_gene_indices, infer_partial_network
from pyscenic.cli.utils import load_exp_matrix

# global vars
exp_matrix, gene_names = None, None
tf_matrix, tf_matrix_gene_names = None, None
method_params, seed = None, None

# def infer_partial_grn func
def infer_partial_grn(target_gene_index):
    # set global
    global exp_matrix, gene_names, tf_matrix, tf_matrix_gene_names, method_params, seed
    # init target params
    target_gene_name = gene_names[target_gene_index]
    target_gene_expression = exp_matrix[:, target_gene_index]
    # infer partial network
    n = infer_partial_network(
        regressor_type = method_params[0],
        regressor_kwargs = method_params[1],
        tf_matrix = tf_matrix,
        tf_matrix_gene_names = tf_matrix_gene_names,
        target_gene_name = target_gene_name,
        target_gene_expression = target_gene_expression,
        include_meta = False,
        early_stop_window_length = EARLY_STOP_WINDOW_LENGTH,
        seed = seed
    )
    return n

# def infer_grn func
def infer_grn(sce_fname, tf_names, method = "grnboost2", num_workers = 32, sparse = False, rand_seed = 0):
    # set global
    global exp_matrix, gene_names, tf_matrix, tf_matrix_gene_names, method_params, seed
    seed = rand_seed
    # get exp_matrix & gene_names
    start_time = time.time()
    exp_matrix = load_exp_matrix(sce_fname, transpose = True, return_sparse = sparse)
    if sparse:
        gene_names = exp_matrix[1]
        exp_matrix = exp_matrix[0]
    else:
        gene_names = exp_matrix.columns
    end_time = time.time()
    print(f'Loaded expression matrix of {exp_matrix.shape[0]} cells and {exp_matrix.shape[1]} genes in {end_time - start_time} seconds...', file=sys.stdout)
    # prepare input
    exp_matrix, gene_names, tf_names = _prepare_input(exp_matrix, gene_names, tf_names)
    tf_matrix, tf_matrix_gene_names = to_tf_matrix(exp_matrix, gene_names, tf_names)
    # set method_params
    if (method == "grnboost2"):
        method_params = [
            "GBM",      # regressor_type
            SGBM_KWARGS # regressor_kwargs
        ]
    else:
        method_params = [
            "RF",       # regressor_type
            RF_KWARGS   # regressor_kwargs
        ]
    # start infer_grn
    print(f"starting {method} using {num_workers} processes...", file = sys.stdout)
    start_time = time.time()
    with Pool(num_workers) as p:
        adjs = list(tqdm.tqdm(
            p.imap(infer_partial_grn, target_gene_indices(gene_names, target_genes = "all"), chunksize = 1),
            total = len(gene_names)
        ))
    # concat adj
    adj = pd.concat(adjs).sort_values(by = "importance", ascending = True)
    end_time = time.time()
    print(f"Done in {end_time - start_time} seconds.", file = sys.stdout)
    return adj

