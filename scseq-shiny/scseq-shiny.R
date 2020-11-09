##################################
# Created on 16:33, Nov. 9th, 2020
# Author: fassial
# Filename: scseq-shiny.R
##################################
# dep
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "app.R"))

# macro

# run the application 
shinyApp(ui = ui, server = server)

