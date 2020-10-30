###################################
# Created on 13:12, Oct. 29th, 2020
# Author: fassial
# Filename: read_dataset.R
###################################
# dep
# local dep

# define get_dataset func
get_dataset <- function(filepath, sep = '\t', header = TRUE) {
    # read data from txt/csv
    data <- read.table(
        filepath,
        sep = sep,
        header = header
    )
    # set rownames
    rownames(data) <- data[,1]
    data <- subset(data, select = -1)
    return(data)
}

# define read_dataset func
read_dataset <- function(dirpath, sep = '\t', header = TRUE) {
    # init dataset
    dataset <- data.frame()
    # read data from dir
    files.list <- list.files(
        path = dirpath,
        pattern = "*.txt"
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

# define combine dataset func
combine_dataset <- function(dirpath, sep = '\t', header = TRUE) {
    # init dataset
    dataset <- 0
    # read data from dir
    files.list <- list.files(
        path = dirpath,
        pattern = "*.txt"
    )
    for (file in files.list) {
        dataset <- dataset + get_dataset(
            filepath = file.path(dirpath, file),
            sep = sep,
            header = header
        )
    }
    return(dataset)
}

# below runs for test
# read dataset
# data.Kalucka2020 <- combine_dataset(DATASET.Kalucka2020)
# data.Vanlandewijck2018.normalized <- get_dataset(file.path(DATASET.Vanlandewijck2018, "GSE98816_Brain_samples_normalized_counts_matrix.txt"))
# data.Vanlandewijck2018.raw <- get_dataset(file.path(DATASET.Vanlandewijck2018, "GSE98816_Brain_samples_raw_read_counts_matrix.txt"))

