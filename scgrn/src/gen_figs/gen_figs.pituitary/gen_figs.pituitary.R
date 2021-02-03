###################################
# Created on 09:49, Feb. 3rd, 2020
# Author: fassial
# Filenames: gen_figs.pituitary.R
###################################
# dep
library(Seurat)
# local dep

# macro
# macro for expr
EXPR.CURR <- "pituitary"
SEED.CURR <- 0
# macro for path
DIR.ROOT <- file.path(getwd(), "..", "..", "..")
DIR.SRC <- file.path(DIR.ROOT, "src")
DIR.DATA <- file.path(DIR.ROOT, "data")
FILE.DATA.METADATA <- file.path(DIR.DATA, paste0("cells.", EXPR.CURR, ".metadata.csv"))
DIR.OUTPUT <- file.path(DIR.ROOT, paste0("output.", EXPR.CURR))
DIR.OUTPUT.SEED <- file.path(DIR.OUTPUT, paste0("seed-", SEED.CURR))
DIR.FIGS <- file.path(DIR.SRC, "gen_figs", paste0("gen_figs.", EXPR_CURR), "figures")
# macro for data
FILE.AUCMTX <- file.path(DIR.OUTPUT.SEED, "auc-mtx.csv")
FILE.AUCBIN <- file.path(DIR.OUTPUT.SEED, "auc-bin.csv")

# def auc.standard func
auc.standard <- function(cells, params = list(
    default.assay = "RNA",
    nfeatures = 2000,
    dims = 1:50,
    resolution = 0.5,
    n.epochs = 500
)) {
    # get cells.stand
    cells.stand <- cells

    # auc standard workflow
    DefaultAssay(cells.stand) <- params$default.assay
    if (params$default.assay == "RNA") {
        # only for RNA
        cells.stand <- Seurat::NormalizeData(cells.stand)
        cells.stand <- Seurat::FindVariableFeatures(cells.stand,
            selection.method = "vst",
            nfeatures = params$nfeatures
        )
    }
    cells.stand <- Seurat::ScaleData(cells.stand,
        features = rownames(cells.stand)
    )
    cells.stand <- Seurat::RunPCA(cells.stand,
        features = VariableFeatures(object = cells.stand)
    )
    cells.stand <- Seurat::FindNeighbors(cells.stand,
        dims = params$dims
    )
    cells.stand <- Seurat::FindClusters(cells.stand,
        resolution = params$resolution
    )
    cells.stand <- Seurat::RunUMAP(cells.stand,
        dims = params$dims,
        n.epochs = params$n.epochs
    )

    return(cells.stand)
}

# def _gen_figs func
_gen_figs <- function(auc.seurat, fig.prefix, params = list(
    resolution.som = 0.5,
    resolution.cort = 0.5,
    resolution.lac = 0.5,
    resolution.gonad = 0.5,
    resolution.thyro = 0.5,
    n.epochs.som = 500,
    n.epochs.cort = 500,
    n.epochs.lac = 500,
    n.epochs.gonad = 500,
    n.epochs.thyro = 500
)) {
    # subset saline & lps seurat
    auc.sallps <- auc.seurat[,(auc.seurat@meta.data$treat=="Saline")|(auc.seurat@meta.data$treat=="LPS")]
    # subset Som & Cort $ Lac & Gonad & Thyro
    auc.som <- auc.sallps[,(auc.sallps@meta.data$cell_type_brief=="Som")]
    auc.cort <- auc.sallps[,(auc.sallps@meta.data$cell_type_brief=="Cort")]
    auc.lac <- auc.sallps[,(auc.sallps@meta.data$cell_type_brief=="Lac")]
    auc.gonad <- auc.sallps[,(auc.sallps@meta.data$cell_type_brief=="Gonad")]
    auc.thyro <- auc.sallps[,(auc.sallps@meta.data$cell_type_brief=="Thyro")]
    # auc standard for subsets
    auc.som <- auc.standard(cells = auc.som, params = list(
        default.assay = "RNA",
        nfeatures = 2000,
        dims = 1:50,
        resolution = params$resolution.som,
        n.epochs = params$n.epochs.som
    )); Seurat::DimPlot(auc.som)
    auc.cort <- auc.standard(cells = auc.cort, params = list(
        default.assay = "RNA",
        nfeatures = 2000,
        dims = 1:50,
        resolution = params$resolution.cort,
        n.epochs = params$n.epochs.cort
    )); Seurat::DimPlot(auc.cort)
    auc.lac <- auc.standard(cells = auc.lac, params = list(
        default.assay = "RNA",
        nfeatures = 2000,
        dims = 1:50,
        resolution = params$resolution.lac,
        n.epochs = params$n.epochs.lac
    )); Seurat::DimPlot(auc.lac)
    auc.gonad <- auc.standard(cells = auc.gonad, params = list(
        default.assay = "RNA",
        nfeatures = 2000,
        dims = 1:50,
        resolution = params$resolution.gonad,
        n.epochs = params$n.epochs.gonad
    )); Seurat::DimPlot(auc.gonad)
    auc.thyro <- auc.standard(cells = auc.thyro, params = list(
        default.assay = "RNA",
        nfeatures = 2000,
        dims = 1:50,
        resolution = params$resolution.thyro,
        n.epochs = params$n.epochs.thyro
    )); Seurat::DimPlot(auc.thyro)
    # gen figs for subsets
    # TODO
}

# def gen_figs func
gen_figs <- function() {
    # read auc.mtx & auc.bin
    auc.mtx <- read.csv(FILE.AUCMTX,
        sep = ",",
        row.names = 1,
        check.names = FALSE
    ); auc.mtx <- t(as.matrix(auc.mtx))
    auc.bin <- read.csv(FILE.AUCBIN,
        sep = ",",
        row.names = 1,
        check.names = FALSE
    ); auc.bin <- t(as.matrix(auc.bin))
    # read metadata
    metadata <- read.csv(FILE.DATA.METADATA,
        sep = ",",
        row.names = 1,
        check.names = FALSE
    )
    # create seurat obj & add metadata
    auc.mtx.seurat <- Seurat::AddMetaData(
        object = Seurat::CreateSeuratObject(counts = auc.mtx, project = "auc.mtx"),
        metadata = metadata
    )
    auc.bin.seurat <- Seurat::AddMetaData(
        object = Seurat::CreateSeuratObject(counts = auc.bin, project = "auc.bin"),
        metadata = metadata
    )
    # gen figs for auc.mtx & auc.bin
    _gen_figs(auc.seurat = auc.mtx.seurat, fig.prefix = "auc.mtx", params = list(
        resolution.som = 0.1,
        resolution.cort = 0.5,
        resolution.lac = 0.5,
        resolution.gonad = 0.5,
        resolution.thyro = 0.7,
        n.epochs.som = 1000,
        n.epochs.cort = 500,
        n.epochs.lac = 1000,
        n.epochs.gonad = 1500,
        n.epochs.thyro = 800
    ))
    _gen_figs(auc.seurat = auc.bin.seurat, fig.prefix = "auc.bin", params = list(
        resolution.som = 0.05,
        resolution.cort = 0.5,
        resolution.lac = 0.2,
        resolution.gonad = 0.5,
        resolution.thyro = 1.0,
        n.epochs.som = 1000,
        n.epochs.cort = 500,
        n.epochs.lac = 1000,
        n.epochs.gonad = 1000,
        n.epochs.thyro = 1000
    ))
}

# gen figs
gen_figs()

