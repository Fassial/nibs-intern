###################################
# Created on 15:55, Jan. 10th, 2021
# Author: fassial
# Filename: gen.figs.R
###################################
# dep
library(Seurat)
# local dep
DIR.ROOT <- file.path(getwd())
source(file.path(DIR.ROOT, "scseq.Rh"))
source(file.path(DIR.SRC, "utils.R"))

# macro
DIR.OUTPUT.DEGS <- file.path(DIR.OUTPUT, "degs")
FILE.DATA.CELLS.LPS <- file.path(DIR.DATA, "cells.lps.rds")
FILE.OUTPUT.CELLS.PURGE.CEL.4.MGLA <- file.path(DIR.OUTPUT, "cells.purge.cel.4.mgla.rds")
# FILE.OUTPUT.DEGS.MG601 <- file.path(DIR.OUTPUT.DEGS, "degs.mg601.csv")
# FILE.OUTPUT.DEGS.MG4831 <- file.path(DIR.OUTPUT.DEGS, "degs.mg4831.csv")
# FILE.OUTPUT.DEGS.LPS <- file.path(DIR.OUTPUT.DEGS, "degs.lps.csv")

## gen figs
## Lab 1
## read cells
# read cells.purge.cel.4.mgla
cells.purge.cel.4.mgla <- readRDS(FILE.OUTPUT.CELLS.PURGE.CEL.4.MGLA)
cells.sleep.mgc1 <- cells.purge.cel.4.mgla[,cells.purge.cel.4.mgla@meta.data$group == "MGC1"]@assays$RNA@counts
cells.sleep.mg601 <- cells.purge.cel.4.mgla[,cells.purge.cel.4.mgla@meta.data$group == "MG601"]@assays$RNA@counts
cells.sleep.mg4831 <- cells.purge.cel.4.mgla[,cells.purge.cel.4.mgla@meta.data$group == "MG4831"]@assays$RNA@counts
# read cells.lps
cells.lps <- readRDS(FILE.DATA.CELLS.LPS)
cells.lps.mgc1 <- cells.lps[,cells.lps@meta.data$group == "MGC1"]@assays$RNA@counts
cells.lps.mgl3s3 <- cells.lps[,cells.lps@meta.data$group == "MGL3S3"]@assays$RNA@counts
## find degs
# degs.sleep
# degs.mg601 <- read.csv(FILE.OUTPUT.DEGS.MG601); degs.mg601 <- order.degs(degs = degs.mg601)
Idents(cells.purge.cel.4.mgla) <- "group"
degs.sleep.mg601vmgc1 <- Seurat::FindMarkers(
    object = cells.purge.cel.4.mgla,
    ident.1 = "MG601",
    ident.2 = "MGC1"
); degs.sleep.mg601vmgc1 <- order.degs(degs = degs.sleep.mg601vmgc1)
degs.sleep.mg4831vmgc1 <- Seurat::FindMarkers(
    object = cells.purge.cel.4.mgla,
    ident.1 = "MG4831",
    ident.2 = "MGC1"
); degs.sleep.mg4831vmgc1 <- order.degs(degs = degs.sleep.mg4831vmgc1)
degs.sleep.mg4831vmg601 <- Seurat::FindMarkers(
    object = cells.purge.cel.4.mgla,
    ident.1 = "MG4831",
    ident.2 = "MG601"
); degs.sleep.mg4831vmg601 <- order.degs(degs = degs.sleep.mg4831vmg601)
# degs.lps
Idents(cells.lps) <- "group"
degs.lps.mgl3s3vmgc1 <- Seurat::FindMarkers(
    object = cells.lps,
    ident.1 = "MGL3S3",
    ident.2 = "MGC1"
); degs.lps.mgl3s3vmgc1 <- order.degs(degs = degs.lps.mgl3s3vmgc1)
## gen figs
# gen figs for sleep
plot.degs.sleep.mg601vmgc1 <- plot.degs.scatter(
    cells.ctrl = cells.sleep.mgc1,
    cells.expr = cells.sleep.mg601,
    de.genes = degs.sleep.mg601vmgc1,
    params = list(
        log.weight = 10**5,
        log.bias = 1,
        plot.title = "gene variable figure",
        plot.xlab = "cells.sleep.mgc1",
        plot.ylab = "cells.sleep.mg601",
        plot.name.n = 5,
        plot.color.norm = "#444444",
        plot.color.up = "#DC143C",
        plot.color.down = "#0000FF",
        plot.color.up.head = "#FF8C00",
        plot.color.down.head = "#00FFFF",
        plot.index.norm = "0",
        plot.index.up = "1",
        plot.index.down = "2",
        plot.index.up.head = "3",
        plot.index.down.head = "4",
        plot.label.none = ""
    )
)
plot.degs.sleep.mg4831vmgc1 <- plot.degs.scatter(
    cells.ctrl = cells.sleep.mgc1,
    cells.expr = cells.sleep.mg4831,
    de.genes = degs.sleep.mg4831vmgc1,
    params = list(
        log.weight = 10**5,
        log.bias = 1,
        plot.title = "gene variable figure",
        plot.xlab = "cells.sleep.mgc1",
        plot.ylab = "cells.sleep.mg4831",
        plot.name.n = 5,
        plot.color.norm = "#444444",
        plot.color.up = "#DC143C",
        plot.color.down = "#0000FF",
        plot.color.up.head = "#FF8C00",
        plot.color.down.head = "#00FFFF",
        plot.index.norm = "0",
        plot.index.up = "1",
        plot.index.down = "2",
        plot.index.up.head = "3",
        plot.index.down.head = "4",
        plot.label.none = ""
    )
)
plot.degs.sleep.mg4831vmg601 <- plot.degs.scatter(
    cells.ctrl = cells.sleep.mg601,
    cells.expr = cells.sleep.mg4831,
    de.genes = degs.sleep.mg4831vmg601,
    params = list(
        log.weight = 10**5,
        log.bias = 1,
        plot.title = "gene variable figure",
        plot.xlab = "cells.sleep.mg601",
        plot.ylab = "cells.sleep.mg4831",
        plot.name.n = 5,
        plot.color.norm = "#444444",
        plot.color.up = "#DC143C",
        plot.color.down = "#0000FF",
        plot.color.up.head = "#FF8C00",
        plot.color.down.head = "#00FFFF",
        plot.index.norm = "0",
        plot.index.up = "1",
        plot.index.down = "2",
        plot.index.up.head = "3",
        plot.index.down.head = "4",
        plot.label.none = ""
    )
)
# gen figs for degs.lps
plot.degs.scatter.lps.mgl3s3vmgc1 <- plot.degs.scatter(
    cells.ctrl = cells.lps.mgc1,
    cells.expr = cells.lps.mgl3s3,
    de.genes = degs.lps.mgl3s3vmgc1,
    params = list(
        log.weight = 10**5,
        log.bias = 1,
        plot.title = "gene variable figure",
        plot.xlab = "cells.lps.mgc1",
        plot.ylab = "cells.lps.mgl3s3",
        plot.name.n = 5,
        plot.color.norm = "#444444",
        plot.color.up = "#DC143C",
        plot.color.down = "#0000FF",
        plot.color.up.head = "#FF8C00",
        plot.color.down.head = "#00FFFF",
        plot.index.norm = "0",
        plot.index.up = "1",
        plot.index.down = "2",
        plot.index.up.head = "3",
        plot.index.down.head = "4",
        plot.label.none = ""
    )
)

## Lab 2
## gen figs
# gen figs for degs.sleep
plot.degs.pie.sleep.mg601vmgc1 <- plot.degs.pie(
    de.genes = degs.sleep.mg601vmgc1,
    params = list(
        plot.title = "pie figure of degs.sleep.mg601vmgc1",
        plot.col = c("#DC143C", "#0000FF"),
        plot.legend = c("Up", "Down")
    )
)
plot.degs.pie.sleep.mg4831vmgc1 <- plot.degs.pie(
    de.genes = degs.sleep.mg4831vmgc1,
    params = list(
        plot.title = "pie figure of degs.sleep.mg4831vmgc1",
        plot.col = c("#DC143C", "#0000FF"),
        plot.legend = c("Up", "Down")
    )
)
plot.degs.pie.sleep.mg4831vmg601 <- plot.degs.pie(
    de.genes = degs.sleep.mg4831vmg601,
    params = list(
        plot.title = "pie figure of degs.sleep.mg4831vmg601",
        plot.col = c("#DC143C", "#0000FF"),
        plot.legend = c("Up", "Down")
    )
)
# gen figs for degs.lps
plot.degs.pie.lps.mgl3s3vmgc1 <- plot.degs.pie(
    de.genes = degs.lps.mgl3s3vmgc1,
    params = list(
        plot.title = "pie figure of degs.lps.mgl3s3vmgc1",
        plot.col = c("#DC143C", "#0000FF"),
        plot.legend = c("Up", "Down")
    )
)

## Lab 3
# get de.genes.up & de.genes.down
de.genes.up <- list(
    degs.sleep.mg601vmgc1 = degs.sleep.mg601vmgc1$degs.up$gene,
    degs.sleep.mg4831vmgc1 = degs.sleep.mg4831vmgc1$degs.up$gene,
    degs.sleep.mg4831vmg601 = degs.sleep.mg4831vmg601$degs.up$gene,
    degs.lps.mgl3s3vmgc1 = degs.lps.mgl3s3vmgc1$degs.up$gene
)
de.genes.down <- list(
    degs.sleep.mg601vmgc1 = degs.sleep.mg601vmgc1$degs.down$gene,
    degs.sleep.mg4831vmgc1 = degs.sleep.mg4831vmgc1$degs.down$gene,
    degs.sleep.mg4831vmg601 = degs.sleep.mg4831vmg601$degs.down$gene,
    degs.lps.mgl3s3vmgc1 = degs.lps.mgl3s3vmgc1$degs.down$gene
)
# gen figs
plot.degs.venn.up <- plot.degs.venn(
    de.genes.list = de.genes.up,
    params = list()
)
plot.degs.venn.down <- plot.degs.venn(
    de.genes.list = de.genes.down,
    params = list()
)
