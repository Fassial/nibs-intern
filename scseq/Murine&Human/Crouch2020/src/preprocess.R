##################################
# Created on 21:31, Dec. 7th, 2020
# Author: fassial
# Filename: preprocess.R
##################################
# dep
library(Seurat)
library(data.table)
# local dep
DIR.ROOT <- file.path(getwd())
source(file.path(DIR.ROOT, "scseq.Rh"))
source(file.path(DIR.UTILS, "utils.Rh"))

# macro
DIR.DATA <- file.path(DIR.ROOT, "Crouch2020", "data")
FILE.DATA <- file.path(DIR.DATA, "exprMatrix.tsv.gz")
FILE.METADATA <- file.path(DIR.DATA, "meta.tsv")
DIR.OUTPUT <- file.path(DIR.ROOT, "Crouch2020", "outputs")
if (!dir.exists(DIR.OUTPUT)) dir.create(DIR.OUTPUT)

## read dataset
# read dataset & metadata
cells <- data.table::fread(FILE.DATA); cells <- as.data.frame(cells)
cells.metadata <- data.table::fread(FILE.METADATA); cells.metadata <- as.data.frame(cells.metadata)
# rename rownames
rownames(cells) <- cells[,1]; cells <- cells[,-1]
rownames(cells.metadata) <- cells.metadata[,1]; cells.metadata <- cells.metadata[,-1]
print(dim(cells))
# create seurat obj
## with Warning:
# Warning: Feature names cannot have underscores ('_'), replacing with dashes ('-')
# Warning: Feature names cannot have pipe characters ('|'), replacing with dashes ('-')
cells.seurat <- Seurat::CreateSeuratObject(
    counts = as.matrix(cells),
    project = "Crouch2020"
)
# add metadata
cells.seurat <- Seurat::AddMetaData(
    object = cells.seurat,
    metadata = cells.metadata
)

## quality control
# set qc.params
qc.params <- list(
    # mito(mito rate)
    mito.maxrate = 0.10*100, mito.pattern = "^MT",
    # nexprs(genes expressed in this cell)
    nexprs.maxnum = Inf, nexprs.minnum = 500,
    # ncells(cells expressed this gene)
    ncells.minnum = 3, ncells.minrate = 0
)
# exe qc
cells.filtered <- qc(
    cells = cells.seurat,
    qc.params = qc.params
); print(dim(cells.filtered))

## scseq workflow
# wrap data
## with Warning:
# Warning: Feature names cannot have underscores ('_'), replacing with dashes ('-')
# Warning: Feature names cannot have pipe characters ('|'), replacing with dashes ('-')
cells.seurat <- Seurat::as.Seurat(
    x = cells.filtered,
    counts = "counts",
    data = "logcounts",
    assay = "RNA",
    project = "Crouch2020"
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
); Seurat::DimPlot(cells.umap, reduction = "umap")
# save rds
save_rds(
    scs = cells.umap,
    filepath = file.path(DIR.OUTPUT, "cells.umap.rds")
)

## figs
## fig 1
fig1 <- Seurat::DimPlot(cells.umap, group.by = "Sort")
## fig 2
# select cells
cells.endo.names <- Seurat::CellSelector(fig1)
cells.endo <- cells.umap[,cells.endo.names]
# find clusters
cells.endo.clusters <- Seurat::FindClusters(
    object = Seurat::FindNeighbors(
        object = cells.endo,
        dims = 1:50
    ),
    resolution = 0.5
); fig2 <- Seurat::DimPlot(cells.endo.clusters, reduction = "umap")
# save rds
save_rds(
    scs = cells.endo.clusters,
    filepath = file.path(DIR.OUTPUT, "cells.endo.clusters.rds")
)
## fig 3
fig3 <- Seurat::FeaturePlot(cells.endo.clusters, features = "GSDMD-GSDMD")
## fig 4
fig4 <- Seurat::FeaturePlot(cells.endo.clusters, features = "CASP4-CASP4")
