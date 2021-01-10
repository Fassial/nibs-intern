##################################
# Created on 17:11, Jan. 9th, 2021
# Author: fassial
# Filename: utils.R
##################################
# dep
library(venn)
library(Matrix)
library(ggplot2)
# local dep
DIR.ROOT <- file.path(getwd())
source(file.path(DIR.ROOT, "scseq.Rh"))

# macro

# def plot.degs.scatter func
plot.degs.scatter <- function(cells.ctrl, cells.expr, de.genes, params = list(
    log.weight = 10**5,
    log.bias = 1,
    plot.title = "gene variable figure",
    plot.xlab = "cells.ctrl",
    plot.ylab = "cells.expr",
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
)) {
    ## normalize data by sum factor
    # get colSums(rep matrix)
    cells.ctrl.colSums <- sapply(Matrix::colSums(
        x = cells.ctrl,
        na.rm = FALSE,
        dims = 1,
        sparseResult = FALSE
    ), rep, dim(cells.ctrl)[1])
    cells.expr.colSums <- sapply(Matrix::colSums(
        x = cells.expr,
        na.rm = FALSE,
        dims = 1,
        sparseResult = FALSE
    ), rep, dim(cells.expr)[1])
    # normalize cells.ctrl & cells.expr
    cells.ctrl <- cells.ctrl / cells.ctrl.colSums
    cells.expr <- cells.expr / cells.expr.colSums
    # get mean gene expr
    cells.ctrl.ge <- Matrix::rowMeans(
        x = cells.ctrl,
        na.rm = FALSE,
        dims = 1,
        sparseResult = FALSE
    ); cells.ctrl.ge <- log((cells.ctrl.ge * params$log.weight + params$log.bias), base = exp(1))
    cells.expr.ge <- Matrix::rowMeans(
        x = cells.expr,
        na.rm = FALSE,
        dims = 1,
        sparseResult = FALSE
    ); cells.expr.ge <- log((cells.expr.ge * params$log.weight + params$log.bias), base = exp(1))
    ## get up/down genes
    de.genes.up <- de.genes$degs.up; de.genes.down <- de.genes$degs.down
    ## plot different expression genes
    # gen plot.df
    plot.df <- data.frame(cells.ctrl.ge, cells.expr.ge,
        group = rep(params$plot.index.norm, length(cells.ctrl.ge)),
        label = rep(params$plot.label.none, length(cells.ctrl.ge))
    )
    # set subset of plot.df
    plot.df.index.up <- (rownames(plot.df) %in% de.genes.up[, "gene"])
    plot.df.index.up.head <- (rownames(plot.df) %in% head(de.genes.up[, "gene"], n = params$plot.name.n))
    plot.df.index.down <- (rownames(plot.df) %in% de.genes.down[, "gene"])
    plot.df.index.down.head <- (rownames(plot.df) %in% head(de.genes.down[, "gene"], n = params$plot.name.n))
    plot.df.index.norm <- !(plot.df.index.up | plot.df.index.down)
    plot.df[plot.df.index.up, "group"] <- params$plot.index.up
    plot.df[plot.df.index.down, "group"] <- params$plot.index.down
    plot.df[plot.df.index.up.head, "group"] <- params$plot.index.up.head
    plot.df[plot.df.index.down.head, "group"] <- params$plot.index.down.head
    plot.df[plot.df.index.up.head, "label"] <- rownames(plot.df[plot.df.index.up.head,])
    plot.df[plot.df.index.down.head, "label"] <- rownames(plot.df[plot.df.index.down.head,])
    # plot degs
    plot.degs <- ggplot2::ggplot() + ggplot2::geom_point(
        data = plot.df,
        mapping = ggplot2::aes(x = cells.ctrl.ge, y = cells.expr.ge, color = group),
        size = 2,
        alpha = 0.7
    ) + ggplot2::geom_text(
        data = plot.df,
        mapping = ggplot2::aes(x = cells.ctrl.ge, y = cells.expr.ge, label = label),
        nudge_x = 0.1,
        nudge_y = 0.1
    ) + ggplot2::labs(
        title = params$plot.title,
        x = params$plot.xlab,
        y = params$plot.ylab
    ) + ggplot2::theme_bw()+ ggplot2::theme(
        plot.title = ggplot2::element_text(hjust = 0.5),
        title = ggplot2::element_text(size = 15,face = 'bold'),
        axis.text = ggplot2::element_text(size=12,face = 'bold'),   # Font size of axis labels.
        legend.text = ggplot2::element_text(size=12,face = 'bold'), # Font size of legend labels.
        legend.title = ggplot2::element_blank(),                    # Remove the legend title.
        legend.position = c(.92, .9),                               # Position of the legend.
        legend.margin = ggplot2::margin(6, 6, 6, 6),                # Margin of the legend.
        legend.background = ggplot2::element_rect(                  # Add a box around the legend.
            size = 0.2,
            colour = 1
        )
    ) + ggplot2::scale_discrete_manual(
        values = c(
            params$plot.color.norm,
            params$plot.color.up,
            params$plot.color.down,
            params$plot.color.up.head,
            params$plot.color.down.head
        ),
        aesthetics = 'colour',
        labels = c("Norm", "Up", "Down", "Up-head", "Down-head")
    )
    return(plot.degs)
}

# def plot.degs.pie func
plot.degs.pie <- function(de.genes, params = list(
    plot.title = "pie figure of degs",
    plot.col = c("#DC143C", "#0000FF"),
    plot.legend = c("Up", "Down")
)) {
    # set plot.df & plot.labels
    plot.df <- data.frame(
        type = params$plot.legend,
        nums = c(dim(de.genes$degs.up)[1], dim(de.genes$degs.down)[1])
    )
    plot.labels <- paste("(", plot.df$nums, ")", sep = "")
    plot.labels <- paste(plot.df$type, plot.labels, sep = "")
    # plot degs
    plot.degs <- ggplot2::ggplot(
        data = plot.df,
        mapping = ggplot2::aes(
            x = "Content",
            y = nums,
            fill = type
        )
    ) + ggplot2::geom_bar(
        stat = "identity",
        position = "stack",
        width = 1
    )
    plot.degs <- plot.degs + ggplot2::coord_polar(
        theta = "y"
    ) + ggplot2::labs(
        title = params$plot.title,
        x = "",
        y = ""
    ) + ggplot2::theme(
        axis.text = ggplot2::element_blank()
    ) + ggplot2::theme(
        axis.ticks = ggplot2::element_blank()
    ) + ggplot2::theme(
        legend.position = "none"
    ) + ggplot2::geom_text(mapping = ggplot2::aes(
        #x = sum(plot.df$nums)/dim(plot.df)[1],
        #y = plot.df$nums/2 + c(0, cumsum(plot.df$nums)[-length(plot.df$nums)]),
        label = plot.labels
    ))
    return(plot.degs)
}

# def plot.degs.venn func
plot.degs.venn <- function(de.genes.list, params = list(

)) {
    # plot degs
    plot.degs <- venn::venn(
        x = de.genes.list,
        zcolor = "style"
    )
    return(plot.degs)
}

# def order.degs func
order.degs <- function(degs) {
    # rm unwanted rows
    degs <- data.frame(degs[, "avg_logFC"], as.data.frame(rownames(degs))); colnames(degs) <- c("avg_logFC", "gene")
    # get degs.up & degs.down
    degs.up <- degs[degs[,"avg_logFC"]>0,]; degs.up <- degs.up[order(-degs.up[,"avg_logFC"]),]
    degs.down <- degs[degs[,"avg_logFC"]<0,]; degs.down <- degs.down[order(degs.down[,"avg_logFC"]),]
    return(list(
        degs.up = degs.up,
        degs.down = degs.down
    ))
}
