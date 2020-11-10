###################################
# Created on 16:43, Nov. 10th, 2020
# Author: fassial
# Filename: body.tab.1.R
###################################
# dep
library(shiny)
library(plotly)
library(shinydashboard)
# local dep

# macro

# def gen_ui.body.tab.1.panel.1 func
gen_ui.body.tab.1.panel.1 <- function(ui.params) {
    # set legend.types
    legend.types <- c(
        "Louvain clusters res0.3"="integrated_snn_res.0.3",
        "Cell type (putative)"="cell_type"
    )
    # gen body.tab.1.panel.1
    body.tab.1.panel.1 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        shiny::column(12, offset = 0, shiny::helpText("tab.1.panel.1")),
        shiny::column(12, offset = 0, shiny::fluidRow(shiny::column(12, offset = 0, shiny::selectInput(
            inputId = "ov.ctrl.panel.legend.type",
            label = "Legend:",
            choices = legend.types
        )))),
        shiny::column(12, offset = 0, shiny::fluidRow(shiny::column(12, offset = 0, shiny::checkboxInput(
            inputId = "ov.ctrl.panel.legend.toggle",
            label = "Toggle label",
            value = FALSE
        ))))
    )))
    return(body.tab.1.panel.1)
}

# def gen_ui.body.tab.1.panel.2 func
gen_ui.body.tab.1.panel.2 <- function(ui.params) {
    # init ui params
    cells <- ui.params$cells
    # set assay.types
    assay.types <- c("Integrated", "Un-integrated")
    # set plot.types
    plot.types <- c(
        "UMAP"="UMAP",
        "TSNE"="TSNE",
        "Gene expression"="GENE"
    )
    # set feature.types
    feature.types <- rownames(cells)
    # gen body.tab.1.panel.2
    body.tab.1.panel.2 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        shiny::column(12, offset = 0, shiny::helpText("tab.1.panel.2")),
        shiny::column(12, offset = 0, shiny::fluidRow(shiny::column(12, offset = 0, shiny::selectInput(
            inputId = "ov.ctrl.panel.assay.type",
            label = "Assay view:",
            choices = assay.types
        )))),
        shiny::column(12, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::uiOutput("tab.1.panel.2.output.2"))
        )),
        shiny::column(12, offset = 0, shiny::fluidRow(shiny::column(12, offset = 0, shiny::selectInput(
            inputId = "ov.ctrl.panel.feature.type",
            label = "Select a gene to plot expression level:",
            choices = feature.types,
            selected = "Gh",
            multiple = FALSE
        ))))
    )))
    return(body.tab.1.panel.2)
}

# def gen_ui.body.tab.1.panel.3 func
gen_ui.body.tab.1.panel.3 <- function(ui.params) {
    # init ui params
    cells <- ui.params$cells
    # set highlight.types
    highlight.types <- c("",
        names(cells@meta.data),
        rownames(cells)
    )
    # gen body.tab.1.panel.3
    body.tab.1.panel.3 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        shiny::column(12, offset = 0, shiny::helpText("tab.1.panel.3")),
        shiny::column(12, offset = 0, shiny::fluidRow(shiny::column(12, offset = 0, shiny::selectInput(
            inputId = "ov.ctrl.panel.highlight.type",
            label = "Highlight:",
            choices = highlight.types
        )))),
        shiny::column(12, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::uiOutput("tab.1.panel.3.output.2"))
        )),
        shiny::column(12, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::uiOutput("tab.1.panel.3.output.3")) 
        ))
    )))
    return(body.tab.1.panel.3)
}

# def gen_ui.body.tab.1.panel.4 func
gen_ui.body.tab.1.panel.4 <- function(ui.params) {
    # init ui params
    cells <- ui.params$cells
    markers <- ui.params$markers
    # set fetch.vars
    fetch.vars <- c(
        rownames(cells),
        rownames(cells@meta.data)
    )
    # gen body.tab.1.panel.4
    body.tab.1.panel.4 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        shiny::column(12, offset = 0, shiny::helpText("tab.1.panel.4")),
        shiny::column(12, offset = 0, shiny::fluidRow(shiny::column(12, offset = 0, shiny::selectInput(
            inputId = "ov.ctrl.panel.fetch.vars",
            label = "Variables extracted by hover:",
            multiple = TRUE,
            choices = fetch.vars,
            selected = markers
        ))))
    )))
    return(body.tab.1.panel.4)
}

# def gen_ui.body.tab.1.panel.5 func
gen_ui.body.tab.1.panel.5 <- function(ui.params) {
    # gen body.tab.1.panel.5
    body.tab.1.panel.5 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        shiny::column(12, offset = 0, shiny::helpText("tab.1.panel.5")),
        shinydashboard::box(shiny::plotOutput("tab.1.panel.5.output.1"), height = 400),
        shinydashboard::box(plotly::plotlyOutput("tab.1.panel.5.output.2"), height = 400)
    )))
    return(body.tab.1.panel.5)
}

# def gen_ui.body.tab.1 func
gen_ui.body.tab.1 <- function(ui.params, tab.name = "tab-1") {
    body.tab.1 <- shinydashboard::tabItem(
        tabName = tab.name,
        shiny::fluidRow(
            ## sidebar control panels
            shiny::column(4, offset = 0, shiny::fluidRow(
                # tab.1.panel.1
                gen_ui.body.tab.1.panel.1(ui.params = ui.params),
                # tab.1.panel.2
                gen_ui.body.tab.1.panel.2(ui.params = ui.params),
                # tab.1.panel.3
                gen_ui.body.tab.1.panel.3(ui.params = ui.params),
                # tab.1.panel.4
                gen_ui.body.tab.1.panel.4(ui.params = ui.params)
            )),
            ## plot panels
            shiny::column(8, offset = 0, shiny::fluidRow(
                # tab.1.panel.5
                gen_ui.body.tab.1.panel.5(ui.params = ui.params)
            ))
        )
    )
    return(body.tab.1)
}

