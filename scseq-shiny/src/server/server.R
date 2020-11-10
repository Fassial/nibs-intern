##################################
# Created on 19:50, Nov. 6th, 2020
# Author: fassial
# Filename: ui.R
##################################
# dep
library(shiny)
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
        ## set server envs
        # init server envs
        server.envs <- list(
            envs = shiny::reactiveValues(
                de.ctrl.panel.types = NULL,
                de.ctrl.panel.conds.left = NULL,
                de.ctrl.panel.conds.right = NULL
            ),
            events = list()
        )
        # set server events
        de.result <- gen_server.event.de.result(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        ); server.envs$events$de.result <- de.result

        # gen outputs
        gen_server.outputs(
            input = input,
            server.params = server.params,
            server.envs = server.envs,
            output = output
        )
    }
    return(server)
}

