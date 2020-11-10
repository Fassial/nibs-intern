##################################
# Created on 20:54, Nov. 6th, 2020
# Author: fassial
# Filename: events.R
##################################
# dep
library(shiny)
library(tibble)
library(Seurat)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))
source(file.path(DIR.SERVER, "utils.R"))

# macro

# def gen_server.event.de.result func
gen_server.event.de.result <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # gen event.de.result
    event.de.result <- shiny::eventReactive(input$de.analyze.button, {
        # init server envs
        de.ctrl.panel.types <- server.envs$envs$de.ctrl.panel.types
        de.ctrl.panel.conds.left <- server.envs$envs$de.ctrl.panel.conds.left
        de.ctrl.panel.conds.right <- server.envs$envs$de.ctrl.panel.conds.right
        if (input$de.perform == "Multiple") {
            # find markers by cell_type
            Seurat::Idents(cells) <- "cell_type"
            de.result <- Seurat::FindAllMarkers(cells)
        } else if (input$de.perform == "Conserved") {
            # find conserved markers
            if (de.ctrl.panel.conds.right[1] == "") {
                shiny::withProgress(message = "Computing in progress. Please wait.", {
                    de.result <- Seurat::FindConservedMarkers(cells,
                        ident.1 = de.ctrl.panel.conds.left[1],
                        grouping.var = "stim"
                    )
                })
            } else {
                shiny::withProgress(message = "Computing in progress. Please wait.", {
                    de.result <- Seurat::FindConservedMarkers(cells,
                        ident.1 = de.ctrl.panel.conds.left[1],
                        ident.2 = de.ctrl.panel.conds.right[1],
                        grouping.var = "stim"
                    )
                })
            }
        } else if (input$de.perform == "Grouped comparison") {
            # get factor.lists & value.lists
            factor.lists <- de.ctrl.panel.types
            value.lists.left <- de.ctrl.panel.conds.left
            value.lists.right <- de.ctrl.panel.conds.right
            # get cells.selected
            cells.selected.left <- server.select_cells(
                server.params = server.params,
                factor.lists = factor.lists,
                value.lists = value.lists.left
            )
            cells.selected.right <- server.select_cells(
                server.params = server.params,
                factor.lists = factor.lists,
                value.lists = value.lists.right
            )
            # find markers in idents
            shiny::withProgress(message = "Computing in progress. Please wait.", {
                de.result <- Seurat::FindMarkers(cells,
                    ident.1 = cells.selected.left,
                    ident.2 = cells.selected.right
                )
                de.result <- tibble::rownames_to_column(de.result, "gene")
            })
        }
        return(de.result)
    })
    return(event.de.result)
}

