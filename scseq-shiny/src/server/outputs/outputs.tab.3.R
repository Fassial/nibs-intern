###################################
# Created on 15:11, Nov. 10th, 2020
# Author: fassial
# Filename: outputs.tab.3.R
###################################
# dep
library(shiny)
library(Seurat)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))
source(file.path(DIR.SERVER.OUTPUTS, "outputs.Rh"))

# macro

# def gen_server.output.ge.ctrl.panel.gene.button func
gen_server.output.ge.ctrl.panel.gene.button <- function(input, server.params, server.envs) {
    # gen output.ge.ctrl.panel.gene.button
    output.ge.ctrl.panel.gene.button <- shiny::renderUI({
        shiny::div(style="
            text-align:center;
        ", shiny::actionButton(
            inputId = "ge.ctrl.panel.gene.button",
            label = "Search",
            class = "btn-primary"
        ))
    })
    # reg onclick event
    shinyjs::onclick(id = "ge.ctrl.panel.gene.button", {
        server.envs$envs$ge.ctrl.panel.gene.type <- input$ge.ctrl.panel.gene.type
    })
    return(output.ge.ctrl.panel.gene.button)
}

# def gen_server.output.ge.plot.panel.cellplot func
gen_server.output.ge.plot.panel.cellplot <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # gen output.ge.plot.panel.cellplot
    output.ge.plot.panel.cellplot <- shiny::renderPlot({
        # init server env
        ge.ctrl.panel.gene.type <- server.envs$envs$ge.ctrl.panel.gene.type
        # gen VlnPlot
        if ((length(ge.ctrl.panel.gene.type) == 0)
         || (ge.ctrl.panel.gene.type == TEXT.INPUT.NONE)) {
            # render nothing
        } else {
            Seurat::VlnPlot(
                object = cells,
                features = c(ge.ctrl.panel.gene.type),
                group.by = "cell_type"
            )
        }
    })
    return(output.ge.plot.panel.cellplot)
}

# def gen_server.output.ge.plot.panel.groupplot func
gen_server.output.ge.plot.panel.groupplot <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # gen output.ge.plot.panel.groupplot
    output.ge.plot.panel.groupplot <- shiny::renderPlot({
        # init server env
        ge.ctrl.panel.gene.type <- server.envs$envs$ge.ctrl.panel.gene.type
        # gen VlnPlot
        # gen VlnPlot
        if (((length(ge.ctrl.panel.gene.type) == 0) || (ge.ctrl.panel.gene.type == TEXT.INPUT.NONE))
         || ((length(input$ge.ctrl.panel.group.type) == 0) || (input$ge.ctrl.panel.group.type == SELECT.INPUT.NONE))
         || ((length(input$ge.ctrl.panel.cell.type) == 0) || (input$ge.ctrl.panel.cell.type == SELECT.INPUT.NONE))) {
            # render nothing
        } else {
            Seurat::VlnPlot(
                object = cells[which(cells$cell_type==input$ge.ctrl.panel.cell.type)],
                features = c(ge.ctrl.panel.gene.type),
                group.by = input$ge.ctrl.panel.group.type
            )
        }
    })
    return(output.ge.plot.panel.groupplot)
}

# def gen_server.outputs.tab.3 func
gen_server.outputs.tab.3 <- function(input, server.params, server.envs, output) {
    ## set tab.3 outputs
    # set tab.3.panel.1
    output$tab.3.panel.1.output.2 <- gen_server.output.ge.ctrl.panel.gene.button(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    output$tab.3.panel.1.output.3 <- gen_server.output.ge.plot.panel.cellplot(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    # set tab.3.panel.2
    output$tab.3.panel.2.output.3 <- gen_server.output.ge.plot.panel.groupplot(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
}

