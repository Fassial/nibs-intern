##################################
# Created on 17:38, Nov. 6th, 2020
# Author: fassial
# Filename: ui.R
##################################
# dep
library(shinydashboard)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
DIR.UI <- file.path(DIR.SRC, "ui")
source(file.path(DIR.UI, "header.R"))
source(file.path(DIR.UI, "sidebar.R"))
source(file.path(DIR.UI, "body.R"))

# macro

# def gen_ui func
gen_ui <- function(cells, markers) {
    # gen components
    header <- gen_header()
    sidebar <- gen_sidebar()
    body <- gen_body(
        cells = cells,
        markers = markers
    )
    # gen ui
    ui <- dashboardPage(header, sidebar, body)
    return(ui)
}

