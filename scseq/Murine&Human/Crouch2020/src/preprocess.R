##################################
# Created on 21:31, Dec. 7th, 2020
# Author: fassial
# Filename: preprocess.R
##################################
# dep
library(Seurat)
# local dep
DIR.ROOT <- file.path(getwd())
source(file.path(DIR.ROOT, "scseq.Rh"))
source(file.path(DIR.UTILS, "utils.Rh"))

# macro
DIR.DATA <- file.path(DIR.ROOT, "Crouch2020", "data")
FILE.DATA <- file.path(DIR.DATA, "exprMatrix.tsv")

# read dataset
cells <- read.table(FILE.DATA); print(dim(cells))

## quality control
# set qc.params
qc.params <- list(
    # mito(mito rate)
    mito.maxrate = 0.10*100, mito.pattern = "^MT",
    # nexprs(genes expressed in this cell)
    nexprs.maxnum = Inf, nexprs.minnum = 1000,
    # ncells(cells expressed this gene)
    ncells.minnum = 3, ncells.minrate = 0
)

