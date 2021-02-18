###################################
# Created on 16:38, Feb. 17th, 2021
# Author: fassial
# Filename: GOCluster.R
###################################
# dep
library(ggplot2)
library(ggdendro)
# local dep
source("GOHelper.R")

# macro
NUM.GENE = 10
NUM.CELL = 100
NUM.METADATA = 4
MIN.METAKIND = 3
MAX.METAKIND = 10

# def gen_metadata.rect func
gen_metadata.rect <- function(sce.dendr.x, metadata, params = list(
    circle.start = -0.5,
    circle.end = -1.3,
    palette.name = "Set3"
)) {
    ## gen color map
    # get metadata.set
    metadata.set <- unique(metadata)
    # get color.map
    color.map <- RColorBrewer::brewer.pal(n = length(metadata.set), name = params$palette.name)
    names(color.map) <- metadata.set

    ## gen metadata.rect
    # init comp of metadata.rect
    metadata.rect.x <- rep(0, times = length(metadata))
    metadata.rect.ymax <- rep(params$circle.start, times = length(metadata))
    metadata.rect.ymin <- rep(params$circle.end, times = length(metadata))
    metadata.rect.col <- rep("#000000", times = length(metadata))
    # set metadata.rect.x & metadata.rect.col
    for (i in 1:length(metadata)) {
        name <- names(metadata)[i]
        metadata.rect.x[i] <- sce.dendr.x[name]
        metadata.rect.col[i] <- color.map[metadata[i]]
    }
    # set metadata.rect
    metadata.rect <- data.frame(
        x = metadata.rect.x,
        ymax = metadata.rect.ymax,
        ymin = metadata.rect.ymin,
        col = metadata.rect.col
    )

    return(metadata.rect)
}

# def gen_geom.rect func
gen_geom.rect <- function(df.list.length, df.list.name = "metadata.rect") {
    geom.rect <- ""
    for (i in 1:df.list.length) {
        geom.rect <- paste0(geom.rect, "ggplot2::geom_rect(",
            "data = ", df.list.name, "[[", i, "]],",
            "mapping = ggplot2::aes(xmin=x-0.5,xmax=x+0.5,ymin=ymin,ymax=ymax),",
            "fill = ", df.list.name, "[[", i, "]]$col",
            ")"
        )
        if (i != df.list.length) geom.rect <- paste0(geom.rect, " + ")
    }
    return(geom.rect)
}

# def gen_goplot func
gen_goplot <- function(geom.rect) {
    # set prefix & postfix
    prefix <- "\
        # gen main canvas\
        ggplot2::ggplot() + \
        # plot cluster tree\
        ggplot2::geom_segment(\
            data = ggdendro::segment(sce.dendr),\
            mapping = ggplot2::aes(x = x, y = y, xend = xend, yend = yend)\
        ) + \
    "
    postfix <- "\
        # circular graph\
        coord_polar() + scale_y_reverse() + \
        # set theme\
        ggplot2::theme(\
            legend.position = \"bottom\",\
            legend.background = ggplot2::element_rect(fill = \"transparent\"),\
            legend.box = \"horizontal\",\
            legend.direction = \"horizontal\"\
        ) + theme_blank\
    "
    # set goplot
    goplot <- paste0(prefix, geom.rect, " + ", postfix)
    return(goplot)
}

# def GOCluster func
GOCluster <- function(sce, metadata, params = list(
    dist.method = "euclidean",
    clust.method = "average",
    circle.start = -0.5,
    circle.width = -0.8,
    circle.interval = -0.2,
    palette.name = "Set3"
)) {
    ## get clust dendr
    # get sce.dist
    sce.dist <- stats::dist(
        x = sce,
        method = params$dist.method
    )
    # get sce.clust
    sce.clust <- stats::hclust(
        d = sce.dist,
        method = params$clust.method
    )
    # get sce.dendr
    sce.dendr <- ggdendro::dendro_data(sce.clust)

    ## gen geom_rect
    # get sce.dendr.x
    sce.dendr.x <- sce.dendr$labels$x; names(sce.dendr.x) <- sce.dendr$labels$label
    # gen metadata.rect
    metadata.rect <- list()
    for (i in 1:dim(metadata)[2]) {
        name <- colnames(metadata)[i]
        metadata.rect[[name]] <- gen_metadata.rect(
            sce.dendr.x = sce.dendr.x,
            metadata = metadata[, i],
            params = list(
                circle.start = params$circle.start + (i-1)*(params$circle.width+params$circle.interval),
                circle.end = params$circle.start + i*params$circle.width + (i-1)*params$circle.interval,
                palette.name = params$palette.name
            )
        )
    }
    # gen geom.rect
    geom.rect <- gen_geom.rect(df.list.length = length(metadata.rect), df.list.name = "metadata.rect")

    ## gen GOCluster plot
    # get goplot
    goplot <- gen_goplot(geom.rect = geom.rect)
    # eval golpot
    eval(parse(text = goplot))
}

## GOCluster Example
# set random seed
set.seed(1)
# randomly set sce
sce <- matrix(rnorm(NUM.CELL*NUM.GENE), nrow = NUM.CELL)
rownames(sce) <- paste(rep("ATCG", times = dim(sce)[1]), 1:dim(sce)[1], sep = "_")
# randomly set metadata
metadata <- NULL
for (i in 1:NUM.METADATA) {
    metadata <- cbind(metadata, as.matrix(sample(
        x = 1:sample(x = MIN.METAKIND:MAX.METAKIND, size = 1),
        size = NUM.CELL,
        replace=TRUE
    )))
}
rownames(metadata) <- paste(rep("ATCG", times = dim(metadata)[1]), 1:dim(metadata)[1], sep = "_")
colnames(metadata) <- paste(rep("metadata", times = dim(metadata)[2]), 1:dim(metadata)[2], sep = "_")
# exec GOCluster
GOCluster(sce = sce, metadata = metadata, params = list(
    dist.method = "euclidean",
    clust.method = "average",
    circle.start = -0.5,
    circle.width = -0.8,
    circle.interval = -0.2,
    palette.name = "Set3"
))

