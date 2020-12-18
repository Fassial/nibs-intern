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
FILE.OUTPUT.CELLS.PURGE.CEL.4 <- file.path(DIR.OUTPUT, "cells.purge.cel.4.rds")
FILE.OUTPUT.CELLS.PURGE.CEL.20 <- file.path(DIR.OUTPUT, "cells.purge.cel.20.rds")
FILE.OUTPUT.CELLS.PURGE.CEL.4.MGLA <- file.path(DIR.OUTPUT, "cells.purge.cel.4.mgla.rds")
FILE.OUTPUT.CELLS.PURGE.CEL.20.MGLA <- file.path(DIR.OUTPUT, "cells.purge.cel.20.mgla.rds")
FILE.OUTPUT.CELLS.PURGE.CEL.4.MGLA.INT <- file.path(DIR.OUTPUT, "cells.purge.cel.4.mgla.int.rds")
FILE.OUTPUT.CELLS.PURGE.CEL.20.MGLA.INT <- file.path(DIR.OUTPUT, "cells.purge.cel.20.mgla.int.rds")

# mkdir
if (!dir.exists(DIR.FIG)) dir.create(DIR.FIG)
if (!dir.exists(DIR.OUTPUT)) dir.create(DIR.OUTPUT)

## Lab 1: sep integrate data with group(3/4)
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
    # add meta.data$celsius
    celsius.4 <- ((cells.purge@meta.data$group == "MGC1")
                | (cells.purge@meta.data$group == "MG601")
                | (cells.purge@meta.data$group == "MG4831"))
    celsius.20 <-((cells.purge@meta.data$group == "MGC2")
                | (cells.purge@meta.data$group == "MG602")
                | (cells.purge@meta.data$group == "MG4832")
                | (cells.purge@meta.data$group == "MG4801"))
    celsius <- array("0", dim = dim(cells.purge)[2])
    celsius[celsius.4] <- "4"; celsius[celsius.20] <- "20"
    celsius <- as.data.frame(celsius); rownames(celsius) <- colnames(cells.purge)
    cells.purge <- Seurat::AddMetaData(
        object = cells.purge,
        metadata = celsius
    )
    # save cells.purge
    saveRDS(cells.purge,
        file = FILE.OUTPUT.CELLS.PURGE
    )
}
# gen fig1
fig1 <- Seurat::DimPlot(cells.purge, label = TRUE)
fig1 <- fig1 + Seurat::FeaturePlot(cells.purge, features = "Hexb"); fig1

# get cells.purge.cel.4 & cells.purge.cel.20
if (file.exists(FILE.OUTPUT.CELLS.PURGE.CEL.4)) {
    # read output.cells.purge.cel.4
    cells.purge.cel.4 <- readRDS(FILEOUTPUT.CELLS.PURGE.CEL.4)
} else {
    # get cells.purge.cel.4
    cells.purge.cel.4 <- cells.purge[,(cells.purge@meta.data$celsius=="4")]
    # scseq standard workflow
    cells.purge.cel.4 <- scseq.standard(
        cells = cells.purge.cel.4,
        params = list(
            default.assay = "RNA",
            nfeatures = 2000,
            dims = 1:50,
            resolution = 0.5
        )
    )
    # save cells.purge.cel.4
    saveRDS(cells.purge.cel.4,
        file = FILE.OUTPUT.CELLS.PURGE.CEL.4
    )
}
# gen fig2
fig2 <- Seurat::DimPlot(cells.purge.cel.4, label = TRUE)
fig2 <- fig2 + Seurat::FeaturePlot(cells.purge.cel.4, features = "Hexb"); fig2
if (file.exists(FILE.OUTPUT.CELLS.PURGE.CEL.20)) {
    # read output.cells.purge.cel.20
    cells.purge.cel.20 <- readRDS(FILEOUTPUT.CELLS.PURGE.CEL.20)
} else {
    # get cells.purge.cel.20
    cells.purge.cel.20 <- cells.purge[,(cells.purge@meta.data$celsius=="20")]
    # scseq standard workflow
    cells.purge.cel.20 <- scseq.standard(
        cells = cells.purge.cel.20,
        params = list(
            default.assay = "RNA",
            nfeatures = 2000,
            dims = 1:50,
            resolution = 0.5
        )
    )
    # save cells.purge.cel.20
    saveRDS(cells.purge.cel.20,
        file = FILE.OUTPUT.CELLS.PURGE.CEL.20
    )
}
# gen fig3
fig3 <- Seurat::DimPlot(cells.purge.cel.20, label = TRUE)
fig3 <- fig3 + Seurat::FeaturePlot(cells.purge.cel.20, features = "Hexb"); fig3

# get cells.purge.cel.4.mgla & cells.purge.cel.20.mgla
if (file.exists(FILE.OUTPUT.CELLS.PURGE.CEL.4.MGLA)) {
    # read output.cells.purge.cel.4.mgla
    cells.purge.cel.4.mgla <- readRDS(FILEOUTPUT.CELLS.PURGE.CEL.4.MGLA)
} else {
    # get cells.purge.cel.4.mgla
    cells.purge.cel.4.mgla.names <- Seurat::CellSelector(Seurat::DimPlot(cells.purge.cel.4, label = TRUE))
    cells.purge.cel.4.mgla <- cells.purge.cel.4[,cells.purge.cel.4.mgla.names]
    # scseq standard workflow
    cells.purge.cel.4.mgla <- scseq.standard(
        cells = cells.purge.cel.4.mgla,
        params = list(
            default.assay = "RNA",
            nfeatures = 2000,
            dims = 1:50,
            resolution = 0.5
        )
    )
    # save cells.purge.cel.4.mgla
    saveRDS(cells.purge.cel.4.mgla,
        file = FILE.OUTPUT.CELLS.PURGE.CEL.4.MGLA
    )
}
# gen fig4
fig4 <- Seurat::DimPlot(cells.purge.cel.4.mgla, label = TRUE)
fig4 <- fig4 + Seurat::FeaturePlot(cells.purge.cel.4.mgla, features = "Hexb"); fig4
if (file.exists(FILE.OUTPUT.CELLS.PURGE.CEL.20.MGLA)) {
    # read output.cells.purge.cel.20.mgla
    cells.purge.cel.20.mgla <- readRDS(FILEOUTPUT.CELLS.PURGE.CEL.20.MGLA)
} else {
    # get cells.purge.cel.20.mgla
    cells.purge.cel.20.mgla.names <- Seurat::CellSelector(Seurat::DimPlot(cells.purge.cel.20, label = TRUE))
    cells.purge.cel.20.mgla <- cells.purge.cel.20[,cells.purge.cel.20.mgla.names]
    # scseq standard workflow
    cells.purge.cel.20.mgla <- scseq.standard(
        cells = cells.purge.cel.20.mgla,
        params = list(
            default.assay = "RNA",
            nfeatures = 2000,
            dims = 1:50,
            resolution = 0.5
        )
    )
    # save cells.purge.cel.20.mgla
    saveRDS(cells.purge.cel.20.mgla,
        file = FILE.OUTPUT.CELLS.PURGE.CEL.20.MGLA
    )
}
# gen fig5
fig5 <- Seurat::DimPlot(cells.purge.cel.20.mgla, label = TRUE)
fig5 <- fig5 + Seurat::FeaturePlot(cells.purge.cel.20.mgla, features = "Hexb"); fig5

# get cells.purge.cel.4.mgla.int & cells.purge.cel.20.mgla.int
if (file.exists(FILE.OUTPUT.CELLS.PURGE.CEL.4.MGLA.INT)) {
    # read output.cells.purge.cel.4.mgla.int
    cells.purge.cel.4.mgla.int <- readRDS(FILEOUTPUT.CELLS.PURGE.CEL.4.MGLA.INT)
} else {
    # scseq integrate workflow
    cells.purge.cel.4.mgla.int <- scseq.integrate(
        cells = cells.purge.cel.4.mgla,
        params = list(
            split.by = "group",
            nfeatures = 2000,
            dims = 1:50,
            resolution = 0.5
        )
    )
    # save cells.purge.cel.4.mgla.int
    saveRDS(cells.purge.cel.4.mgla.int,
        file = FILE.OUTPUT.CELLS.PURGE.CEL.4.MGLA.INT
    )
}
# gen fig6
fig6 <- Seurat::DimPlot(cells.purge.cel.4.mgla.int, label = TRUE)
fig6 <- fig6 + Seurat::FeaturePlot(cells.purge.cel.4.mgla.int, features = "Hexb"); fig6
if (file.exists(FILE.OUTPUT.CELLS.PURGE.CEL.20.MGLA.INT)) {
    # read output.cells.purge.cel.20.mgla.int
    cells.purge.cel.20.mgla.int <- readRDS(FILEOUTPUT.CELLS.PURGE.CEL.20.MGLA.INT)
} else {
    # scseq integrate workflow
    cells.purge.cel.20.mgla.int <- scseq.integrate(
        cells = cells.purge.cel.20.mgla,
        params = list(
            split.by = "group",
            nfeatures = 2000,
            dims = 1:50,
            resolution = 0.5
        )
    )
    # save cells.purge.cel.20.mgla.int
    saveRDS(cells.purge.cel.20.mgla.int,
        file = FILE.OUTPUT.CELLS.PURGE.CEL.20.MGLA.INT
    )
}
# gen fig7
fig7 <- Seurat::DimPlot(cells.purge.cel.20.mgla.int, label = TRUE)
fig7 <- fig7 + Seurat::FeaturePlot(cells.purge.cel.20.mgla.int, features = "Hexb"); fig7

## Lab 2: integrate all data with celsius(2)
# get cells.purge.int
if (file.exists(FILE.OUTPUT.CELLS.PURGE.INT)) {
    # read output.cells.purge.int
    cells.purge.int <- readRDS(FILE.OUTPUT.CELLS.PURGE.INT)
} else {
    # scseq integrate workflow
    cells.purge.int <- scseq.integrate(
        cells = cells.purge,
        params = list(
            split.by = "celsius",
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
# gen fig8
fig8 <- Seurat::DimPlot(cells.purge.int, label = TRUE)
fig8 <- fig8 + Seurat::FeaturePlot(cells.purge.int, features = "Hexb"); fig8
