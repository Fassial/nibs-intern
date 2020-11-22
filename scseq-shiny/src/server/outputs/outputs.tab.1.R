###################################
# Created on 11:10, Nov. 10th, 2020
# Author: fassial
# Filename: outputs.tab.1.R
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

# def gen_server.output.ov.ctrl.panel.feature.type func
gen_server.output.ov.ctrl.panel.feature.type <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # set feature.types
    feature.types <- rownames(cells)
    # gen output.ov.ctrl.panel.feature.type
    output.ov.ctrl.panel.feature.type <- shiny::renderUI({
        shiny::selectInput(
            inputId = "ov.ctrl.panel.feature.type",
            label = "Select a gene to plot expression level:",
            choices = feature.types,
            selected = "Gh",
            multiple = FALSE
        )
    })
    return(output.ov.ctrl.panel.feature.type)
}

# def gen_server.output.ov.plot.panel.dimplot func
gen_server.output.ov.plot.panel.dimplot <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # gen output.ov.plot.panel.dimplot
    output.ov.plot.panel.dimplot <- shiny::renderPlot({
        if ((length(input$ov_ctrl_panel_assay_type) == 0)
         || (length(input$ov_ctrl_panel_plot_type) == 0)) {
            # render nothing
        } else if (input$ov_ctrl_panel_assay_type == "Integrated") {
            if (input$ov_ctrl_panel_plot_type == "UMAP") {
                Seurat::DimPlot(cells,
                    reduction = "umap.int",
                    group.by = input$ov_ctrl_panel_legend_type,
                    label = input$ov_ctrl_panel_legend_toggle,
                    label.size = 4
                ) + Seurat::NoLegend()
            } else if (input$ov_ctrl_panel_plot_type == "TSNE") {
                Seurat::DimPlot(cells,
                    reduction = "tsne.int",
                    group.by = input$ov_ctrl_panel_legend_type,
                    label = input$ov_ctrl_panel_legend_toggle,
                    label.size = 4
                ) + Seurat::NoLegend()
            }
        } else if (input$ov_ctrl_panel_assay_type == "Un-integrated") {
            if (input$ov_ctrl_panel_plot_type == "UMAP") {
                Seurat::DimPlot(cells,
                    reduction = "umap",
                    group.by = input$ov_ctrl_panel_legend_type,
                    label = input$ov_ctrl_panel_legend_toggle,
                    label.size = 4
                ) + Seurat::NoLegend()
            } else if (input$ov_ctrl_panel_plot_type == "TSNE") {
                Seurat::DimPlot(cells,
                    reduction = "tsne",
                    group.by = input$ov_ctrl_panel_legend_type,
                    label = input$ov_ctrl_panel_legend_toggle,
                    label.size = 4
                ) + Seurat::NoLegend()
            }
        }
    })
    return(output.ov.plot.panel.dimplot)
}

# def gen_server.output.ov.plot.panel.featureplot func
gen_server.output.ov.plot.panel.featureplot <- function(input, server.params, server.envs) {
    # init server params
    cells <- server.params$cells
    # set gene.types
    gene.types <- rownames(cells)
    # gen output.ov.plot.panel.featureplot
    output.ov.plot.panel.featureplot <- shiny::renderPlot({
        if ((length(input$ov_ctrl_panel_assay_type) == 0)
         || (length(input$ov_ctrl_panel_gene_type) == 0)
         || (!(input$ov_ctrl_panel_gene_type %in% gene.types))) {
            # render nothing
        } else if (input$ov_ctrl_panel_assay_type == "Integrated") {
            Seurat::FeaturePlot(cells,
                reduction = "umap.int",
                input$ov_ctrl_panel_gene_type
            )
        } else if (input$ov_ctrl_panel_assay_type == "Un-integrated") {
            Seurat::FeaturePlot(cells,
                reduction = "umap",
                input$ov_ctrl_panel_gene_type
            )
        }
    })
    return(output.ov.plot.panel.featureplot)
}

# def gen_server.outputs.tab.1 func
gen_server.outputs.tab.1 <- function(input, server.params, server.envs, output) {
    ## set tab.1 outputs
    # set tab.1.panel.4
    output$tab.1.panel.4.output.1 <- gen_server.output.ov.plot.panel.dimplot(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
    output$tab.1.panel.4.output.2 <- gen_server.output.ov.plot.panel.featureplot(
        input = input,
        server.params = server.params,
        server.envs = server.envs
    )
}

