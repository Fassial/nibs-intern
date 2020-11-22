###################################
# Created on 17:18, Nov. 10th, 2020
# Author: fassial
# Filename: body.tab.3.R
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

# def gen_ui.body.tab.3.panel.1 func
gen_ui.body.tab.3.panel.1 <- function(ui.params) {
    # gen body.tab.3.panel.1
    body.tab.3.panel.1 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        gen_ui.body.subpanel.title(
            ui.params = ui.params,
            panel.title = "tab.3.panel.1"
        ),
        shiny::column(4, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::h4("Feature:")),
            shiny::column(12, offset = 0, shiny::textInput(
                inputId = "ge_ctrl_panel_gene_type",
                label = NULL,
                value = ""
            )),
            shiny::column(12, offset = 0, shiny::uiOutput("tab.3.panel.1.output.2"))
        )),
        shiny::column(8, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::h4("Violin Plot 1")),
            shiny::column(12, offset = 0, shiny::plotOutput("tab.3.panel.1.output.3"))
        ))
    )))
    return(body.tab.3.panel.1)
}

# def gen_ui.body.tab.3.panel.2 func
gen_ui.body.tab.3.panel.2 <- function(ui.params) {
    # init ui params
    cells <- ui.params$cells
    # set cell.types
    cell.types <- levels(unique(cells$cell_type_refined))
    # gen body.tab.3.panel.2
    body.tab.3.panel.2 <- shiny::column(12, offset = 0, shiny::wellPanel(style = "
        background-color:#ecf0f5;
        border: 0px;
        padding: 0px;
        margin: 0px;
        box-shadow: none;
    ", shiny::fluidRow(
        # shiny::column(12, offset = 0, shiny::helpText("tab.3.panel.2")),
        shiny::column(12, offset = 0, shiny::fluidRow(style = "
            height: 100%;
        ", 
            shiny::column(4, offset = 0, style="height:100%;text-align:right;", shiny::helpText("Cell type:")),
            shiny::column(4, offset = 0, style="height:100%;", shiny::textInput(
                inputId = "ge_ctrl_panel_cell_type",
                label = NULL,
                value = cell.types[1]
            )),
            shiny::column(4, offset = 0, style="height:100%;text-align:left;", shiny::imageOutput(
                outputId = "tab.3.panel.2.output.2",
                height = "100%"
            ))
        ))
    )))
    return(body.tab.3.panel.2)
}

# def gen_ui.body.tab.3.panel.3 func
gen_ui.body.tab.3.panel.3 <- function(ui.params) {
    # set group.types
    group.types <- c(
        "stim"="stim",
        "leiden clusters"="ct_state_leiden"
    )
    # gen body.tab.3.panel.3
    body.tab.3.panel.3 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        gen_ui.body.subpanel.title(
            ui.params = ui.params,
            panel.title = "tab.3.panel.3"
        ),
        shiny::column(4, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::h4("Group type:")),
            shiny::column(12, offset = 0, shiny::selectInput(
                inputId = "ge.ctrl.panel.group.type",
                label = NULL,
                choices = group.types,
                selected = "ct_state_leiden"
            ))
        )),
        shiny::column(8, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::h4("Violin Plot 2")),
            shiny::column(12, offset = 0, shiny::plotOutput("tab.3.panel.3.output.3"))
        ))
    )))
    return(body.tab.3.panel.3)
}

# def gen_ui.body.tab.3 func
gen_ui.body.tab.3 <- function(ui.params, tab.name = "tab-3") {
    # gen body.tab.3
    body.tab.3 <- shinydashboard::tabItem(
        tabName = tab.name,
        shiny::fluidRow(
            # tab.3.panel.1
            gen_ui.body.tab.3.panel.1(ui.params = ui.params),
            # tab.3.panel.2
            gen_ui.body.tab.3.panel.2(ui.params = ui.params),
            # tab.3.panel.3
            gen_ui.body.tab.3.panel.3(ui.params = ui.params)
        )
    )
    return(body.tab.3)
}

