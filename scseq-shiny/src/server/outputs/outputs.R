##################################
# Created on 20:14, Nov. 6th, 2020
# Author: fassial
# Filename: output.R
##################################
# dep
library(shiny)
library(Seurat)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))
source(file.path(DIR.SERVER, "utils.R"))
source(file.path(DIR.SERVER, "events.R"))
source(file.path(DIR.SERVER, "components.R"))
# outputs
source(file.path(DIR.SERVER.OUTPUTS, "outputs.Rh"))
source(file.path(DIR.SERVER.OUTPUTS, "outputs.tab.1.R"))
source(file.path(DIR.SERVER.OUTPUTS, "outputs.tab.2.R"))
source(file.path(DIR.SERVER.OUTPUTS, "outputs.tab.3.R"))

# macro

# def gen_server.outputs func
gen_server.outputs <- function(input, server.params, server.envs, output) {
    ## set outputs
    # tab.1 overview
    gen_server.outputs.tab.1(
        input = input,
        server.params = server.params,
        server.envs = server.envs,
        output = output
    )
    # tab.2 de.analyze
    gen_server.outputs.tab.2(
        input = input,
        server.params = server.params,
        server.envs = server.envs,
        output = output
    )
    # tab.3
    gen_server.outputs.tab.3(
        input = input,
        server.params = server.params,
        server.envs = server.envs,
        output = output
    )
}

