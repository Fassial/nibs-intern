###################################
# Created on 15:21, Oct. 29th, 2020
# Author: fassial
# Filename: qc.R
###################################
# dep
library(scater)
library(SingleCellExperiment)
# local dep

# macro
## qc.params
QC.PARAMS <- list(
    # mito(mito ratio)
    mito.maxrate = Inf*100, mito.pattern = "^mt-",
    # nexprs(genes expressed in this cell)
    nexprs.maxnum = Inf, nexprs.minnum = 0,
    # ncells(cells expressed this gene)
    ncells.minnum = 0, ncells.minrate = 0
)

# def qc func
qc <- function(cells, qc.params = QC.PARAMS) {
    # wrap data
    print("INFO: start wraping data...")
    sce <- wrap_data(cells); print(sce)
    print("INFO: wraping data complete.")

    ## qc
    # complete qc.params
    print("INFO: start completing qc.parmas...")
    for (param.name in names(QC.PARAMS)) if (is.null(qc.params[[param.name]])) {
        # if is null, use default value(ignore this param)
        qc.params[[param.name]] <- QC.PARAMS[[param.name]]
    }
    print("INFO: completing qc.parmas complete.")
    # exe qc
    print("INFO: start qc...")
    sce.unfiltered <- quality_control(
        sce.unfiltered = sce,
        qc.params = qc.params
    ); print(sce.unfiltered)
    print("INFO: qc complete.")
    # perform discard
    sce.filtered <- perform_discard(sce.unfiltered = sce.unfiltered)
    return(sce.filtered)
}

# def wrap_data func
wrap_data <- function(cells) {
    # init sce
    sce <- NULL
    # check cells class
    if (class(cells) == "data.frame") {
        # gen matrix
        counts_matrix <- as.matrix(cells)
        # gen sce
        sce <- SingleCellExperiment(
            assays = list(counts = counts_matrix)
        )
    } else if (class(cells) == "Seurat") {
        # as SingleCellExperiment
        sce <- as.SingleCellExperiment(
            x = cells,
            assay = NULL
        )
    } else {
        # TODO
    }
    return(sce)
}

# def quality_control func
quality_control <- function(sce.unfiltered, qc.params, max.cells = 50000) {
    # get mito
    is.mito <- grepl(qc.params$mito.pattern, rownames(sce.unfiltered))
    # add qc metrics
    # sce.unfiltered <- addPerCellQC(sce.unfiltered, subsets=list(Mito=is.mito))
    # qc.metrics <- colData(sce.unfiltered)
    # get qc metrics
    if (dim(sce.unfiltered)[2] <= max.cells) {
        qc.metrics <- perCellQCMetrics(
            x = sce.unfiltered,
            subsets=list(Mito=is.mito)
        )
    } else {
        # init qc.metrics
        qc.metrics <- NULL
        index = 0
        while ((index+1) * max.cells < dim(sce.unfiltered)[2]) {
            print(paste0("INFO: calculating QC metrics of cells[", index*max.cells+1, ",", (index+1)*max.cells, "]..."))
            # get partial qc.metrics
            qc.metrics <- rbind(qc.metrics,
                perCellQCMetrics(
                    x = sce.unfiltered[,(index*max.cells+1):((index+1)*max.cells)],
                    subsets=list(Mito=is.mito)
                )
            )
            # update index
            index = index + 1
        }
        qc.metrics <- rbind(qc.metrics,
            perCellQCMetrics(
                x = sce.unfiltered[,(index*max.cells+1):(dim(sce.unfiltered)[2])],
                subsets=list(Mito=is.mito)
            )
        )
    }; print(dim(qc.metrics))
    # reset nan as 0
    qc.metrics$subsets_Mito_percent[is.na(qc.metrics$subsets_Mito_percent)] <- 0

    # process qc
    print("filtered nums:")
    qc.mito <- qc.metrics$subsets_Mito_percent > qc.params$mito.maxrate; print(paste0("qc.mito:", sum(qc.mito)))
    qc.nexprs <- (qc.metrics$detected > qc.params$nexprs.maxnum) | (qc.metrics$detected < qc.params$nexprs.minnum); print(paste0("qc.nexprs:", sum(qc.nexprs)))
    qc.ncells <- (rowSums(counts(sce.unfiltered) > 0) < qc.params$ncells.minnum) | (rowMeans(counts(sce.unfiltered)) < qc.params$ncells.minrate); print(paste0("qc.ncells:", sum(qc.ncells)))

    # get discard
    discard.cells <- qc.mito | qc.nexprs
    discard.genes <- qc.ncells

    # set discard attr
    colData(sce.unfiltered)$discard.cells <- discard.cells
    rowData(sce.unfiltered)$discard.genes <- discard.genes
    return(sce.unfiltered)
}

# def perform_discard func
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

