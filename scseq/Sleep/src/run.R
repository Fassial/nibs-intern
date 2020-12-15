###################################
# Created on 11:39, Dec. 15th, 2020
# Author: fassial
# Filename: run.R
###################################
# dep
library(Seurat)
# local dep
DIR.ROOT <- file.path(getwd())
source(file.path(DIR.ROOT, "scseq.Rh"))
source(file.path(DIR.SRC, "scseq.R"))

# macro
FILE.DATA.CELLS <- file.path(DIR.DATA, "cells.integrated.rds")
FILE.OUTPUT.CELLS.PURGE <- file.path(DIR.OUTPUT, "cells.purge.rds")
FILE.OUTPUT.CELLS.PURGE.INT <- file.path(DIR.OUTPUT, "cells.purge.int.rds")

# mkdir
if (!dir.exists(DIR.FIG)) dir.create(DIR.FIG)
if (!dir.exists(DIR.OUTPUT)) dir.create(DIR.OUTPUT)

# get cells.purge
if (file.exists(FILE.OUTPUT.CELLS.PURGE)) {
    # read output.cells.purge
    cells.purge <- readRDS(FILE.OUTPUT.CELLS.PURGE)
} else {
    # read dataset
    cells <- readRDS(FILE.DATA.CELLS)

    # discard mito & rp[sl] genes
    discard.genes <- grepl(pattern = "^Rp[sl]\\d+", rownames(cells))
    discard.genes <- discard.genes | grepl(pattern = "^Rp[sl]p", rownames(cells))
    discard.genes <- discard.genes | grepl(pattern = "^mt-", rownames(cells))
    # get cells.purge
    cells.purge <- cells[!discard.genes, ]

    # scseq standard workflow
    cells.purge <- scseq.standard(
        cells = cells.purge,
        params = list(
            default.assay = "RNA",
            nfeatures = 2000,
            dims = 1:50,
            resolution = 0.5
        )
    )
    # save cells.purge
    saveRDS(cells.purge,
        file = FILE.OUTPUT.CELLS.PURGE
    )
}
# gen fig1
fig1 <- DimPlot(cells.purge, label = TRUE)
fig1 <- fig1 + FeaturePlot(cells.purge, features = "Hexb"); fig1

# get cells.purge.int
if (file.exists(FILE.OUTPUT.CELLS.PURGE.INT)) {
    # read output.cells.purge.int
    cells.purge.int <- readRDS(FILE.OUTPUT.CELLS.PURGE.INT)
} else {
    # scseq integrate workflow
    cells.purge.int <- scseq.integrate(
        cells = cells.purge,
        params = list(
            nfeatures = 2000,
            dims = 1:50,
            resolution = 0.5
        )
    )
    # save cells.purge.int
    saveRDS(cells.purge.int,
        file = FILE.OUTPUT.CELLS.PURGE.INT
    )
}
# gen fig2
fig2 <- DimPlot(cells.purge.int, label = TRUE)
fig2 <- fig2 + FeaturePlot(cells.purge.int, features = "Hexb"); fig2
