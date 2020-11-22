###################################
# Created on 11:40, Nov. 22nd, 2020
# Author: fassial
# Filename: body.utils.R
###################################
# dep
library(shiny)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.UI.BODY, "body.Rh"))

# macro

# def gen_ui.body.panel.title func
gen_ui.body.panel.title <- function(ui.params, panel.title) {
    # gen body.panel.title
    body.panel.title <- shiny::column(12, offset = 0, shiny::h2(panel.title))
    return(body.panel.title)
}

# def gen_ui.body.subpanel.title func
gen_ui.body.subpanel.title <- function(ui.params, panel.title) {
    # gen body.subpanel.title
    body.subpanel.title <- shiny::column(12, offset = 0, shiny::h3(panel.title))
    return(body.subpanel.title)
}

