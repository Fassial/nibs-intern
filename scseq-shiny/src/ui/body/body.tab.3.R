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
            shiny::column(12, offset = 0, shiny::uiOutput("tab.3.panel.1.output.1"))
        )),
        shiny::column(8, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::uiOutput("tab.3.panel.1.output.2"))
        ))
    )))
    return(body.tab.3.panel.1)
}

# def gen_ui.body.tab.3.panel.2 func
gen_ui.body.tab.3.panel.2 <- function(ui.params) {
    # gen body.tab.3.panel.2
    body.tab.3.panel.2 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        shiny::column(12, offset = 0, shiny::helpText("tab.3.panel.2")),
        shiny::column(4, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::uiOutput("tab.3.panel.2.output.1"))
        )),
        shiny::column(8, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::uiOutput("tab.3.panel.2.output.2"))
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

