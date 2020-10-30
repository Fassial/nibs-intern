###################################
# Created on 15:21, Oct. 29th, 2020
# Author: fassial
# Filename: preproess.R
###################################
# dep
library(scater)
library(SingleCellExperiment)
# local dep
source("read_dataset.R")

# preprocess
preprocess <- function(raw.df) {
    # wrap data
    sce <- wrap_data(raw.df = raw.df)
    # QC
    sce.unfiltered <- quality_control(sce.unfiltered = sce)
    # perform discard
    sce.filtered <- perform_discard(sce.unfiltered = sce.unfiltered)
    return(sce.filtered)
}

# wrap data
wrap_data <- function(raw.df) {
    # gen matrix
    counts_matrix <- as.matrix(raw.df)
    # gen sce
    sce <- SingleCellExperiment(
        assays = list(counts = counts_matrix)
    )
    return(sce)
}

# QC
quality_control <- function(sce.unfiltered) {
    # get mito
    is.mito <- grepl("^mt-", rownames(sce.unfiltered))
    # add qc metrics
    sce.unfiltered <- addPerCellQC(sce.unfiltered, subsets=list(Mito=is.mito))
    # get qc metrics
    # qc.metrics <- perCellQCMetrics(sce.unfiltered, subsets=list(Mito=is.mito))
    qc.metrics <- colData(sce.unfiltered)
    # process qc
    print("filtered nums:")
    qc.mito <- qc.metrics$subsets_Mito_percent > 10; print(paste0("qc.mito:", sum(qc.mito)))
    qc.nexprs <- (qc.metrics$detected > 4000) | (qc.metrics$detected < 300); print(paste0("qc.nexprs:", sum(qc.nexprs)))
    qc.ncells <- (rowSums(counts(sce.unfiltered) > 0) < 10) | (rowMeans(counts(sce.unfiltered)) < 0.0002); print(paste0("qc.ncells:", sum(qc.ncells)))
    # get discard
    discard.cells <- qc.mito | qc.nexprs
    discard.genes <- qc.ncells

    # set discard attr
    colData(sce.unfiltered)$discard.cells <- discard.cells
    rowData(sce.unfiltered)$discard.genes <- discard.genes
    return(sce.unfiltered)
}

# perform discard
perform_discard <- function(sce.unfiltered) {
    # remove low-quality cells
    sce.filtered <- sce.unfiltered[,!colData(sce.unfiltered)$discard.cells]
    sce.filtered <- sce.filtered[!rowData(sce.unfiltered)$discard.genes,]
    return(sce.filtered)
}

# below runs for test
# # read dataset
# data.Kalucka2020 <- read_dataset(DATASET.Kalucka2020); print(dim(data.Kalucka2020))
# # wrap & QC & discard
# data.Kalucka2020.unfiltered <- wrap_data(data.Kalucka2020); print(dim(data.Kalucka2020.unfiltered))
# data.Kalucka2020.unfiltered <- quality_control(data.Kalucka2020.unfiltered); print(data.Kalucka2020.unfiltered)
# data.Kalucka2020.filtered <- perform_discard(data.Kalucka2020.unfiltered); print(data.Kalucka2020.filtered)
# # plot arrange
# library(gridExtra)
# gridExtra::grid.arrange(
#     plotColData(data.Kalucka2020.unfiltered, y = "sum",
#         colour_by = "discard.cells") + scale_y_log10() + ggtitle("Total count"),
#     plotColData(data.Kalucka2020.unfiltered, y = "detected",
#         colour_by = "discard.cells") + scale_y_log10() + ggtitle("Detected features"),
#     plotColData(data.Kalucka2020.unfiltered, y = "subsets_Mito_percent",
#         colour_by = "discard.cells") + scale_y_log10() + ggtitle("Mito percent"),
#     nrow = 1,
#     ncol = 3
# )

