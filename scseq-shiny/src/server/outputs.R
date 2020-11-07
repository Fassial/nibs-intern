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

# macro

# def gen_output.dimplot func
gen_output.dimplot <- function(input, server.params, server.events) {
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
gen_output.hoverplot <- function(input, server.params, server.events) {
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
gen_output.conditional_highlight <- function(input, server.params, server.events) {
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
gen_output.downloadResult <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # init server events
    result <- server.events$result
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
gen_output.de_result <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # init server events
    result <- server.events$result
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
gen_output.preview_left <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.preview_left
    output.preview_left <- shiny::renderPlot({
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
            f <- c("f1"=input$factor_1, "f2"=input$factor_2, "f3"=input$factor_3, "f4"=input$factor_4)
            l <- c("l1"=input$level_left_1, "l2"=input$level_left_2, "l3"=input$level_left_3, "l4"=input$level_left_4)
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
gen_output.preview_right <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.preview_right
    output.preview_right <- shiny::renderPlot({
        if (input$test_perform != "Multiple") {
            f <- c("f1"=input$factor_1, "f2"=input$factor_2, "f3"=input$factor_3, "f4"=input$factor_4)
            l <- c("l1"=input$level_right_1, "l2"=input$level_right_2, "l3"=input$level_right_3, "l4"=input$level_right_4)
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

# def gen_output.DE_ctrl_panel_factor_1 func
gen_output.DE_ctrl_panel_factor_1 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_factor_1
    output.DE_ctrl_panel_factor_1 <- shiny::renderUI({
        if (input$test_perform == "Multiple") {
            shiny::selectInput(
                inputId = "factor_1",
                label = "Find markers by:",
                choices = c("", "Cell type"="cell_type")
            )
        } else if (input$test_perform == "Grouped comparison") {
            shiny::selectInput(
                inputId = "factor_1",
                label = "Define cell groups:",
                choices = c("",cat_vars)
            )
        } else if (input$test_perform == "Conserved") {
            shiny::selectInput(
                inputId = "factor_1",
                label = "Conserved markers:",
                choices = c("","Cell Type"="cell_type")
            )
        }
    })
    return(output.DE_ctrl_panel_factor_1)
}

# def gen_output.DE_ctrl_panel_factor_2 func
gen_output.DE_ctrl_panel_factor_2 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_factor_2
    output.DE_ctrl_panel_factor_2 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison"){
            # renders nothing
        } else if (!is.null(input$level_left_1) && input$level_left_1 != "" && !is.null(input$level_right_1) && input$level_right_1 != "") {
            shiny::selectInput(
                inputId = "factor_2",
                label = "",
                choices = c("",cat_vars)
            )
        }
    })
    return(output.DE_ctrl_panel_factor_2)
}

# def gen_output.DE_ctrl_panel_factor_3 func
gen_output.DE_ctrl_panel_factor_3 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_factor_3
    output.DE_ctrl_panel_factor_3 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison"){
            # renders nothing
        } else if (!is.null(input$level_left_2) && input$level_left_2 != "" && !is.null(input$level_right_2) && input$level_right_2 != "") {
            shiny::selectInput(
                inputId = "factor_3",
                label = "",
                choices = c("",cat_vars)
            )
        }
    })
    return(output.DE_ctrl_panel_factor_3)
}

# def gen_output.DE_ctrl_panel_factor_4 func
gen_output.DE_ctrl_panel_factor_4 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_factor_4
    output.DE_ctrl_panel_factor_4 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison"){
            # renders nothing
        } else if (!is.null(input$level_left_3) && input$level_left_3 != "" && !is.null(input$level_right_3) && input$level_right_3 != "") {
            shiny::selectInput(
                inputId = "factor_4",
                label = "",
                choices = c("",cat_vars)
            )
        }
    })
    return(output.DE_ctrl_panel_factor_4)
}

# def gen_output.DE_ctrl_panel_left_level_1 func
gen_output.DE_ctrl_panel_left_level_1 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_left_level_1
    output.DE_ctrl_panel_left_level_1 <- shiny::renderUI({
        if (input$test_perform == "Multiple") {
            # renders nothing
        } else {
            if (input$factor_1 == "") {
                shiny::selectInput(
                    inputId = "level_left_1",
                    label = "Group 1:",
                    choices = c("")
                )
            } else {
                flevels <- levels(factor(eval(parse(
                    text= paste0("metadata %>% .[[\'",input$factor_1,"\']]")
                ))))
                shiny::selectInput(
                    inputId = "level_left_1",
                    label = "Group 1:",
                    choices = c("",flevels)
                )
            }
        }
    })
    return(output.DE_ctrl_panel_left_level_1)
}

# def gen_output.DE_ctrl_panel_left_level_2 func
gen_output.DE_ctrl_panel_left_level_2 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_left_level_2
    output.DE_ctrl_panel_left_level_2 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison") {
            # renders nothing
        } else if (!is.null(input$factor_2)) {
            if (input$factor_2 == "") {
                shiny::selectInput(
                    inputId = "level_left_2",
                    label = "",
                    choices = c("")
                )
            } else {
                flevels <- levels(factor(eval(parse(
                    text= paste0("metadata %>%
                                                          filter(",input$factor_1,"==\'",input$level_left_1,"\') %>% 
                                                          .[[\'",input$factor_2,"\']]")))))
                shiny::selectInput(
                    inputId = "level_left_2",
                    label = "",
                    choices = c("",flevels)
                )
            }
        }
    })
    return(output.DE_ctrl_panel_left_level_2)
}

# def gen_output.DE_ctrl_panel_left_level_3 func
gen_output.DE_ctrl_panel_left_level_3 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_left_level_3
    output.DE_ctrl_panel_left_level_3 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison") {
            # renders nothing
        } else if (!is.null(input$factor_3)) {
            if (input$factor_3 == "") {
                shiny::selectInput(
                    inputId = "level_left_3",
                    label = "",
                    choices = c("")
                )
            } else {
                flevels <- levels(factor(eval(parse(text= paste0("metadata %>%
                    filter(",input$factor_1,"==\'",input$level_left_1,"\') %>% 
                    filter(",input$factor_2,"==\'",input$level_left_2,"\') %>%
                    .[[\'",input$factor_3,"\']]")))))
                shiny::selectInput(
                    inputId = "level_left_3",
                    label = "",
                    choices = c("",flevels)
                )
            }
        }
    })
    return(output.DE_ctrl_panel_left_level_3)
}

# def gen_output.DE_ctrl_panel_left_level_4 func
gen_output.DE_ctrl_panel_left_level_4 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_left_level_4
    output.DE_ctrl_panel_left_level_4 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison") {
            # renders nothing
        } else if (!is.null(input$factor_4)) {
            if (input$factor_4 == "") {
                shiny::selectInput(
                    inputId = "level_left_4",
                    label = "",
                    choices = c("")
                )
            } else {
                flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                    filter(",input$factor_1,"==\'",input$level_left_1,"\') %>% 
                    filter(",input$factor_2,"==\'",input$level_left_2,"\') %>%
                    filter(",input$factor_3,"==\'",input$level_left_3,"\') %>%
                    .[[\'",input$factor_4,"\']]")))))
                shiny::selectInput(
                    inputId = "level_left_4",
                    label = "",
                    choices = c("",flevels)
                )
            }
        }
    })
    return(output.DE_ctrl_panel_left_level_4)
}

# def gen_output.DE_ctrl_panel_right_level_1 func
gen_output.DE_ctrl_panel_right_level_1 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_right_level_1
    output.DE_ctrl_panel_right_level_1 <- shiny::renderUI({
        if (input$test_perform == "Multiple") {
            # renders nothing
        } else {
            if (input$factor_1 == "") {
                shiny::selectInput(
                    inputId = "level_right_1",
                    label = "Group 2:",
                    choices = c("")
                )
            } else {
                flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                    .[[\'",input$factor_1,"\']]")))))
                shiny::selectInput(
                    inputId = "level_right_1",
                    label = "Group 2:",
                    choices = c("",flevels)
                )
            }
        }
    })
    return(output.DE_ctrl_panel_right_level_1)
}

# def gen_output.DE_ctrl_panel_right_level_2 func
gen_output.DE_ctrl_panel_right_level_2 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_right_level_2
    output.DE_ctrl_panel_right_level_2 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison") {
            # renders nothing
        } else if (!is.null(input$factor_2)) {
            if (input$factor_2 == "") {
                shiny::selectInput(
                    inputId = "level_right_2",
                    label = "",
                    choices = c("")
                )
            } else {
                flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                    filter(",input$factor_1,"==\'",input$level_right_1,"\') %>% 
                    .[[\'",input$factor_2,"\']]")))))
                shiny::selectInput(
                    inputId = "level_right_2",
                    label = "",
                    choices = c("",flevels)
                )
            }
        }
    })
    return(output.DE_ctrl_panel_right_level_2)
}

# def gen_output.DE_ctrl_panel_right_level_3 func
gen_output.DE_ctrl_panel_right_level_3 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_right_level_3
    output.DE_ctrl_panel_right_level_3 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison"){
          # renders nothing
        } else if (!is.null(input$factor_3)) {
            if (input$factor_3 == "") {
                shiny::selectInput(
                    inputId = "level_right_3",
                    label = "",
                    choices = c("")
                )
            } else {
                flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                    filter(",input$factor_1,"==\'",input$level_right_1,"\') %>% 
                    filter(",input$factor_2,"==\'",input$level_right_2,"\') %>%
                    .[[\'",input$factor_3,"\']]")))))
                shiny::selectInput(
                    inputId = "level_right_3",
                    label = "",
                    choices = c("",flevels)
                )
            }
        }
    })
    return(output.DE_ctrl_panel_right_level_3)
}

# def gen_output.DE_ctrl_panel_right_level_4 func
gen_output.DE_ctrl_panel_right_level_4 <- function(input, server.params, server.events) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen output.DE_ctrl_panel_right_level_4
    output.DE_ctrl_panel_right_level_4 <- shiny::renderUI({
        if (input$test_perform != "Grouped comparison") {
            # renders nothing
        } else if (!is.null(input$factor_4)) {
            if (input$factor_4 == "") {
                shiny::selectInput(
                    inputId = "level_right_4",
                    label = "",
                    choices = c("")
                )
            } else {
                flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                    filter(",input$factor_1,"==\'",input$level_right_1,"\') %>% 
                    filter(",input$factor_2,"==\'",input$level_right_2,"\') %>%
                    filter(",input$factor_3,"==\'",input$level_right_3,"\') %>%
                    .[[\'",input$factor_4,"\']]")))))
                shiny::selectInput(
                    inputId = "level_right_4",
                    label = "",
                    choices = c("",flevels)
                )
            }
        }
    })
    return(output.DE_ctrl_panel_right_level_4)
}

