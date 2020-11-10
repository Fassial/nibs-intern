##################################
# Created on 19:27, Nov. 6th, 2020
# Author: fassial
# Filename: header.R
##################################
# dep
library(shinydashboard)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.UI, "ui.Rh"))

# macro

# def gen_ui.header func
gen_ui.header <- function() {
    # gen header
    header <- shinydashboard::dashboardHeader(title = "Pituitary scRNAseq")
    return(header)
}

