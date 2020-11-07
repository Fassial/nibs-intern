##################################
# Created on 19:27, Nov. 6th, 2020
# Author: fassial
# Filename: header.R
##################################
# dep
library(shinydashboard)
# local dep

# macro

# def gen_header func
gen_header <- function() {
    # gen header
    header <- dashboardHeader(title = "Pituitary scRNAseq")
    return(header)
}

