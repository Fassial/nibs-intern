###################################
# Created on 16:43, Nov. 10th, 2020
# Author: fassial
# Filename: body.tab.1.R
###################################
# dep
library(shiny)
library(shinydashboard)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.UI.BODY, "body.Rh"))
source(file.path(DIR.UI.BODY, "body.utils.R"))

# macro

# def gen_ui.body.tab.1.panel.1 func
gen_ui.body.tab.1.panel.1 <- function(ui.params) {
    # set assay.types
    assay.types <- c("Integrated", "Un-integrated")
    # gen body.tab.1.panel.1
    body.tab.1.panel.1 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        gen_ui.body.subpanel.title(
            ui.params = ui.params,
            panel.title = "General Control Panel"
        ),
        shiny::column(12, offset = 0, shiny::h4("Assay view:")),
        shiny::column(12, offset = 0, shiny::selectInput(
            inputId = "ov_ctrl_panel_assay_type",
            label = NULL,
            choices = assay.types
        ))
    )))
    return(body.tab.1.panel.1)
}

# def gen_ui.body.tab.1.panel.2 func
gen_ui.body.tab.1.panel.2 <- function(ui.params) {
    # set legend.types
    legend.types <- c(
        "Louvain clusters res0.3"="integrated_snn_res.0.3",
        "Cell type (putative)"="cell_type"
    )
    # set plot.types
    plot.types <- c(
        "UMAP"="UMAP",
        "TSNE"="TSNE"
    )
    # gen body.tab.1.panel.2
    body.tab.1.panel.2 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        gen_ui.body.subpanel.title(
            ui.params = ui.params,
            panel.title = "Dimplot Control Panel"
        ),
        shiny::column(12, offset = 0, shiny::h4("Legend:")),
        shiny::column(12, offset = 0, shiny::fluidRow(
            shiny::column(10, offset = 0, shiny::selectInput(
                inputId = "ov_ctrl_panel_legend_type",
                label = NULL,
                choices = legend.types
            )),
            shiny::column(2, offste = 0, shiny::checkboxInput(
                inputId = "ov_ctrl_panel_legend_toggle",
                label = NULL,
                value = FALSE
            ))
        )),
        shiny::column(12, offset = 0, shiny::h4("Type of Figure:")),
        shiny::column(12, offset = 0, shiny::selectInput(
            inputId = "ov_ctrl_panel_plot_type",
            label = NULL,
            choices = plot.types
        ))
    )))
    return(body.tab.1.panel.2)
}

# def gen_ui.body.tab.1.panel.3 func
gen_ui.body.tab.1.panel.3 <- function(ui.params) {
    # init ui params
    cells <- ui.params$cells
    # set gene.types
    gene.types <- rownames(cells)
    # gen body.tab.1.panel.3
    body.tab.1.panel.3 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        gen_ui.body.subpanel.title(
            ui.params = ui.params,
            panel.title = "Featureplot Control Panel"
        ),
        shiny::column(12, offset = 0, shiny::h4("Feature:")),
        shiny::column(12, offset = 0, shiny::textInput(
            inputId = "ov_ctrl_panel_gene_type",
            label = NULL,
            value = gene.types[1]
        ))
    )))
    return(body.tab.1.panel.3)
}

# def gen_ui.body.tab.1.panel.4 func
gen_ui.body.tab.1.panel.4 <- function(ui.params) {
    # gen body.tab.1.panel.4
    body.tab.1.panel.4 <- shiny::column(12, offset = 0, shiny::fluidRow(
        # no need for subpanel.title
        shiny::column(6, offset = 0, shiny::wellPanel(shiny::fluidRow(
            gen_ui.body.subpanel.title(
                ui.params = ui.params,
                panel.title = "Dimplot"
            ),
            shiny::column(12, offset = 0, shiny::plotOutput("tab.1.panel.4.output.1"))
        ))),
        shiny::column(6, offset = 0, shiny::wellPanel(shiny::fluidRow(
            gen_ui.body.subpanel.title(
                ui.params = ui.params,
                panel.title = "Featureplot"
            ),
            shiny::column(12, offset = 0, shiny::plotOutput("tab.1.panel.4.output.2"))
        ))),
    ))
    return(body.tab.1.panel.4)
}

# def gen_ui.body.tab.1 func
gen_ui.body.tab.1 <- function(ui.params, tab.name = "tab-1") {
    body.tab.1 <- shinydashboard::tabItem(
        tabName = tab.name,
        shiny::fluidRow(
            ## control panels
            shiny::column(4, offset = 0, shiny::wellPanel(shiny::fluidRow(
                # control panel name
                gen_ui.body.panel.title(
                    ui.params = ui.params,
                    panel.title = "Overview Control Panel"
                ),
                # tab.1.panel.1
                gen_ui.body.tab.1.panel.1(ui.params = ui.params),
                # tab.1.panel.2
                gen_ui.body.tab.1.panel.2(ui.params = ui.params),
                # tab.1.panel.3
                gen_ui.body.tab.1.panel.3(ui.params = ui.params)
            ))),
            ## plot panels
            shiny::column(8, offset = 0, shiny::wellPanel(shiny::fluidRow(
                # plot panel name
                gen_ui.body.panel.title(
                    ui.params = ui.params,
                    panel.title = "Overview Plot Panel"
                ),
                # tab.1.panel.4
                gen_ui.body.tab.1.panel.4(ui.params = ui.params)
            )))
        )
    )
    return(body.tab.1)
}

