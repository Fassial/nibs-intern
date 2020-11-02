##################################
# Created on 17:15, Nov. 1st, 2020
# Author: fassial
# Filename: preprocess.R
##################################
# dep
# local dep

# def quality_control func
quality_control <- function(scs.unfiltered,
    filter.params = list(
        nexprs.min = 500,
        nexprs.max = Inf,
	    ncounts.min = 50000,
	    ncounts.max = Inf,
        ncells.min = 5,
        mito.max = 10
    )
) {

    # filter nexprs
    scs.filtered <- subset(scs.unfiltered,
        subset = nFeature_RNA < filter.params$nexprs.max & nFeature_RNA > filter.params$nexprs.min
    )
    # filter counts
    scs.filtered <- subset(scs.filtered,
        subset = nCount_RNA < filter.params$ncounts.max & nCount_RNA > filter.params$ncounts.min
    )
    # filter ncells
    scs.filtered <- subset(scs.filtered,
        features = rownames(scs.filtered)[which(rowSums(as.matrix(GetAssayData(scs.filtered, slot = "counts") > 0)) >= filter.params$ncells.min)]
    )
    # filter mito
    scs.filtered[["percent.mt"]] <- PercentageFeatureSet(scs.filtered, pattern="^mt-")
    scs.filtered <- subset(scs.filtered,
        subset = percent.mt < filter.params$mito.max
    )
    return(scs.filtered)
}

# def data_integration func
data_integration <- function(scs.filtered, split.by = "treat") {
    # set scs.list
    scs.list <- SplitObject(scs.filtered,
        split.by = split.by
    )
    return(scs.list)
}

# def preprocess func
preprocess <- function(scs.unfiltered) {
    # qc
    scs.filtered <- quality_control(scs.unfiltered = scs.unfiltered)
    # di
    scs.list <- data_integration(scs.filtered = scs.filtered)
    return(scs.list)
}

