###################################
# Created on 13:12, Oct. 29th, 2020
# Author: fassial
# Filename: read_dataset.R
###################################
# dep
# local dep

# define read_tsv func
read_tsv <- function(filepath, sep = "\t") {
    # get file.ptr
    file.ptr <- file(filepath, "r")
    # init colnames & rownames & counts
    colnames <- NULL; rownames <- NULL; counts <- NULL

    # INFO: start reading
    print("INFO: start reading tsv file...")
    # colnames
    colnames <- unlist(strsplit(
        x = readLines(
            con = file.ptr,
            n = 1
        ),
        split = sep
    ))[-1]
    # get rownames & counts
    file.line <- readLines(
        con = file.ptr,
        n = 1
    )
    while (length(file.line) != 0) {
        array.line <- unlist(strsplit(
            x = file.line,
            split = sep
        )); if (length(array.line) == 0) {break;}
        rownames <- c(rownames, array.line[1])
        counts <- c(counts, as.numeric(array.line[-1]))
        # INFO: reading line No.x...
        if (length(rownames) %% 100 == 0) {print(paste0("INFO: reading line No.", length(rownames), "..."))}
        # get next line
        file.line <- readLines(
            con = file.ptr,
            n = 1
        )
    }
    # INFO: end reading
    print("INFO: reading tsv file complete.")
    # INFO: start converting
    print("INFO: start converting to matrix...")
    # reshape counts as matrix
    counts <- matrix(
        data = counts,
        nrow = length(rownames),
        ncol = length(colnames),
        byrow = TRUE
    )
    # INFO: end converting
    print("INFO: converting to matrix complete.")

    # close file.ptr
    close(file.ptr)
    # INFO: start gen.df
    print("INFO: start generating data.frame...")
    # set raw.df
    raw.df <- data.frame(counts)
    colnames(raw.df) <- colnames
    rownames(raw.df) <- rownames
    # INFO: end gen.df
    print("INFO: generating data.frame complete.")
    return(raw.df)
}

# define get_dataset func
get_dataset <- function(filepath, sep = "\t", header = TRUE) {
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
read_dataset <- function(dirpath, sep = "\t", header = TRUE) {
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
combine_dataset <- function(dirpath, sep = "\t", header = TRUE) {
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

