##################################
# Created on 12:21, Nov. 7th, 2020
# Author: fassial
# Filename: components.R
##################################
# dep
library(shiny)
library(shinyjs)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))

# macro

# def gen_server.comp.de.ctrl.panel.entry func
gen_server.comp.de.ctrl.panel.entry <- function(input, server.params, server.envs, entry.name) {
    # init server params
    cells <- server.params$cells
    # set metadata
    metadata <- cells@meta.data
    # init server envs
    de.ctrl.panel.conds <- server.envs$envs$de.ctrl.panel.conds
    ## gen de.ctrl.panel.entry
    # gen factor
    factor <- shiny::column(2, offset = 0, shiny::div(style="
        text-align:right;
    ", shiny::helpText(paste0(entry.name, ":"))))
    # get factor.levels
    factor.levels <- levels(factor(eval(parse(
        text = paste0("metadata$", entry.name)
    ))))
    # gen cond.left
    cond.left <- shiny::column(4, offset = 0, gen_server.comp.de.ctrl.panel.entry.cond(
        input = input,
        server.params = server.params,
        server.envs = server.envs,
        entry.name = entry.name,
        cond.type = "left"
    ))
    # gen cond.right
    cond.right <- shiny::column(4, offset = 0, gen_server.comp.de.ctrl.panel.entry.cond(
        input = input,
        server.params = server.params,
        server.envs = server.envs,
        entry.name = entry.name,
        cond.type = "right"
    ))
    # gen delete.button
    delete.button <- shiny::column(2, offset = 0, shiny::actionButton(
        inputId = paste0("de.ctrl.panel.entry.delete.button.", entry.name),
        label = "Delete",
        class = "btn-danger"
    ))
    ## reg event
    # reg delete.button onclick event
    if (is.null(server.envs$events$onload.reg.table[[paste0("de.ctrl.panel.entry.delete.button.", entry.name)]])) {
        server.envs$events$onload.reg.table[[paste0("de.ctrl.panel.entry.delete.button.", entry.name)]] <- TRUE
        shinyjs::onclick(id = paste0("de.ctrl.panel.entry.delete.button.", entry.name), {
            server.envs$envs$de.ctrl.panel.conds[[entry.name]] <- NULL
        })
    }
    # gen de.ctrl.panel.entry
    de.ctrl.panel.entry <- shiny::fluidRow(
        factor,
        cond.left,
        cond.right,
        delete.button
    )
    return(de.ctrl.panel.entry)
}

# def gen_server.comp.de.ctrl.panel.entry.cond func
gen_server.comp.de.ctrl.panel.entry.cond <- function(input, server.params, server.envs, entry.name, cond.type) {
    # init server params
    cells <- server.params$cells
    # set metadata
    metadata <- cells@meta.data
    # init server envs
    de.ctrl.panel.conds <- server.envs$envs$de.ctrl.panel.conds
    # get factor.levels
    factor.levels <-  levels(factor(eval(parse(
        text = paste0("metadata$", entry.name)
    ))))
    # gen cond.buttons
    cond.buttons <- lapply(seq_len(length(factor.levels)), function(i) {
        if (cond.type == "left") {
            if (factor.levels[i] == de.ctrl.panel.conds[[entry.name]]$cond.left) {
                shiny::actionButton(
                    inputId = paste0("de.ctrl.panel.entry.", entry.name, ".cond.", cond.type, ".", i),
                    label = factor.levels[i],
                    class = "btn-primary"
                )
            } else {
                shiny::actionButton(
                    inputId = paste0("de.ctrl.panel.entry.", entry.name, ".cond.", cond.type, ".", i),
                    label = factor.levels[i]
                )
            }
        } else {
            if (factor.levels[i] == de.ctrl.panel.conds[[entry.name]]$cond.right) {
                shiny::actionButton(
                    inputId = paste0("de.ctrl.panel.entry.", entry.name, ".cond.", cond.type, ".", i),
                    label = factor.levels[i],
                    class = "btn-primary"
                )
            } else {
                shiny::actionButton(
                    inputId = paste0("de.ctrl.panel.entry.", entry.name, ".cond.", cond.type, ".", i),
                    label = factor.levels[i]
                )
            }
        }
    })
    # reg onclick event
    if (is.null(server.envs$events$onload.reg.table[[paste0("de.ctrl.panel.entry.", entry.name, ".cond.", cond.type)]])) {
        server.envs$events$onload.reg.table[[paste0("de.ctrl.panel.entry.", entry.name, ".cond.", cond.type)]] <- TRUE
        cond.buttons.event <- lapply(seq_len(length(cond.buttons)), function(i) {
            shinyjs::onclick(id = paste0("de.ctrl.panel.entry.", entry.name, ".cond.", cond.type, ".", i), {
                if (cond.type == "left") {
                    server.envs$envs$de.ctrl.panel.conds[[entry.name]]$cond.left <- factor.levels[i]
                } else {
                    server.envs$envs$de.ctrl.panel.conds[[entry.name]]$cond.right <- factor.levels[i]
                }
            })
        })
    }
    # gen de.ctrl.panel.entry.cond
    de.ctrl.panel.entry.cond <- do.call(shiny::wellPanel, cond.buttons)
    return(de.ctrl.panel.entry.cond)
}

