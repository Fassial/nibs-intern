##################################
# Created on 19:50, Nov. 6th, 2020
# Author: fassial
# Filename: ui.R
##################################
# dep
library(shiny)
library(shinyjs)
# local dep
DIR.SERVER <- file.path(getwd(), "server")
source(file.path(DIR.SERVER, "outputs.R"))
source(file.path(DIR.SERVER, "events.R"))

# macro
SELECT.INPUT.NONE = "--please select--"

# def gen_server func
gen_server <- function(server.params) {
    # gen server
    server <- function(input, output, session) {
        # init server params
        cells <- server.params$cells
        metadata <- server.params$metadata
        char_vars <- server.params$char_vars
        num_vars <- server.params$num_vars
        cat_vars <- server.params$cat_vars
        # set server.envs
        result <- gen_event.result(
            input = input,
            server.params = server.params
        )
        server.envs <- list(
            envs = shiny::reactiveValues(
                de.ctrl.panel.types = NULL,
                de.ctrl.panel.conds.left = NULL,
                de.ctrl.panel.conds.right = NULL
            ),
            events = list(
                result = result
            )
        )
        ## first tabItem "overview"
        # dimplot
        output$dimplot <- gen_output.dimplot(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )
        # hover plotly
        output$hoverplot <- gen_output.hoverplot(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )
  
        ## some conditional controls on side-bar inputs
        # only enable `label` checkbox when `plottype` is "UMAP" or "TSNE", only enable `feature` selectize input box when `plottype` is "Gene expression"
        shiny::observeEvent(input$plottype, {
            if (input$plottype == "UMAP") {
                shinyjs::enable("label")
                shinyjs::disable("feature")
            } else if (input$plottype == "TSNE") {
                shinyjs::enable("label")
                shinyjs::disable("feature")
            } else if (input$plottype == "GENE") {
                shinyjs::disable("label")
                shinyjs::enable("feature")
            }
        })
        # only enable `htype` selectInput when `highlight` is toggled 
        shiny::observeEvent(input$highlight, {
            if (input$highlight) {
                shinyjs::enable("htype")
                shinyjs::enable("htype_value")
                shinyjs::enable("htype_threshold")
            } else {
                shinyjs::disable("htype")
                shinyjs::disable("htype_value")
                shinyjs::disable("htype_threshold")
            }
        })
  
        # conditional highlight
        output$conditional_highlight = gen_output.conditional_highlight(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )
  
        #---------------------------------------------------------------
        ## second tabItem content "de_analysis"
        # generic function: parses conditions that will be passed to WhichCells() function
        # generates DE analysis result
        output$downloadResult <- function(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )
  
        output$de_result <- gen_output.de_result(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )
  
        output$preview_left <- gen_output.preview_left(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )

        output$preview_right <- gen_output.preview_right(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )

        #output$de.ctrl.panel <- gen_output.de.ctrl.panel(
        #    input = input,
        #    server.params = server.params,
        #    server.envs = server.envs
        #)
        output$de.ctrl.panel <- shiny::renderUI({
            de.ctrl.panel.types <- server.envs$envs$de.ctrl.panel.types
            ## set de.ctrl.panel
            # set de.ctrl.panel.title
            de.ctrl.panel.title <- list(shiny::fluidRow(
                column(2, offset = 0, div(style="
                    text-align:right;
                ", shiny::helpText("Find markers by:"))),
                column(4, offset = 0, div(style="
                    text-align:left;
                ", shiny::helpText("Marker 1:"))),
                column(4, offset = 0, div(style="
                    text-align:left;
                ", shiny::helpText("Marker 2:")))
            ))
            # set de.ctrl.panel.entries
            de.ctrl.panel.entries <- lapply(seq_len(length(de.ctrl.panel.types)), function(i) {
                gen_comp.de.ctrl.panel.entry(
                    input = input,
                    server.params = server.params,
                    server.envs = server.envs,
                    entry.no = i
                )
            })
            # set de.ctrl.panel
            de.ctrl.panel <- c(de.ctrl.panel.title, de.ctrl.panel.entries)
            do.call(shiny::fluidRow, de.ctrl.panel)
        })

        output$de.ctrl.panel.add <- gen_output.de.ctrl.panel.add(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )
        ## onclick event
        # de.ctrl.panel.add
        shinyjs::onclick(id = "de.ctrl.panel.add.button", {
            # init server envs
            de.ctrl.panel.types <- server.envs$envs$de.ctrl.panel.types
            de.ctrl.panel.conds.left <- server.envs$envs$de.ctrl.panel.conds.left
            de.ctrl.panel.conds.right <- server.envs$envs$de.ctrl.panel.conds.right
            if (input$de.ctrl.panel.add.type == SELECT.INPUT.NONE) {
                # do nothing
            } else if (is.null(de.ctrl.panel.types)) {
                de.ctrl.panel.types <- array(input$de.ctrl.panel.add.type)
                de.ctrl.panel.conds.left <- array(SELECT.INPUT.NONE)
                de.ctrl.panel.conds.right <- array(SELECT.INPUT.NONE)
            } else {
                if (!(input$de.ctrl.panel.add.type %in% de.ctrl.panel.types)) {
                    de.ctrl.panel.types <- array(c(de.ctrl.panel.types, input$de.ctrl.panel.add.type))
                    de.ctrl.panel.conds.left <- array(c(de.ctrl.panel.conds.left, SELECT.INPUT.NONE))
                    de.ctrl.panel.conds.right <- array(c(de.ctrl.panel.conds.right, SELECT.INPUT.NONE))
                }
            }
            # update server.envs$envs
            server.envs$envs$de.ctrl.panel.types <- de.ctrl.panel.types
            server.envs$envs$de.ctrl.panel.conds.left <- de.ctrl.panel.conds.left
            server.envs$envs$de.ctrl.panel.conds.right <- de.ctrl.panel.conds.right
            print("server:")
            print(server.envs$envs$de.ctrl.panel.types)
            print(server.envs$envs$de.ctrl.panel.conds.left)
            print(server.envs$envs$de.ctrl.panel.conds.right)
        })
    }
    return(server)
}

