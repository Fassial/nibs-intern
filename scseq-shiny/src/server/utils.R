##################################
# Created on 20:48, Nov. 6th, 2020
# Author: fassial
# Filename: utils.R
##################################
# dep
library(Seurat)
# local dep

# macro

# def recursive_paste0 func
recursive_paste0 <- function(expr_condition, f_use, l_use, server.params) {
    # init server params
    # takes valid input$factors and input$levels, construct a condition
    # clause that is passed to WhichCells(expression =...)
    if (length(f_use) == 0) {
        return(expr_condition)
    } else if (length(f_use) == 1) {
        expr_condition = paste0(expr_condition, f_use[1],"==","\'",l_use[1],"\'")
        f_use = f_use[-1]; l_use = l_use[-1]
        return(recursive_paste0(expr_condition, f_use, l_use))
    } else {
        expr_condition = paste0(expr_condition, f_use[1],"==","\'",l_use[1],"\'", " & ")
        f_use = f_use[-1]; l_use = l_use[-1]
        return (recursive_paste0(expr_condition, f_use, l_use))
    }
}

# def parse_cells_chosen func
parse_cells_chosen <- function(f, l, server.params){
    # init server params
    cells <- server.params$cells
    # initialize vector to store cells to be selected
    cells_selected <- ""
    if (any(l!="")) {
        # parse factor and levels
        f_use <- f[which(l!="")]
        l_use <- l[which(l!="")]
        # parse expression condition
        expr_condition <- recursive_paste0(expr_condition = "", f_use, l_use, server.params = server.params); print(expr_condition)
        # extract cell names
        cells_selected <- eval(parse(
            text= paste0("Seurat::WhichCells(cells, expression = ",expr_condition,")")
        ))
        # print(cells_selected)
    }
    return(cells_selected)
}

