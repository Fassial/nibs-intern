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
    event.de.result <- shiny::eventReactive(input$de.ctrl.panel.analyze.button, {
        # init server envs
        de.ctrl.panel.conds <- server.envs$envs$de.ctrl.panel.conds
        if (input$de.ctrl.panel.de.type == "Multiple") {
            # find markers by cell_type
            Seurat::Idents(cells) <- "cell_type"
            de.result <- Seurat::FindAllMarkers(cells)
        } else if (input$de.ctrl.panel.de.type == "Conserved") {
            # find conserved markers
            if (de.ctrl.panel.conds[[1]]$cond.right == "") {
                shiny::withProgress(message = "Computing in progress. Please wait.", {
                    de.result <- Seurat::FindConservedMarkers(cells,
                        ident.1 = de.ctrl.panel.conds[[1]]$cond.left,
                        grouping.var = "stim"
                    )
                })
            } else {
                shiny::withProgress(message = "Computing in progress. Please wait.", {
                    de.result <- Seurat::FindConservedMarkers(cells,
                        ident.1 = de.ctrl.panel.conds[[1]]$cond.left,
                        ident.2 = de.ctrl.panel.conds[[1]]$cond.right,
                        grouping.var = "stim"
                    )
                })
            }
        } else if (input$de.ctrl.panel.de.type == "Grouped comparison") {
            # get factor.lists & value.lists
            factor.lists <- names(de.ctrl.panel.conds)
            value.lists.left <- lapply(names(de.ctrl.panel.conds), function(name) {
                cond.left <- de.ctrl.panel.conds[[name]]$cond.left
                if (cond.left == SELECT.INPUT.NONE) {
                    cond.left <- ""
                }
                return(cond.left)
            })
            value.lists.right <- lapply(names(de.ctrl.panel.conds), function(name) {
                cond.right <- de.ctrl.panel.conds[[name]]$cond.right
                if (cond.right == SELECT.INPUT.NONE) {
                    cond.right <- ""
                }
                return(cond.right)
            })
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

## def p-onload event
# def gen_server.event.onload.ov.ctrl.panel.gene.type func
gen_server.event.onload.ov.ctrl.panel.gene.type <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # set gene.types
    gene.types <- rownames(cells)
    # gen event.onload.ov.ctrl.panel.gene.type
    shinyjs::onevent(event = "click", id = "ov_ctrl_panel_gene_type", {
        if (!server.envs$events$onload.reg.table$ov.ctrl.panel.gene.type) {
            js$autoComplete(id = "ov_ctrl_panel_gene_type", contents = gene.types)
            server.envs$events$onload.reg.table$ov.ctrl.panel.gene.type <- TRUE
        }
    })
}

# def gen_server.event.onload.ge.ctrl.panel.gene.type func
gen_server.event.onload.ge.ctrl.panel.gene.type <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # set gene.types
    gene.types <- rownames(cells)
    # gen event.onload.ge.ctrl.panel.gene.type
    shinyjs::onevent(event = "click", id = "ge_ctrl_panel_gene_type", {
        if (!server.envs$events$onload.reg.table$ge.ctrl.panel.gene.type) {
            js$autoComplete(id = "ge_ctrl_panel_gene_type", contents = gene.types)
            server.envs$events$onload.reg.table$ge.ctrl.panel.gene.type <- TRUE
        }
    })
}

# def gen_server.event.onload.ge.ctrl.panel.cell.type func
gen_server.event.onload.ge.ctrl.panel.cell.type <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # set cell.types
    cell.types <- levels(unique(cells$cell_type_refined))
    # gen event.onload.ge.ctrl.panel.cell.type
    shinyjs::onevent(event = "click", id = "ge_ctrl_panel_cell_type", {
        if (!server.envs$events$onload.reg.table$ge.ctrl.panel.cell.type) {
            js$autoComplete(id = "ge_ctrl_panel_cell_type", contents = cell.types)
            server.envs$events$onload.reg.table$ge.ctrl.panel.cell.type <- TRUE
        }
    })
}

# def gen_server.event.onload func
gen_server.event.onload <- function(input, server.params, server.envs) {
    ## gen onload event for tab1
    # gen event.onload.ov.ctrl.panel.gene.type
    gen_server.event.onload.ov.ctrl.panel.gene.type(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    ## gen onload event for tab3
    # gen event.onload.ge.ctrl.panel.gene.type
    gen_server.event.onload.ge.ctrl.panel.gene.type(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    # gen event.onload.ge.ctrl.panel.cell.type
    gen_server.event.onload.ge.ctrl.panel.cell.type(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
}

