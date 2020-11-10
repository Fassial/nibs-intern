###################################
# Created on 15:11, Nov. 10th, 2020
# Author: fassial
# Filename: outputs.tab.3.R
###################################
# dep
library(shiny)
library(plotly)
library(Seurat)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))
source(file.path(DIR.SERVER.OUTPUTS, "outputs.Rh"))

# macro


