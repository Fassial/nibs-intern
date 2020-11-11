###################################
# Created on 17:18, Nov. 10th, 2020
# Author: fassial
# Filename: body.tab.3.R
###################################
# dep
library(shiny)
library(shinydashboard)
# local dep

# macro

# def gen_ui.body.tab.3.panel.1 func
gen_ui.body.tab.3.panel.1 <- function(ui.params) {
    # gen body.tab.3.panel.1
    body.tab.3.panel.1 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        shiny::column(12, offset = 0, shiny::helpText("tab.3.panel.1")),
        shiny::column(4, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::textInput(
                inputId = "ge.ctrl.panel.gene.type",
                label = NULL,
                value = ""
            )),
            shiny::column(12, offset = 0, shiny::uiOutput("tab.3.panel.1.output.2"))
        )),
        shiny::column(8, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::plotOutput("tab.3.panel.1.output.3"))
        ))
    )))
    return(body.tab.3.panel.1)
}

# def gen_ui.body.tab.3.panel.2 func
gen_ui.body.tab.3.panel.2 <- function(ui.params) {
    # init ui params
    cells <- ui.params$cells
    # set group.types & cell.types
    group.types <- c(
        "stim"="stim",
        "leiden clusters"="ct_state_leiden"
    )
    cell.types <- levels(unique(cells$cell_type_refined))
    # gen body.tab.3.panel.2
    body.tab.3.panel.2 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        shiny::column(12, offset = 0, shiny::helpText("tab.3.panel.2")),
        shiny::column(4, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::helpText("Group type:")),
            shiny::column(12, offset = 0, shiny::selectInput(
                inputId = "ge.ctrl.panel.group.type",
                label = NULL,
                choices = c(SELECT.INPUT.NONE, group.types),
                selected = SELECT.INPUT.NONE
            )),
            shiny::column(12, offset = 0, shiny::helpText("Cell type:")),
            shiny::column(12, offset = 0, shiny::selectInput(
                inputId = "ge.ctrl.panel.cell.type",
                label = NULL,
                choices = c(SELECT.INPUT.NONE, cell.types),
                selected = SELECT.INPUT.NONE
            ))
        )),
        shiny::column(8, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::plotOutput("tab.3.panel.2.output.3"))
        ))
    )))
    return(body.tab.3.panel.2)
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
            gen_ui.body.tab.3.panel.2(ui.params = ui.params)
        )
    )
    return(body.tab.3)
}

