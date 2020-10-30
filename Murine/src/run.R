###################################
# Created on 17:22, Oct. 30th, 2020
# Author: fassial
# Filename: scseq.R
###################################
# dep
# local dep
source("scseq.R")

# macro
# dataset
DATASET <- file.path(getwd(), "..", "data")
DATASET.Kalucka2020 <- file.path(DATASET, "Kalucka2020")
DATASET.Vanlandewijck2018 <- file.path(DATASET, "Vanlandewijck2018")
# output
OUTPUT <- file.path(getwd(), "..", "output")
if (!dir.exists(OUTPUT)) dir.create(OUTPUT)
OUTPUT.Kalucka2020 <- file.path(OUTPUT, "Kalucka2020.rds")
OUTPUT.Vanlandewijck2018 <- file.path(OUTPUT, "Vanlandewijck2018.rds")

# define single cell expr
sc_expr <- function(raw.df, output.rds) {
    # preprocess
    sce.filtered <- preprocess(raw.df = raw.df)
    # wrap data
    sce.seurat <- wrap_seurat(sce = sce.filtered)
    # normalization
    sce.norm <- normalization(scs = sce.seurat)
    # feature selection
    sce.fs <- feature_selection(scs = sce.norm)
    # dim reduction
    sce.dimred <- dim_reduction(scs = sce.fs)
    # clustering
    sce.clusters <- clustering(scs = sce.dimred)
    # save rds
    save_rds(scs = sce.clusters, filepath = output.rds)
    # plot
    DimPlot(sce.clusters, reduction = "umap")
}

# Kalucka2020_expr
# data.Kalucka2020 <- combine_dataset(DATASET.Kalucka2020); print(dim(data.Kalucka2020))
# sc_expr(raw.df = data.Kalucka2020, output.rds = OUTPUT.Kalucka2020)
# Vanlandewijck2018_expr
data.Vanlandewijck2018 <- get_dataset(file.path(DATASET.Vanlandewijck2018, "GSE98816_Brain_samples_raw_read_counts_matrix.txt")); print(dim(data.Vanlandewijck2018))
sc_expr(raw.df = data.Vanlandewijck2018, output.rds = OUTPUT.Vanlandewijck2018)

