##################################
# Created on 19:50, Nov. 6th, 2020
# Author: fassial
# Filename: ui.R
##################################
# dep
library(shiny)
library(shinyjs)
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.SERVER, "server.Rh"))
source(file.path(DIR.SERVER, "events.R"))
source(file.path(DIR.SERVER.OUTPUTS, "outputs.R"))

# macro

# def gen_server func
gen_server <- function(server.params) {
    # gen server
    server <- function(input, output, session) {
        # record start_time
        print("Initing server...")
        start_time <- Sys.time()
        ## set server envs
        # init server envs
        server.envs <- list(
            envs = shiny::reactiveValues(
                de.ctrl.panel.conds = list(),
                ge.ctrl.panel.gene.type = TEXT.INPUT.NONE
            ),
            events = list(onload.reg.table = shiny::reactiveValues(
                ov.ctrl.panel.gene.type = FALSE,
                ge.ctrl.panel.gene.type = FALSE,
                ge.ctrl.panel.cell.type = FALSE
            ))
        )

        # set server events
        de.result <- gen_server.event.de.result(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        ); server.envs$events$de.result <- de.result
        # gen onload events
        gen_server.event.onload(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )

        # gen outputs
        gen_server.outputs(
            input = input,
            server.params = server.params,
            server.envs = server.envs,
            output = output
        )
        
        # record end_time
        end_time <- Sys.time()
        print(paste0("Init server runs for ", as.numeric(end_time-start_time), "s."))
    }
    return(server)
}

