##################################
# Created on 12:21, Nov. 7th, 2020
# Author: fassial
# Filename: components.R
##################################
# dep
library(shiny)
library(shinyjs)
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
    # init server envs
    de.ctrl.panel.types <- server.envs$envs$de.ctrl.panel.types
    de.ctrl.panel.conds.left <- server.envs$envs$de.ctrl.panel.conds.left
    de.ctrl.panel.conds.right <- server.envs$envs$de.ctrl.panel.conds.right
    ## gen de.ctrl.panel.entry
    # gen factor
    factor <- shiny::column(2, offset = 0, div(style="
        text-align:right;
    ", shiny::helpText(paste0(de.ctrl.panel.types[entry.no], ":"))))
    # get factor.levels
    factor.levels <- levels(factor(eval(parse(
        text = paste0("metadata %>% .[[\'",de.ctrl.panel.types[entry.no],"\']]")
    ))))
    # gen cond.left
    cond.left <- shiny::column(4, offset = 0, gen_comp.de.ctrl.panel.entry.cond(
        input = input,
        server.params = server.params,
        server.envs = server.envs,
        entry.no = entry.no,
        cond.type = "left"
    ))
    # gen cond.right
    cond.right <- shiny::column(4, offset = 0, gen_comp.de.ctrl.panel.entry.cond(
        input = input,
        server.params = server.params,
        server.envs = server.envs,
        entry.no = entry.no,
        cond.type = "right"
    ))
    # gen delete.button
    delete.button <- shiny::column(2, offset = 0, shiny::actionButton(
        inputId = paste0("de.ctrl.panel.entry.delete.button", entry.no),
        label = "Delete",
        class = "btn-danger"
    ))
    ## reg event
    # reg delete.button onclick event
    shinyjs::onclick(id = paste0("de.ctrl.panel.entry.delete.button", entry.no), {
        server.envs$envs$de.ctrl.panel.types <- server.envs$envs$de.ctrl.panel.types[-entry.no]
        server.envs$envs$de.ctrl.panel.conds.left <- server.envs$envs$de.ctrl.panel.conds.left[-entry.no]
        server.envs$envs$de.ctrl.panel.conds.right <- server.envs$envs$de.ctrl.panel.conds.right[-entry.no]
        print("comp.delete:")
        print(server.envs$envs$de.ctrl.panel.types)
        print(server.envs$envs$de.ctrl.panel.conds.left)
        print(server.envs$envs$de.ctrl.panel.conds.right)
    })
    # gen de.ctrl.panel.entry
    de.ctrl.panel.entry <- shiny::fluidRow(
        factor,
        cond.left,
        cond.right,
        delete.button
    )
    return(de.ctrl.panel.entry)
}

# def gen_comp.de.ctrl.panel.entry.cond func
gen_comp.de.ctrl.panel.entry.cond <- function(input, server.params, server.envs, entry.no, cond.type) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # get de.ctrl.panel.types
    de.ctrl.panel.types <- server.envs$envs$de.ctrl.panel.types
    de.ctrl.panel.conds.left <- server.envs$envs$de.ctrl.panel.conds.left
    de.ctrl.panel.conds.right <- server.envs$envs$de.ctrl.panel.conds.right
    # get factor.levels
    factor.levels <-  levels(factor(eval(parse(
        text = paste0("metadata %>% .[[\'",de.ctrl.panel.types[entry.no],"\']]")
    ))))
    # gen cond.buttons
    cond.buttons <- lapply(seq_len(length(factor.levels)), function(i) {
        if (cond.type == "left") {
            if (factor.levels[i] == de.ctrl.panel.conds.left[entry.no]) {
                shiny::actionButton(
                    inputId = paste0("de.ctrl.panel.entry.", entry.no, ".cond.", cond.type, ".", i),
                    label = factor.levels[i],
                    class = "btn-primary"
                )
            } else {
                shiny::actionButton(
                    inputId = paste0("de.ctrl.panel.entry.", entry.no, ".cond.", cond.type, ".", i),
                    label = factor.levels[i]
                )
            }
        } else {
            if (factor.levels[i] == de.ctrl.panel.conds.right[entry.no]) {
                shiny::actionButton(
                    inputId = paste0("de.ctrl.panel.entry.", entry.no, ".cond.", cond.type, ".", i),
                    label = factor.levels[i],
                    class = "btn-primary"
                )
            } else {
                shiny::actionButton(
                    inputId = paste0("de.ctrl.panel.entry.", entry.no, ".cond.", cond.type, ".", i),
                    label = factor.levels[i]
                )
            }
        }
    })
    # reg onclick event
    cond.buttons.event <- lapply(seq_len(length(cond.buttons)), function(i) {
        shinyjs::onclick(id = paste0("de.ctrl.panel.entry.", entry.no, ".cond.", cond.type, ".", i), {
            if (cond.type == "left") {
                server.envs$envs$de.ctrl.panel.conds.left[entry.no] <- factor.levels[i]
            } else {
                server.envs$envs$de.ctrl.panel.conds.right[entry.no] <- factor.levels[i]
            }
            print(factor.levels[i])
        })
    })
    # gen de.ctrl.panel.entry.cond
    de.ctrl.panel.entry.cond <- do.call(shiny::wellPanel, cond.buttons)
    return(de.ctrl.panel.entry.cond)
}

