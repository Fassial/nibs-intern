##################################
# Created on 20:14, Nov. 6th, 2020
# Author: fassial
# Filename: output.R
##################################
# dep
library(shiny)
library(plotly)
library(Seurat)
# local dep
DIR.SERVER <- file.path(getwd(), "server")
source(file.path(DIR.SERVER, "utils.R"))
source(file.path(DIR.SERVER, "components.R"))

# macro
SELECT.INPUT.NONE = "--please select--"

# def gen_output.dimplot func
gen_output.dimplot <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.dimplot
    output.dimplot <- shiny::renderPlot({
        if (input$assay == "Integrated") {
            if (input$plottype == "UMAP") {
                if (input$highlight) {
                    if (input$htype == "") {
                        cells.hl <- ""
                    } else if (input$htype %in% num_vars) {
                        hl <- paste0(input$htype,">=",input$htype_threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$htype %in% char_vars) {
                        hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "umap.int",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::DimPlot(cells,
                        reduction = "umap.int",
                        group.by = input$ltype,
                        label = input$label,
                        label.size = 4
                    ) + Seurat::NoLegend()
                }
            } else if (input$plottype == "TSNE") {
                if (input$highlight) {
                    if (input$htype == "") {
                        cells.hl <- ""
                    } else if (input$htype %in% num_vars) {
                        hl <- paste0(input$htype,">=",input$htype_threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$htype %in% char_vars) {
                        hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "tsne.int",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::DimPlot(cells,
                        reduction = "tsne.int",
                        group.by = input$ltype,
                        label = input$label,
                        label.size = 4
                    ) + Seurat::NoLegend()
                }
            } else if (input$plottype == "GENE") {
                if (input$highlight) {
                    if (input$htype == "") {
                        cells.hl <- ""
                    } else if (input$htype %in% num_vars) {
                        hl <- paste0(input$htype,">=",input$htype_threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$htype %in% char_vars) {
                        hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "umap.int",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::FeaturePlot(cells,
                        reduction = "umap.int",
                        input$feature
                    )
                }
            }
        } else if (input$assay == "Un-integrated") {
            if (input$plottype == "UMAP") {
                if (input$highlight) {
                    if (input$htype == "") {
                        cells.hl <- ""
                    } else if (input$htype %in% num_vars) {
                        hl <- paste0(input$htype,">=",input$htype_threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$htype %in% char_vars) {
                        hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "umap",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::DimPlot(cells,
                        reduction = "umap",
                        group.by = input$ltype,
                        label = input$label,
                        label.size = 4
                    ) + Seurat::NoLegend()
                }
            } else if (input$plottype == "TSNE") {
                if (input$highlight) {
                    if (input$htype == "") {
                        cells.hl <- ""
                    } else if (input$htype %in% num_vars) {
                        hl <- paste0(input$htype,">=",input$htype_threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$htype %in% char_vars) {
                        hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "tsne",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::DimPlot(cells,
                        reduction = "tsne",
                        group.by = input$ltype,
                        label = input$label,
                        label.size = 4
                    ) + Seurat::NoLegend()
                }
            } else if (input$plottype == "GENE") {
                if (input$highlight) {
                    if (input$htype == "") {
                        cells.hl <- ""
                    } else if (input$htype %in% num_vars) {
                        hl <- paste0(input$htype,">=",input$htype_threshold)
                        cells.hl <- Seurat::WhichCells(cells, expression = hl, slot = "counts")
                    } else if (input$htype %in% char_vars) {
                        hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
                        cells.hl <- Seurat::WhichCells(cells, expression = hl)
                    }
                    Seurat::DimPlot(cells,
                        reduction = "umap",
                        cells.highlight = cells.hl
                    ) + Seurat::NoLegend()
                } else {
                    Seurat::FeaturePlot(cells,
                        reduction = "umap",
                        input$feature
                    )
                }
            }
        }
    })
    return(output.dimplot)
}

# def gen_output.hoverplot func
gen_output.hoverplot <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.hoverplot
    output.hoverplot <- plotly::renderPlotly({
        Seurat::DefaultAssay(cells) <- "RNA"
        if (input$assay == "Integrated") {
            if (input$plottype == "UMAP") {
                Seurat::HoverLocator(
                    Seurat::DimPlot(cells,
                        reduction = "umap.int"
                    ) + Seurat::NoLegend(),
                    information = Seurat::FetchData(cells,
                        vars = input$vars_to_fetch,
                        slot = "counts"
                    )
                )
            } else if (input$plottype == "TSNE") {
                Seurat::HoverLocator(
                    Seurat::DimPlot(cells,
                        reduction = "tsne.int"
                    ) + Seurat::NoLegend(),
                    information = Seurat::FetchData(cells,
                        vars = input$vars_to_fetch,
                        slot = "counts"
                    )
                )
            } else if (input$plottype == "GENE") {
                Seurat::HoverLocator(
                    Seurat::FeaturePlot(cells,
                        reduction = "umap.int",
                        input$feature
                    ),
                    information = Seurat::FetchData(cells,
                        vars = input$vars_to_fetch,
                        slot = "counts"
                    )
                )
            }
        } else if (input$assay == "Un-integrated") {
            if (input$plottype == "UMAP") {
                Seurat::HoverLocator(
                    Seurat::DimPlot(cells,
                        reduction = "umap"
                    ) + Seurat::NoLegend(),
                    information = Seurat::FetchData(cells,
                        vars = input$vars_to_fetch,
                        slot = "counts"
                    )
                )
            } else if (input$plottype == "TSNE") {
                Seurat::HoverLocator(
                    Seurat::DimPlot(cells,
                        reduction = "tsne"
                    ) + Seurat::NoLegend(),
                    information = Seurat::FetchData(cells,
                        vars = input$vars_to_fetch,
                        slot = "counts"
                    )
                )
            } else if (input$plottype == "GENE") {
                Seurat::HoverLocator(
                    Seurat::FeaturePlot(cells,
                        reduction = "umap",
                        input$feature
                    ),
                    information = Seurat::FetchData(cells,
                        vars = input$vars_to_fetch,
                        slot = "counts"
                    )
                )
            }
        }
    })
    return(output.hoverplot)
}

# def gen_output.conditional_highlight func
gen_output.conditional_highlight <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.conditional_highlight
    output.conditional_highlight <- shiny::renderUI({
        if (input$htype %in% char_vars) {
            shiny::selectInput(
                inputId = "htype_value", 
                label = "", 
                choices = levels(factor(deframe(cells[[input$htype]])))
            )
        } else if (input$htype %in% num_vars) {
            min_val <- min(Seurat::FetchData(cells, vars = input$htype, slot = "counts")); min_digit <- floor(log10(min_val))
            max_val <- max(Seurat::FetchData(cells, vars = input$htype, slot = "counts")); max_digit <- floor(log10(max_val))
            shiny::sliderInput(
                inputId = "htype_threshold", 
                label = "Threshold:",
                min = floor(min_val/10^min_digit)*10^min_digit,
                max = ceiling(max_val/10^max_digit)*10^max_digit, # didn't work very well at certain values (i.e. nFeature_RNA)
                value = max(Seurat::FetchData(cells, vars = input$htype, slot = "counts"))
            )
        }
    })
    return(output.conditional_highlight)
}

# def gen_output.downloadResult func
gen_output.downloadResult <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # init server events
    result <- server.envs$events$result
    # gen output.downloadResult
    output.downloadResult <- shiny::downloadHandler(
        filename = function() {
            paste("data-", Sys.Date(), ".csv", sep="")
        },
        content = function(file) {
            write.csv(result(), file)
        }
    )
    return(output.downloadResult)
}

# def gen_output.de_result func
gen_output.de_result <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # init server events
    result <- server.envs$events$result
    # gen output.de_result
    output.de_result <- DT::renderDT({  # https://github.com/rstudio/shiny/issues/2653
        DT::datatable(result(),
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
    return(output.de_result)
}

# def gen_output.preview_left func
gen_output.preview_left <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.preview_left
    output.preview_left <- shiny::renderPlot({
        # init server envs
        de.ctrl.panel.types <- server.envs$envs$de.ctrl.panel.types
        de.ctrl.panel.conds.left <- server.envs$envs$de.ctrl.panel.conds.left
        de.ctrl.panel.conds.right <- server.envs$envs$de.ctrl.panel.conds.right
        if (input$test_perform == "Multiple") {
            if (input$factor_1 == "") {
                Seurat::DimPlot(cells,
                    reduction = input$preview_type,
                    cells.highlight = ""
                ) + Seurat::NoLegend()
            } else {
                Seurat::DimPlot(cells,
                    reduction = input$preview_type,
                    group.by = input$factor_1
                ) + Seurat::NoLegend()
            }
        } else {
            f <- de.ctrl.panel.types
            l <- lapply(seq_len(length(de.ctrl.panel.types)), function(i) {
                cond.left <- de.ctrl.panel.conds.left[i]
                if (cond.left == SELECT.INPUT.NONE) {
                    cond.left <- ""
                }
                return(cond.left)
            })
            # get cells chosen
            cells.hl_preview <- parse_cells_chosen(f, l, server.params = server.params)
            # plot output
            Seurat::DimPlot(cells,
                reduction = input$preview_type,
                cells.highlight = cells.hl_preview,
                cols.highlight = "#CC0000"
            ) + Seurat::NoLegend()
        }
    })
    return(output.preview_left)
}

# def gen_output.preview_right func
gen_output.preview_right <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.preview_right
    output.preview_right <- shiny::renderPlot({
        # init server envs
        de.ctrl.panel.types <- server.envs$envs$de.ctrl.panel.types
        de.ctrl.panel.conds.left <- server.envs$envs$de.ctrl.panel.conds.left
        de.ctrl.panel.conds.right <- server.envs$envs$de.ctrl.panel.conds.right
        if (input$test_perform != "Multiple") {
            f <- de.ctrl.panel.types
            l <- lapply(seq_len(length(de.ctrl.panel.types)), function(i) {
                cond.right <- de.ctrl.panel.conds.right[i]
                if (cond.right == SELECT.INPUT.NONE) {
                    cond.right <- ""
                }
                return(cond.right)
            })
            # get cells chosen
            cells.hl_preview <- parse_cells_chosen(f, l, server.params = server.params)
            # plot output
            Seurat::DimPlot(cells,
                reduction = input$preview_type,
                cells.highlight = cells.hl_preview,
                cols.highlight = "#FFCC00"
            ) + Seurat::NoLegend()
        }
    })
    return(output.preview_right)
}

# def gen_output.de.ctrl.panel func
gen_output.de.ctrl.panel <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # init server envs
    de.ctrl.panel.types <- server.envs$vars$de.ctrl.panel.types
    # gen output.de.ctrl.panel
    output.de.ctrl.panel <- shiny::renderUI({
        de.ctrl.panel.entry <- ""
        if (length(de.ctrl.panel.types) > 0) {for (i in (1:length(de.ctrl.panel.types))) {
            print(paste0(i, de.ctrl.panel.types[i]))
            de.ctrl.panel.entry <- paste0(de.ctrl.panel.entry, gen_comp.de.ctrl.panel.entry(
                input = input,
                server.params = server.params,
                server.envs = server.envs,
                entry.no = i
            ))
        }}
    })
    return(output.de.ctrl.panel)
}

# def gen_output.de.ctrl.panel.add func
gen_output.de.ctrl.panel.add <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.de.ctrl.panel.add
    output.de.ctrl.panel.add <- shiny::renderUI({
        fluidRow(
            column(2, offset = 3, div(style="
                text-align:right;
            ", shiny::helpText("Find markers by:"))),
            column(3, offset = 0, shiny::selectInput(
                inputId = "de.ctrl.panel.add.type",
                label = NULL,
                choices = c(SELECT.INPUT.NONE, cat_vars)
            )),
            column(1, offset = 0, shiny::actionButton(
                inputId = "de.ctrl.panel.add.button",
                label = "Add"
            ))
        )
    })
    return(output.de.ctrl.panel.add)
}

