###################################
# Created on 11:30, Dec. 15th, 2020
# Author: fassial
# Filenames: scseq.R
###################################
# dep
# local dep
DIR.ROOT <- file.path(getwd())
source(file.path(DIR.ROOT, "scseq.Rh"))

# macro

# def scseq.standard func
scseq.standard <- function(cells, params = list(
    default.assay = "RNA",
    nfeatures = 2000,
    dims = 1:50,
    resolution = 0.5
)) {
    # get cells.stand
    cells.stand <- cells

    # scseq standard workflow
    DefaultAssay(cells.stand) <- params$default.assay
    if (params$default.assay == "RNA") {
        # only for RNA
        cells.stand <- NormalizeData(cells.stand)
        cells.stand <- FindVariableFeatures(cells.stand,
            selection.method = "vst",
            nfeatures = params$nfeatures
        )
    }
    cells.stand <- ScaleData(cells.stand,
        features = rownames(cells.stand)
    )
    cells.stand <- RunPCA(cells.stand,
        features = VariableFeatures(object = cells.stand)
    )
    cells.stand <- FindNeighbors(cells.stand,
        dims = params$dims
    )
    cells.stand <- FindClusters(cells.stand,
        resolution = params$resolution
    )
    cells.stand <- RunUMAP(cells.stand,
        dims = params$dims
    )

    return(cells.stand)
}

# def scseq.integrate func
scseq.integrate <- function(cells, params = list(
    nfeatures = 2000,
    dims = 1:50,
    resolution = 0.5
)) {
    # setup integration object
    cells.list <- SplitObject(cells, split.by = "group")
    cells.list <- lapply(X = cells.list, FUN = function(x) {
        x <- NormalizeData(x)
        x <- FindVariableFeatures(x,
            selection.method = "vst",
            nfeatures = params$nfeatures
        )
    })

    # perform integration
    cells.anchors <- FindIntegrationAnchors(
        object.list = cells.list,
        dims = params$dims
    )
    cells.int <- IntegrateData(
        anchorset = cells.anchors,
        dims = params$dims
    )

    # scseq standard workflow
    DefaultAssay(cells.int) <- "integrated"
    cells.int <- scseq.standard(
        cells = cells.int,
        params = list(
            default.assay = "RNA",
            nfeatures = params$nfeatures,
            dims = params$dims,
            resolution = params$resolution
        )
    )

    return(cells.int)
}
