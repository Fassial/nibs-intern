###################################
# Created on 11:10, Nov. 10th, 2020
# Author: fassial
# Filename: outputs.tab.1.R
###################################
# dep
library(shiny)
library(plotly)
library(Seurat)
library(shinyjs)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))
source(file.path(DIR.SERVER.OUTPUTS, "outputs.Rh"))

# macro

# def gen_server.output.ov.ctrl.panel.plot.type func
gen_server.output.ov.ctrl.panel.plot.type <- function(input, server.params, server.envs) {
    # set plot.types
    plot.types <- c(
        "UMAP"="UMAP",
        "TSNE"="TSNE",
        "Gene expression"="GENE"
    )
    # gen output.ov.ctrl.panel.plot.type
    output.ov.ctrl.panel.plot.type <- shiny::renderUI({
        shiny::selectInput(
            inputId = "ov.ctrl.panel.plot.type",
            label = "Type of Figure:",
            choices = plot.types
        )
    })
    # observe event
    shiny::observeEvent(input$ov.ctrl.panel.plot.type, {
        if (input$ov.ctrl.panel.plot.type == "UMAP") {
            shinyjs::enable("ov.ctrl.panel.legend.toggle")
            shinyjs::disable("ov.ctrl.panel.feature.type")
        } else if (input$ov.ctrl.panel.plot.type == "TSNE") {
            shinyjs::enable("ov.ctrl.panel.legend.toggle")
            shinyjs::disable("ov.ctrl.panel.feature.type")
        } else if (input$ov.ctrl.panel.plot.type == "GENE") {
            shinyjs::disable("ov.ctrl.panel.legend.toggle")
            shinyjs::enable("ov.ctrl.panel.feature.type")
        }
    })
    return(output.ov.ctrl.panel.plot.type)
}

# def gen_server.output.ov.ctrl.panel.cond.highlight func
gen_server.output.ov.ctrl.panel.cond.highlight <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    char.vars <- server.params$char.vars
    num.vars <- server.params$num.vars
    # gen output.ov.ctrl.panel.cond.highlight
    output.ov.ctrl.panel.cond.highlight <- shiny::renderUI({
        if (length(input$ov.ctrl.panel.highlight.type) == 0) {
            # render nothing
        } else if (input$ov.ctrl.panel.highlight.type %in% char.vars) {
            shiny::selectInput(
                inputId = "ov.ctrl.panel.cond.highlight.value", 
                label = "", 
                choices = levels(factor(deframe(cells[[input$ov.ctrl.panel.highlight.type]])))
            )
        } else if (input$ov.ctrl.panel.highlight.type %in% num.vars) {
            min_val <- min(Seurat::FetchData(cells, vars = input$ov.ctrl.panel.highlight.type, slot = "counts")); min_digit <- floor(log10(min_val))
            max_val <- max(Seurat::FetchData(cells, vars = input$ov.ctrl.panel.highlight.type, slot = "counts")); max_digit <- floor(log10(max_val))
            shiny::sliderInput(
                inputId = "ov.ctrl.panel.cond.highlight.threshold", 
                label = "Threshold:",
                min = floor(min_val/10^min_digit)*10^min_digit,
                max = ceiling(max_val/10^max_digit)*10^max_digit, # didn't work very well at certain values (i.e. nFeature_RNA)
                value = max(Seurat::FetchData(cells, vars = input$ov.ctrl.panel.highlight.type, slot = "counts"))
            )
        }
    })
    return(output.ov.ctrl.panel.cond.highlight)
}

# def gen_server.output.ov.ctrl.panel.highlight.toggle func
gen_server.output.ov.ctrl.panel.highlight.toggle <- function(input, server.params, server.envs) {
    # gen output.ov.ctrl.panel.highlight.toggle
    output.ov.ctrl.panel.highlight.toggle <- shiny::renderUI({
        shiny::checkboxInput(
            inputId = "ov.ctrl.panel.highlight.toggle",
            label = "Toggle highlight",
            value = FALSE
        )
    })
    # observe event
    shiny::observeEvent(input$ov.ctrl.panel.highlight.toggle, {
        if (input$ov.ctrl.panel.highlight.toggle) {
            shinyjs::enable("ov.ctrl.panel.highlight.type")
            shinyjs::enable("ov.ctrl.panel.cond.highlight.value")
            shinyjs::enable("ov.ctrl.panel.cond.highlight.threshold")
        } else {
            shinyjs::disable("ov.ctrl.panel.highlight.type")
            shinyjs::disable("ov.ctrl.panel.cond.highlight.value")
            shinyjs::disable("ov.ctrl.panel.cond.highlight.threshold")
        }
    })
    return(output.ov.ctrl.panel.highlight.toggle)
}

# def gen_server.output.ov.plot.panel.dimplot func
gen_server.output.ov.plot.panel.dimplot <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    char.vars <- server.params$char.vars
    num.vars <- server.params$num.vars
    # gen output.ov.plot.panel.dimplot
    output.ov.plot.panel.dimplot <- shiny::renderPlot({
        if ((length(input$ov.ctrl.panel.assay.type) == 0)
         || (length(input$ov.ctrl.panel.plot.type) == 0)
         || (length(input$ov.ctrl.panel.highlight.type) == 0)
         || (length(input$ov.ctrl.panel.feature.type) == 0)) {
            # render nothing
        } else if (input$ov.ctrl.panel.assay.type == "Integrated") {
            if (input$ov.ctrl.panel.plot.type == "UMAP") {
                if (input$ov.ctrl.panel.highlight.toggle) {
                    if (input$ov.ctrl.panel.highlight.type == "") {
                        cells.hl <- ""
                    } else if (input$ov.ctrl.panel.highlight.type %in% num.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type, ">=", input$ov.ctrl.panel.cond.highlight.threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$ov.ctrl.panel.highlight.type %in% char.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,"==","\'",input$ov.ctrl.panel.cond.highlight.value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "umap.int",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::DimPlot(cells,
                        reduction = "umap.int",
                        group.by = input$ov.ctrl.panel.legend.type,
                        label = input$ov.ctrl.panel.legend.toggle,
                        label.size = 4
                    ) + Seurat::NoLegend()
                }
            } else if (input$ov.ctrl.panel.plot.type == "TSNE") {
                if (input$ov.ctrl.panel.highlight.toggle) {
                    if (input$ov.ctrl.panel.highlight.type == "") {
                        cells.hl <- ""
                    } else if (input$ov.ctrl.panel.highlight.type %in% num.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,">=",input$ov.ctrl.panel.cond.highlight.threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$ov.ctrl.panel.highlight.type %in% char.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,"==","\'",input$ov.ctrl.panel.cond.highlight.value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "tsne.int",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::DimPlot(cells,
                        reduction = "tsne.int",
                        group.by = input$ov.ctrl.panel.legend.type,
                        label = input$ov.ctrl.panel.legend.toggle,
                        label.size = 4
                    ) + Seurat::NoLegend()
                }
            } else if (input$ov.ctrl.panel.plot.type == "GENE") {
                if (input$ov.ctrl.panel.highlight.toggle) {
                    if (input$ov.ctrl.panel.highlight.type == "") {
                        cells.hl <- ""
                    } else if (input$ov.ctrl.panel.highlight.type %in% num.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,">=",input$ov.ctrl.panel.cond.highlight.threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$ov.ctrl.panel.highlight.type %in% char.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,"==","\'",input$ov.ctrl.panel.cond.highlight.value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "umap.int",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::FeaturePlot(cells,
                        reduction = "umap.int",
                        input$ov.ctrl.panel.feature.type
                    )
                }
            }
        } else if (input$ov.ctrl.panel.assay.type == "Un-integrated") {
            if (input$ov.ctrl.panel.plot.type == "UMAP") {
                if (input$ov.ctrl.panel.highlight.toggle) {
                    if (input$ov.ctrl.panel.highlight.type == "") {
                        cells.hl <- ""
                    } else if (input$ov.ctrl.panel.highlight.type %in% num.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,">=",input$ov.ctrl.panel.cond.highlight.threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$ov.ctrl.panel.highlight.type %in% char.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,"==","\'",input$ov.ctrl.panel.cond.highlight.value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "umap",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::DimPlot(cells,
                        reduction = "umap",
                        group.by = input$ov.ctrl.panel.legend.type,
                        label = input$ov.ctrl.panel.legend.toggle,
                        label.size = 4
                    ) + Seurat::NoLegend()
                }
            } else if (input$ov.ctrl.panel.plot.type == "TSNE") {
                if (input$ov.ctrl.panel.highlight.toggle) {
                    if (input$ov.ctrl.panel.highlight.type == "") {
                        cells.hl <- ""
                    } else if (input$ov.ctrl.panel.highlight.type %in% num.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,">=",input$ov.ctrl.panel.cond.highlight.threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$ov.ctrl.panel.highlight.type %in% char.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,"==","\'",input$ov.ctrl.panel.cond.highlight.value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "tsne",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::DimPlot(cells,
                        reduction = "tsne",
                        group.by = input$ov.ctrl.panel.legend.type,
                        label = input$ov.ctrl.panel.legend.toggle,
                        label.size = 4
                    ) + Seurat::NoLegend()
                }
            } else if (input$ov.ctrl.panel.plot.type == "GENE") {
                if (input$ov.ctrl.panel.highlight.toggle) {
                    if (input$ov.ctrl.panel.highlight.type == "") {
                        cells.hl <- ""
                    } else if (input$ov.ctrl.panel.highlight.type %in% num.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,">=",input$ov.ctrl.panel.cond.highlight.threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$ov.ctrl.panel.highlight.type %in% char.vars) {
                        hl <- paste0(input$ov.ctrl.panel.highlight.type,"==","\'",input$ov.ctrl.panel.cond.highlight.value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "umap",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::FeaturePlot(cells,
                        reduction = "umap",
                        input$ov.ctrl.panel.feature.type
                    )
                }
            }
        }
    })
    return(output.ov.plot.panel.dimplot)
}

# def gen_server.output.ov.plot.panel.hoverplot func
gen_server.output.ov.plot.panel.hoverplot <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # gen output.ov.plot.panel.hoverplot
    output.ov.plot.panel.hoverplot <- plotly::renderPlotly({
        Seurat::DefaultAssay(cells) <- "RNA"
        if ((length(input$ov.ctrl.panel.assay.type) == 0)
         || (length(input$ov.ctrl.panel.plot.type) == 0)
         || (length(input$ov.ctrl.panel.fetch.vars) == 0)
         || (length(input$ov.ctrl.panel.feature.type) == 0)) {
            # render nothing
        } else if (input$ov.ctrl.panel.assay.type == "Integrated") {
            if (input$ov.ctrl.panel.plot.type == "UMAP") {
                Seurat::HoverLocator(
                    Seurat::DimPlot(cells,
                        reduction = "umap.int"
                    ) + Seurat::NoLegend(),
                    information = Seurat::FetchData(cells,
                        vars = input$ov.ctrl.panel.fetch.vars,
                        slot = "counts"
                    )
                )
            } else if (input$ov.ctrl.panel.plot.type == "TSNE") {
                Seurat::HoverLocator(
                    Seurat::DimPlot(cells,
                        reduction = "tsne.int"
                    ) + Seurat::NoLegend(),
                    information = Seurat::FetchData(cells,
                        vars = input$ov.ctrl.panel.fetch.vars,
                        slot = "counts"
                    )
                )
            } else if (input$ov.ctrl.panel.plot.type == "GENE") {
                Seurat::HoverLocator(
                    Seurat::FeaturePlot(cells,
                        reduction = "umap.int",
                        input$ov.ctrl.panel.feature.type
                    ),
                    information = Seurat::FetchData(cells,
                        vars = input$ov.ctrl.panel.fetch.vars,
                        slot = "counts"
                    )
                )
            }
        } else if (input$ov.ctrl.panel.assay.type == "Un-integrated") {
            if (input$ov.ctrl.panel.plot.type == "UMAP") {
                Seurat::HoverLocator(
                    Seurat::DimPlot(cells,
                        reduction = "umap"
                    ) + Seurat::NoLegend(),
                    information = Seurat::FetchData(cells,
                        vars = input$ov.ctrl.panel.fetch.vars,
                        slot = "counts"
                    )
                )
            } else if (input$ov.ctrl.panel.plot.type == "TSNE") {
                Seurat::HoverLocator(
                    Seurat::DimPlot(cells,
                        reduction = "tsne"
                    ) + Seurat::NoLegend(),
                    information = Seurat::FetchData(cells,
                        vars = input$ov.ctrl.panel.fetch.vars,
                        slot = "counts"
                    )
                )
            } else if (input$ov.ctrl.panel.plot.type == "GENE") {
                Seurat::HoverLocator(
                    Seurat::FeaturePlot(cells,
                        reduction = "umap",
                        input$ov.ctrl.panel.feature.type
                    ),
                    information = Seurat::FetchData(cells,
                        vars = input$ov.ctrl.panel.fetch.vars,
                        slot = "counts"
                    )
                )
            }
        }
    })
    return(output.ov.plot.panel.hoverplot)
}

# def gen_server.outputs.tab.1 func
gen_server.outputs.tab.1 <- function(input, server.params, server.envs, output) {
    ## set tab.1 outputs
    # set tab.1.panel.2
    output$tab.1.panel.2.output.2 <- gen_server.output.ov.ctrl.panel.plot.type(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    # set tab.1.panel.3
    output$tab.1.panel.3.output.2 <- gen_server.output.ov.ctrl.panel.cond.highlight(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    output$tab.1.panel.3.output.3 <- gen_server.output.ov.ctrl.panel.highlight.toggle(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    # set tab.1.panel.5
    output$tab.1.panel.5.output.1 <- gen_server.output.ov.plot.panel.dimplot(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    output$tab.1.panel.5.output.2 <- gen_server.output.ov.plot.panel.hoverplot(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
}

