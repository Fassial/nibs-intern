library(Seurat)
library(dplyr)

dir_QC = '/Users/Ray/Documents/Work/scRNAseq/yanting/pituitary_scRNAseq_analysis/QC/'
dir_out = '/Users/Ray/Documents/Work/scRNAseq/yanting/pituitary_scRNAseq_analysis/shiny/data/'

cells <- readRDS(file.path(dir_QC,'cells.seurat_short.rds'))

## Integrated analysis
# Split by stim
cells.list <- SplitObject(cells, split.by = 'stim')
# Normalize, feature selection by each stim
for (i in 1:length(cells.list)){
  cells.list[[i]] <- NormalizeData(cells.list[[i]], verbose = TRUE)
  cells.list[[i]] <- FindVariableFeatures(cells.list[[i]], selection.method = "vst", nfeatures = 2000, verbose = TRUE)
}
# Find anchors
cells.anchors.dim50 <- FindIntegrationAnchors(object.list = cells.list, dims = 1:50, k.filter = 160) # dims and k.filter are tunable parameters
# Integrate data
cells <- IntegrateData(anchorset = cells.anchors.dim50, dims = 1:50)
# Standard Seurat pipeline on integrated space
DefaultAssay(cells) <- 'integrated'
# Data scaling
cells <- ScaleData(cells)
# Linear dimensional reduction
cells <- RunPCA(cells, npcs = 60)
# Non-linear dimensional reduction (Note that in integrated pipeline, the step for constructing SNN graph was shifted after RunUMAP)
cells <- RunUMAP(cells, reduction = "pca", dims = 1:50, umap.method = 'umap-learn', metric = 'correlation', 
                 reduction.key = "UMAPint_", reduction.name = "umap.int")
cells <- RunTSNE(cells, reduction = "pca", dims = 1:50, reduction.key = "TSNEint_", reduction.name = "tsne.int")
# Construct SNN graph
cells <- FindNeighbors(cells, reduction = 'pca', k.param = 20, dims = 1:50)
# Louvain clustering
cells <- FindClusters(cells, resolution = 0.3)

cells <- RenameIdents(cells, `0`="Somatotropes", `1`="Lactotropes",`2`="Corticotropes",`3`="Mixed unknown",
                                       `4`="Somatotropes",`5`="Gonadotropes",`6`="Melanotropes",`7`="Somatotropes",`8`="Endothelial cells",
                                       `9`="Thyrotropes",`10`="Pou1f1 progenitors",`11`="Red blood cells",`12`="Stem cells", 
                                       `13`="White blood cells")
cells[["cell_type"]] <- Idents(cells)

## Standard seurat pipe (no integration)
# Set assay type
DefaultAssay(cells) <- "RNA"
# Normalization
cells <- NormalizeData(cells, normalization.method = "LogNormalize", scale.factor = 1e4)
# Feature selection
cells <- FindVariableFeatures(cells, selection.method = "vst", nfeatures = 2000, verbose = TRUE)
# Data scaling
cells <- ScaleData(cells)  # Size of `cells dramatically increases if we specify `features = all.genes` (as in Exploratory Analysis pipeline), remove the option here.
# Linear dimensional reduction
cells <- RunPCA(cells, features = VariableFeatures(object = cells), npcs = 60)
# Determined dimensionality of the dataset: 50
# Construct Shared Nearest Neighbor (SNN) Graph
cells <- FindNeighbors(cells, dims = 1:50)
# # Clustering with Louvain method (probably not needed)
# cells <- FindClusters(cells, resolution = 0.3)
# Non-linear dimensional reduction
cells <- RunUMAP(cells, dims = 1:50, umap.method = 'umap-learn', metric = 'correlation', reduction.key = "UMAP_",reduction.name = "umap")
cells <- RunTSNE(cells, dims = 1:50, reduction.key = "TSNE_", reduction.name = "tsne")

saveRDS(object = cells, file = file.path(dir_out, "cells_preprocessed.rds"))
# cells <- readRDS(file = file.path(dir_out, 'cells_small.rds'))
