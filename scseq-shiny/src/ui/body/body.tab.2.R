###################################
# Created on 17:04, Nov. 10th, 2020
# Author: fassial
# Filename: body.tab.2.R
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

# def gen_ui.body.tab.2.panel.1 func
gen_ui.body.tab.2.panel.1 <- function(ui.params) {
    # set de.types
    de.types <- c("Grouped comparison", "Multiple", "Conserved")
    # set preview.types
    preview.types <- c(
        "Integrated UMAP"="umap.int",
        "Unintegrated UMAP"="umap"
    )
    # gen body.tab.2.panel.1
    body.tab.2.panel.1 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        gen_ui.body.panel.title(
            ui.params = ui.params,
            panel.title = "DE Control Panel"
        ),
        shiny::column(12, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::h4("DE types:")),
            shiny::column(12, offset = 0, shiny::selectInput(
                inputId = "de.ctrl.panel.de.type",
                label = NULL,
                choices = de.types
            ))
        )),
        shiny::column(12, offset = 0, shiny::fluidRow(
            shiny::column(12, offset = 0, shiny::h4("Preview type:")),
            shiny::column(12, offset = 0, shiny::selectInput(
                inputId = "de.ctrl.panel.preview.type",
                label = NULL,
                choices = preview.types
            ))
        )),
        shiny::column(12, offset = 0, shiny::fluidRow(
            shiny::column(6, offset = 0, shiny::div(style="
                text-align:center;
            ",  shiny::actionButton(
                inputId = "de.ctrl.panel.analyze.button",
                label = "Analyze",
                class = "btn-primary"
            ))),
            shiny::column(6, offset = 0, shiny::div(style="
                text-align:center;
            ",  shiny::downloadButton(
                outputId = "tab.2.panel.1.output.4",
                label = "Download",
                class = "btn-primary",
                easyClose = TRUE,
                title = "de.result.table"
            ))),
        ))
    )))
    return(body.tab.2.panel.1)
}

# def gen_ui.body.tab.2.panel.2 func
gen_ui.body.tab.2.panel.2 <- function(ui.params) {
    # gen body.tab.2.panel.2
    body.tab.2.panel.2 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        gen_ui.body.panel.title(
            ui.params = ui.params,
            panel.title = "DE Plot Panel"
        ),
        shiny::column(12, offset = 0, shiny::fluidRow(
            shiny::column(6, offset = 0, shiny::plotOutput("tab.2.panel.2.output.1")),
            shiny::column(6, offset = 0, shiny::plotOutput("tab.2.panel.2.output.2"))
        )),
        shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
            gen_ui.body.subpanel.title(
                ui.params = ui.params,
                panel.title = "DE Plot Control Panel"
            ),
            shiny::hr(),
            shiny::column(12, offset = 0, shiny::uiOutput("tab.2.panel.2.output.3")),
            shiny::column(12, offset = 0, shiny::uiOutput("tab.2.panel.2.output.4"))
        )))
    )))
    return(body.tab.2.panel.2)
}

# def gen_ui.body.tab.2.panel.3 func
gen_ui.body.tab.2.panel.3 <- function(ui.params) {
    # gen body.tab.2.panel.3
    body.tab.2.panel.3 <- shiny::column(12, offset = 0, shiny::wellPanel(shiny::fluidRow(
        gen_ui.body.panel.title(
            ui.params = ui.params,
            panel.title = "DE Analyze Panel"
        ),
        shiny::column(12, offset = 0, DT::DTOutput("tab.2.panel.3.output.1"))
    )))
    return(body.tab.2.panel.3)
}

# def gen_ui.body.tab.2 func
gen_ui.body.tab.2 <- function(ui.params, tab.name = "tab-2") {
    # gen body.tab.2
    body.tab.2 <- shinydashboard::tabItem(
        tabName = tab.name,
        shiny::fluidRow(
            ## sidebar control panels
            shiny::column(4, offset = 0, shiny::fluidRow(
                # tab.2.panel.1
                gen_ui.body.tab.2.panel.1(ui.params = ui.params)
            )),
            ## plot panels
            shiny::column(8, offset = 0, shiny::fluidRow(
                # tab.2.panel.2
                gen_ui.body.tab.2.panel.2(ui.params = ui.params)
            )),
            ## de result panels
            shiny::column(12, offset = 0, shiny::fluidRow(
                # tab.2.panel.3
                gen_ui.body.tab.2.panel.3(ui.params = ui.params)
            ))
        )
    )
    return(body.tab.2)
}

