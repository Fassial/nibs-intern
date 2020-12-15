###################################
# Created on 20:12, Oct. 29th, 2020
# Author: fassial
# Filename: scseq.R
###################################
# dep
library(Seurat)
# local dep

# wrap seurat
wrap_seurat <- function(sce, project = "murine") {
    # create seurat
    scs <- CreateSeuratObject(
        counts = counts(sce),
        project = project,
        min.cells = 3,
        min.features = 200
    )
    return(scs)
}

# normalization
normalization <- function(scs) {
    # gen normalization
    scs.norm <- NormalizeData(scs)
    return(scs.norm)
}

# feature selection
feature_selection <- function(scs) {
    scs.fs <- FindVariableFeatures(scs,
        selection.method = "vst",
        nfeatures = 2000
    )
    return(scs.fs)
}

# dim reduction
dim_reduction <- function(scs, ncomponents = 10) {
    # scale data
    scs.scale <- ScaleData(scs,
        features = rownames(scs)
    )
    # dim reduction(PCA)
    scs.dr <- RunPCA(scs.scale,
        features = VariableFeatures(object = scs.scale)
    )
    return(scs.dr)
}

# clustering
clustering <- function(scs, dims = 1:10, resolution = 0.5) {
    # graph-based cluster
    scs.neigh <- FindNeighbors(scs, dims = dims)
    scs.clusters <- FindClusters(scs.neigh,
        resolution = resolution
    )
    # umap visulize
    scs.umap <- RunUMAP(scs.clusters,
        dims = dims
    )
    return(scs.umap)
}

# save rds
save_rds <- function(scs, filepath) {
    saveRDS(scs,
        file = filepath
    )
    return
}

