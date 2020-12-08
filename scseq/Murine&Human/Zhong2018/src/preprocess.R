##################################
# Created on 16:42, Dec. 6th, 2020
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
DIR.DATA <- file.path(DIR.ROOT, "Zhong2018", "data")
FILE.DATA <- file.path(DIR.DATA, "GSE104276_all_pfc_2394_UMI_count_NOERCC.xls")

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
# exe qc
cells.filtered <- qc(
    raw.df = cells,
    qc.params = qc.params
); print(dim(cells.filtered))

## scseq workflow
# wrap data
cells.seurat <- Seurat::CreateSeuratObject(
    counts = counts(cells.filtered),
    project = "marine"
)
# log-normalize
cells.norm <- Seurat::NormalizeData(
    object = cells.seurat,
    normalization.method = "LogNormalize",
    scale.factor = 10000
)
# feature selection
cells.fs <- Seurat::FindVariableFeatures(
    object = cells.norm,
    selection.method = "vst",
    nfeatures = 2500
)
# cell cycle score(cc)
# scale data
cells.scale <- Seurat::ScaleData(
    object = cells.fs,
    features = rownames(cells.fs)
)
# dim reduction
cells.dr <- Seurat::RunPCA(
    object = cells.scale,
    features = VariableFeatures(object = cells.scale)
)
# umap visualize
cells.umap <- Seurat::RunUMAP(
    object = cells.dr,
    dims = 1:50
); DimPlot(cells.umap, reduction = "umap")
# find clusters
cells.clusters <- Seurat::FindClusters(
    object = Seurat::FindNeighbors(
        object = cells.umap,
        dims = 1:50
    ),
    resolution = 10
); DimPlot(cells.clusters, reduction = "umap")
# find markers to identify cell-type
# TODO
# select subset
cells.subset <- cells.clusters[,cells.clusters@meta.data$seurat_clusters==1]
# find subset clusters
cells.subset.clusters <- Seurat::FindClusters(
    object = Seurat::FindNeighbors(
        object = cells.subset,
        dims = 1:50
    ),
    resolution = 0.8
); DimPlot(cells.subset.clusters, reduction = "umap")

