##################################
# Created on 17:28, Nov. 1st, 2020
# Author: fassial
# Filename: run.R
##################################
# dep
# local dep
source("load_dataset.R")
source("preprocess.R")
source("scseq.R")

# load dataset
scs.unfiltered <- load_dataset()
# preprocess
scs.list <- preprocess(scs.unfiltered = scs.unfiltered)
# scseq
scs.tsne <- scseq(scs.list = scs.list)
# plot
DimPlot(scs.tsne, reduction = "tsne")

