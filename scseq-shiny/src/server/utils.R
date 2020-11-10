##################################
# Created on 20:48, Nov. 6th, 2020
# Author: fassial
# Filename: utils.R
##################################
# dep
library(Seurat)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))

# macro

# def server.rec_paste0 func
server.rec_paste0 <- function(server.params, expr.cond, factor.lists, value.lists) {
    # init server params
    # takes valid input$factors and input$levels, construct a condition
    # clause that is passed to WhichCells(expression =...)
    if (length(factor.lists) == 0) {
        return(expr.cond)
    } else if (length(factor.lists) == 1) {
        expr.cond = paste0(expr.cond, factor.lists[1],"==","\'",value.lists[1],"\'")
        factor.lists = factor.lists[-1]; value.lists = value.lists[-1]
        return(server.rec_paste0(
            server.params = server.params,
            expr.cond = expr.cond,
            factor.lists = factor.lists,
            value.lists = value.lists
        ))
    } else {
        expr.cond = paste0(expr.cond, factor.lists[1],"==","\'",value.lists[1],"\'", " & ")
        factor.lists = factor.lists[-1]; value.lists = value.lists[-1]
        return(server.rec_paste0(
            server.params = server.params,
            expr.cond = expr.cond,
            factor.lists = factor.lists,
            value.lists = value.lists
        ))
    }
}

# def server.select_cells func
server.select_cells <- function(server.params, factor.lists, value.lists){
    # init server params
    cells <- server.params$cells
    # initialize vector to store cells to be selected
    cells.selected <- ""
    if (any(value.lists!="")) {
        # parse factor and levels
        factor.lists <- factor.lists[which(value.lists!="")]
        value.lists <- value.lists[which(value.lists!="")]
        # parse expression condition
        expr.cond <- server.rec_paste0(
            server.params = server.params,
            expr.cond = "",
            factor.lists = factor.lists,
            value.lists = value.lists
        )
        # extract cell names
        cells.selected <- eval(parse(
            text= paste0("Seurat::WhichCells(cells, expression = ", expr.cond, ")")
        ))
    }
    return(cells.selected)
}

