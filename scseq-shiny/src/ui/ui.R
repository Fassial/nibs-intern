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
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.UI, "ui.Rh"))
source(file.path(DIR.UI, "header.R"))
source(file.path(DIR.UI, "sidebar.R"))
source(file.path(DIR.UI.BODY, "body.R"))

# macro

# def gen_ui func
gen_ui <- function(ui.params) {
    # record start_time
    print("Initing ui...")
    start_time <- Sys.time()
    # gen components
    header <- gen_ui.header()
    sidebar <- gen_ui.sidebar()
    body <- gen_ui.body(
        ui.params = ui.params
    )
    # gen ui
    ui <- shinydashboard::dashboardPage(
        header = header,
        sidebar = sidebar,
        body = body
    )
    # record end_time
    end_time <- Sys.time()
    print(paste0("Init ui runs for ", as.numeric(end_time-start_time), "s."))
    return(ui)
}

