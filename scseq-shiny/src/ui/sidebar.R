##################################
# Created on 19:30, Nov. 6th, 2020
# Author: fassial
# Filename: sidebar.R
##################################
# dep
library(shinyjs)
library(shinydashboard)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.UI, "ui.Rh"))

# macro

# def gen_ui.sidebar func
gen_ui.sidebar <- function() {
    # gen sidebar
    sidebar <- shinydashboard::dashboardSidebar(
        # use shinyjs to disable/enable certain inputs
        shinyjs::useShinyjs(),
        # sidebar menu
        shinydashboard::sidebarMenu(
            shinydashboard::menuItem("Overview", tabName = "tab-1", icon = icon("dashboard")),
            shinydashboard::menuItem("DE analysis", tabName = "tab-2", icon = icon("th")),
            shinydashboard::menuItem("Violin Plots", tabName = "tab-3", icon = icon("th"))
        )
    )
    return(sidebar)
}

