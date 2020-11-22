##################################
# Created on 19:34, Nov. 6th, 2020
# Author: fassial
# Filename: body.R
##################################
# dep
library(shiny)
library(shinyjs)
library(shinydashboard)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.UI, "ui.Rh"))
source(file.path(DIR.UI.BODY, "body.Rh"))
source(file.path(DIR.UI.BODY, "body.tab.1.R"))
source(file.path(DIR.UI.BODY, "body.tab.2.R"))
source(file.path(DIR.UI.BODY, "body.tab.3.R"))
source(file.path(DIR.UI.RJS, "auto.complete.Rjs"))

# macro

# def gen_ui.body func
gen_ui.body <- function(ui.params) {
    # init ui params
    # gen body
    body <- shinydashboard::dashboardBody(
        shinyjs::useShinyjs(),
        shinyjs::extendShinyjs(text = Rjs.auto.complete, functions = c("autoComplete")),
        shinydashboard::tabItems(
            # tab.1
            gen_ui.body.tab.1(ui.params = ui.params),
            # tab.2
            gen_ui.body.tab.2(ui.params = ui.params),
            # tab.3
            gen_ui.body.tab.3(ui.params = ui.params)
        )
    )
    return(body)
}

