##################################
# Created on 19:30, Nov. 6th, 2020
# Author: fassial
# Filename: sidebar.R
##################################
# dep
library(shinyjs)
library(shinydashboard)
# local dep

# macro

# def gen_sidebar func
gen_sidebar <- function() {
    # gen sidebar
    sidebar <- dashboardSidebar(
        # use shinyjs to disable/enable certain inputs
        shinyjs::useShinyjs(),
        # sidebar menu
        sidebarMenu(
            menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
            menuItem("DE analysis", tabName = "de_analysis", icon = icon("th"))
            # menuItem("Debug", tabName = "debug", icon = icon("th"))
        )
    )
    return(sidebar)
}

