###################################
# Created on 12:31, Nov. 10th, 2020
# Author: fassial
# Filename: outputs.tab.2.R
###################################
# dep
library(shiny)
library(Seurat)
library(shinyjs)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))
source(file.path(DIR.SERVER.OUTPUTS, "outputs.Rh"))

# macro

# def gen_server.output.de.ctrl.panel.add func
gen_server.output.de.ctrl.panel.add <- function(input, server.params, server.envs) {
    # init server params
    cat.vars <- server.params$cat.vars
    # gen output.de.ctrl.panel.add
    output.de.ctrl.panel.add <- shiny::renderUI({
        shiny::fluidRow(
            shiny::column(2, offset = 3, shiny::div(style="
                text-align:right;
            ", shiny::helpText("Find markers by:"))),
            shiny::column(3, offset = 0, shiny::selectInput(
                inputId = "de.ctrl.panel.add.type",
                label = NULL,
                choices = c(SELECT.INPUT.NONE, cat.vars)
            )),
            shiny::column(1, offset = 0, shiny::actionButton(
                inputId = "de.ctrl.panel.add.button",
                label = "Add"
            ))
        )
    })
    ## onclick event
    # de.ctrl.panel.add
    shinyjs::onclick(id = "de.ctrl.panel.add.button", {
        # init server envs
        de.ctrl.panel.conds <- server.envs$envs$de.ctrl.panel.conds
        if (input$de.ctrl.panel.add.type == SELECT.INPUT.NONE) {
            # do nothing
        } else if (length(de.ctrl.panel.conds) == 0) {
            # update server.envs$envs$de.ctrl.panel.conds
            server.envs$envs$de.ctrl.panel.conds[[input$de.ctrl.panel.add.type]] <- list(
                cond.left = BUTTON.INPUT.NONE,
                cond.right = BUTTON.INPUT.NONE
            )
        } else {
            if (!(input$de.ctrl.panel.add.type %in% names(server.envs$envs$de.ctrl.panel.conds))) {
                # update server.envs$envs$de.ctrl.panel.conds
                server.envs$envs$de.ctrl.panel.conds[[input$de.ctrl.panel.add.type]] <- list(
                    cond.left = BUTTON.INPUT.NONE,
                    cond.right = BUTTON.INPUT.NONE
                )
            }
        }
    })
    return(output.de.ctrl.panel.add)
}

# def gen_server.output.de.ctrl.panel.entries func
gen_server.output.de.ctrl.panel.entries <- function(input, server.params, server.envs) {
    # gen output.de.ctrl.panel.entries
    output.de.ctrl.panel.entries <- shiny::renderUI({
        # init server envs
        de.ctrl.panel.conds <- server.envs$envs$de.ctrl.panel.conds
        ## set de.ctrl.panel.entries
        # set de.ctrl.panel.entries.title
        de.ctrl.panel.entries.title <- list(shiny::fluidRow(
            column(2, offset = 0, shiny::div(style="
                text-align:right;
            ", shiny::helpText("Find markers by:"))),
            column(4, offset = 0, shiny::div(style="
                text-align:left;
            ", shiny::helpText("Marker 1:"))),
            column(4, offset = 0, shiny::div(style="
                text-align:left;
            ", shiny::helpText("Marker 2:")))
        ))
        # set de.ctrl.panel.entries.content
        de.ctrl.panel.entries.content <- lapply(names(de.ctrl.panel.conds), function(name) {
            gen_server.comp.de.ctrl.panel.entry(
                input = input,
                server.params = server.params,
                server.envs = server.envs,
                entry.name = name
            )
        })
        # gen de.ctrl.panel.entries
        de.ctrl.panel.entries <- c(de.ctrl.panel.entries.title, de.ctrl.panel.entries.content)
        do.call(shiny::fluidRow, de.ctrl.panel.entries)
    })
    return(output.de.ctrl.panel.entries)
}

# def gen_server.output.de.plot.panel.preview.left func
gen_server.output.de.plot.panel.preview.left <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # gen output.de.plot.panel.preview.left
    output.de.plot.panel.preview.left <- shiny::renderPlot({
        # init server envs
        de.ctrl.panel.conds <- server.envs$envs$de.ctrl.panel.conds
        if (input$de.ctrl.panel.de.type == "Multiple") {
            if (length(de.ctrl.panel.conds) == 0) {
                Seurat::DimPlot(cells,
                    reduction = input$de.ctrl.panel.preview.type,
                    cells.highlight = ""
                ) + Seurat::NoLegend()
            } else {
                Seurat::DimPlot(cells,
                    reduction = input$de.ctrl.panel.preview.type,
                    group.by = names(de.ctrl.panel.conds)[1]
                ) + Seurat::NoLegend()
            }
        } else {
            f <- names(de.ctrl.panel.conds)
            l <- lapply(names(de.ctrl.panel.conds), function(name) {
                cond.left <- de.ctrl.panel.conds[[name]]$cond.left
                if (cond.left == SELECT.INPUT.NONE) {
                    cond.left <- ""
                }
                return(cond.left)
            })
            # get cells chosen
            cells.hl_preview <- server.select_cells(
                server.params = server.params,
                factor.lists = f,
                value.lists = l
            )
            # plot output
            Seurat::DimPlot(cells,
                reduction = input$de.ctrl.panel.preview.type,
                cells.highlight = cells.hl_preview,
                cols.highlight = "#CC0000"
            ) + Seurat::NoLegend()
        }
    })
    return(output.de.plot.panel.preview.left)
}

# def gen_server.output.de.plot.panel.preview.right func
gen_server.output.de.plot.panel.preview.right <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # gen output.de.plot.panel.preview.right
    output.de.plot.panel.preview.right <- shiny::renderPlot({
        # init server envs
        de.ctrl.panel.conds <- server.envs$envs$de.ctrl.panel.conds
        if (input$de.ctrl.panel.de.type != "Multiple") {
            f <- names(de.ctrl.panel.conds)
            l <- lapply(names(de.ctrl.panel.conds), function(name) {
                cond.right <- de.ctrl.panel.conds[[name]]$cond.right
                if (cond.right == SELECT.INPUT.NONE) {
                    cond.right <- ""
                }
                return(cond.right)
            })
            # get cells chosen
            cells.hl_preview <- server.select_cells(
                server.params = server.params,
                factor.lists = f,
                value.lists = l
            )
            # plot output
            Seurat::DimPlot(cells,
                reduction = input$de.ctrl.panel.preview.type,
                cells.highlight = cells.hl_preview,
                cols.highlight = "#FFCC00"
            ) + Seurat::NoLegend()
        }
    })
    return(output.de.plot.panel.preview.right)
}

# def gen_server.output.de.plot.panel.result func
gen_server.output.de.plot.panel.result <- function(input, server.params, server.envs) {
    # init server events
    de.result <- server.envs$events$de.result
    # gen output.de.plot.panel.result
    output.de.plot.panel.result <- DT::renderDT({
        DT::datatable(de.result(),
            extensions = 'Buttons',
            options = list(
                dom = 'Bfrtip',
                buttons = list("copy",
                    list(
                        extend = "collection",
                        text = 'Download DE result table',
                        action = DT::JS("function ( e, dt, node, config ) {
                            Shiny.setInputValue('test', true, {priority: 'event'});
                        }")
                    )
                )
            )
        )
    })
    return(output.de.plot.panel.result)
}

# def gen_server.output.de.ctrl.panel.download.button func
gen_server.output.de.ctrl.panel.download.button <- function(input, server.params, server.envs) {
    # init server events
    de.result <- server.envs$events$de.result
    # gen output.de.ctrl.panel.download.button
    output.de.ctrl.panel.download.button <- shiny::downloadHandler(
        filename = function() {
            paste("data-", Sys.Date(), ".csv", sep="")
        },
        content = function(file) {
            write.csv(de.result(), file)
        }
    )
    return(output.de.ctrl.panel.download.button)
}

# def gen_server.outputs.tab.2 func
gen_server.outputs.tab.2 <- function(input, server.params, server.envs, output) {
    ## set tab.2 outputs
    # set tab.2.panel.1
    output$tab.2.panel.1.output.4 <- gen_server.output.de.ctrl.panel.download.button(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    # set tab.2.panel.2
    output$tab.2.panel.2.output.1 <- gen_server.output.de.plot.panel.preview.left(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    output$tab.2.panel.2.output.2 <- gen_server.output.de.plot.panel.preview.right(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    output$tab.2.panel.2.output.3 <- gen_server.output.de.ctrl.panel.add(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    output$tab.2.panel.2.output.4 <- gen_server.output.de.ctrl.panel.entries(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    # set tab.2.panel.3
    output$tab.2.panel.3.output.1 <- gen_server.output.de.plot.panel.result(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    # download.panel
    # TODO
}

