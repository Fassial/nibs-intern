##################################
# Created on 20:11, Nov. 1st, 2020
# Author: fassial
# Filename: load_dataset.R
##################################
# dep
library(Seurat)
# local dep

# macro
PROJECT = "Chen2020"
DATASET = file.path(getwd(), "..", "data")

# define get_dataset func
get_dataset <- function(filepath, sep = ',', header = TRUE) {
    # read data from txt/csv
    data <- read.table(
        filepath,
        sep = sep,
        header = header
    )
    # set rownames
    rownames(data) <- data[,1]
    data <- subset(data, select = -1); print(dim(data))
    return(data)
}

# define concat_dataset func
concat_dataset <- function(dirpath, sep = ',', header = TRUE) {
    # init dataset
    dataset <- data.frame()
    # read data from dir
    files.list <- list.files(
        path = dirpath,
        pattern = "*.csv"
    )
    for (file in files.list) {
        dataset <- rbind(dataset, t(get_dataset(
            filepath = file.path(dirpath, file),
            sep = sep,
            header = header
        )))
    }
    return(t(dataset))
}

# define load_dataset func
load_dataset <- function(dirpath = DATASET, sep = ",", header = TRUE, project = PROJECT) {
    # concat dataset
    data <- concat_dataset(
        dirpath = dirpath,
        sep = sep,
        header = header
    )
    # tag treat
    data.LPS <- data[,grepl(colnames(data), pattern="^LPS_")]
    scs.LPS <- CreateSeuratObject(
        counts = data.LPS,
        project = project,
        min.features = 600
    ); scs.LPS$treat <- "LPS"
    data.control <- data[,!grepl(colnames(data), pattern="^LPS_")]
    scs.control <- CreateSeuratObject(
        counts = data.control,
        project = project,
        min.features = 600
    ); scs.control$treat <- "control"
    # merge scs
    scs <- merge(scs.LPS, scs.control)
    return(scs)
}

