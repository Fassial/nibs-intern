###################################
# Created on 17:22, Oct. 30th, 2020
# Author: fassial
# Filename: scseq.R
###################################
# dep
library(tools)
library(gdata)
library(miceadds)
# local dep
source("scseq.R")

# macro
# dataset
DATASET <- file.path(getwd(), "..", "data")
DATASET.Kalucka2020 <- file.path(DATASET, "Kalucka2020")
DATASET.Vanlandewijck2018 <- file.path(DATASET, "Vanlandewijck2018")
DATASET.LaManno2018 <- file.path(DATASET, "LaManno2018")
DATASET.Zhong2018 <- file.path(DATASET, "Zhong2018")
# output
OUTPUT <- file.path(getwd(), "..", "output")
if (!dir.exists(OUTPUT)) dir.create(OUTPUT)
OUTPUT.Kalucka2020 <- file.path(OUTPUT, "Kalucka2020.rds")
OUTPUT.Vanlandewijck2018 <- file.path(OUTPUT, "Vanlandewijck2018.rds")
OUTPUT.LaManno2018 <- file.path(OUTPUT, "LaManno2018")
OUTPUT.Zhong2018 <- file.path(OUTPUT, "Zhong2018.rds")

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

    return(sce.clusters)
}

# Kalucka2020_expr
# data.Kalucka2020 <- combine_dataset(DATASET.Kalucka2020); print(dim(data.Kalucka2020))
# data.Kalucka2020.clusters <- sc_expr(raw.df = data.Kalucka2020, output.rds = OUTPUT.Kalucka2020)
# DimPlot(data.Kalucka2020.clusters, reduction = "umap")
# Vanlandewijck2018_expr
# data.Vanlandewijck2018 <- get_dataset(file.path(DATASET.Vanlandewijck2018, "GSE98816_Brain_samples_raw_read_counts_matrix.txt")); print(dim(data.Vanlandewijck2018))
# data.Vanlandewijck2018.clusters <- sc_expr(raw.df = data.Vanlandewijck2018, output.rds = OUTPUT.Vanlandewijck2018)
# DimPlot(data.Vanlandewijck2018.clusters, reduction = "umap")
# LaManno2018 expr
if (!dir.exists(OUTPUT.LaManno2018)) dir.create(OUTPUT.LaManno2018)
for (file in list.files(path = DATASET.LaManno2018, pattern = "*.RData")) {
    # read data
    load.Rdata(file.path(DATASET.LaManno2018, file), "data.LaManno2018"); print(dim(data.LaManno2018))
    data.LaManno2018.clusters <- sc_expr(raw.df = data.LaManno2018, output.rds = file.path(OUTPUT.LaManno2018, paste0(file_path_sans_ext(file), ".rds")))
    DimPlot(data.LaManno2018.clusters, reduction = "umap")
}
load.Rdata(file.path(DATASET.LaManno2018, "SRA646572_SRS2833946.sparse.RData"), "data.LaManno2018"); print(dim(data.LaManno2018))
data.LaManno2018.clusters <- sc_expr(raw.df = data.LaManno2018, output.rds = file.path(OUTPUT.LaManno2018, paste0("SRA646572_SRS2833946.sparse", ".rds")))
DimPlot(data.LaManno2018.clusters, reduction = "umap")
# Zhong2018 expr
# data.Zhong2018 <- read.table(file.path(DATASET.Zhong2018, "GSE104276_all_pfc_2394_UMI_count_NOERCC.xls")); print(dim(data.Zhong2018))
# data.Zhong2018.clusters <- sc_expr(raw.df = data.Zhong2018, output.rds = OUTPUT.Zhong2018)
# DimPlot(data.Zhong2018.clusters, reduction = "umap")

