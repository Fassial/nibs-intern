##################################
# Created on 17:28, Nov. 1st, 2020
# Author: fassial
# Filename: scseq.R
##################################
# dep
# local dep

# macro
RESULTS <- file.path(getwd(), "..", "results")
if (!dir.exists(RESULTS)) {dir.create(RESULTS)}
RESULTS.Chen2020 <- file.path(RESULTS, "Chen2020.rds")

# def scseq func
scseq <- function(scs.list) {
    # normalization & feature selection & scale
    for (i in 1:length(scs.list)) {
        scs.list[[i]] <- NormalizeData(scs.list[[i]],
            normalization.method = "LogNormalize",
            scale.factor = 10000
        )
        scs.list[[i]] <- FindVariableFeatures(scs.list[[i]],
            selection.method = "vst",
            nfeatures = 1000,
            verbose = TRUE
        )
        scs.list[[i]] <- ScaleData(scs.list[[i]],
            features = rownames(scs.list[[i]])
        )
    }
    # integration anchors
    scs.anchors <- FindIntegrationAnchors(object.list = scs.list, dims = 1:10)
    scs.integrated <- IntegrateData(anchorset = scs.anchors, dims = 1:10)
    # switch to integrated assay. The variable features of this assay are automatically
    # set during IntegrateData
    DefaultAssay(scs.integrated) <- "integrated"
    # Run the standard workflow for visualization and clustering
    scs.integrated <- ScaleData(scs.integrated, verbose = FALSE)
    scs.integrated <- RunPCA(scs.integrated, npcs = 20, verbose = FALSE)
    scs.integrated <- RunUMAP(scs.integrated, reduction = "pca", dims = 1:20)
    # DimPlot(scs.integrated, reduction = "umap", group.by = "treat")
    # dim reduction
    scs.dr <- FindNeighbors(scs.integrated, reduction = "pca", dims = 1:20)
    scs.dr <- FindClusters(scs.dr, resolution = 0.1)
    # umap
    # scs.umap <- RunUMAP(scs.dr, reduction = "pca", dims = 1:20)
    # DimPlot(scs.umap, reduction = "umap")
    # tsne
    scs.tsne <- RunTSNE(scs.dr, reduction = "pca", dims = 1:20)
    # DimPlot(scs.tsne, reduction = "tsne")
    # save rds
    saveRDS(scs.tsne,
        file = RESULTS.Chen2020
    )
    return(scs.tsne)
}

