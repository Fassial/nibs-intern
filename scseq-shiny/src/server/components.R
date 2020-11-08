##################################
# Created on 12:21, Nov. 7th, 2020
# Author: fassial
# Filename: components.R
##################################
# dep
library(shiny)
# local dep

# macro
SELECT.INPUT.NONE = "--please select--"

# def gen_comp.de.ctrl.panel.entry func
gen_comp.de.ctrl.panel.entry <- function(input, server.params, server.envs, entry.no) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # get de.ctrl.panel.lists
    de.ctrl.panel.lists <- server.envs$vars$de.ctrl.panel.lists
    ## gen de.ctrl.panel.entry
    # gen factor
    factor <- paste0("shiny::column(2, offset = 0, div(style=\"
        text-align:right;
    \", shiny::helpText(paste0(de.ctrl.panel.lists[", entry.no, "], \":\"))))")
    # get factor.levels
    factor.levels <- paste0("levels(factor(eval(parse(
        text = paste0(\"metadata %>% .[[\'\",de.ctrl.panel.lists[", entry.no, "],\"\']]\")
    ))))")
    # gen cond.left
    cond.left <- paste0("shiny::column(4, offset = 0, selectInput(
        inputId = paste0(\"de.ctrl.panel.entry.cond.left\", ", entry.no, "),
        label = NULL,
        choices = c(SELECT.INPUT.NONE, ", factor.levels, ")
    ))")
    # gen cond.right
    cond.right <- paste0("shiny::column(4, offset = 0, selectInput(
        inputId = paste0(\"de.ctrl.panel.entry.cond.right\", ", entry.no, "),
        label = NULL,
        choices = c(SELECT.INPUT.NONE, ", factor.levels, ")
    ))")
    # gen delete.button
    delete.button <- paste0("shiny::column(2, offset = 0, shiny::actionButton(
        inputId = paste0(\"de.ctrl.panel.entry.delete.button\", ", entry.no, "),
        label = \"Delete\"
    ))")
    # gen de.ctrl.panel.entry
    de.ctrl.panel.entry <- paste0("shiny::fluidRow(",
        factor, ",",
        cond.left, ",",
        cond.right, ",",
        delete.button,
    ")")
    return(de.ctrl.panel.entry)
}

