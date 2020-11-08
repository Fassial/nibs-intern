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
                de.ctrl.panel.lists = NULL
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
            de.ctrl.panel.lists <- server.envs$envs$de.ctrl.panel.lists
            ## set de.ctrl.panel
            de.ctrl.panel.title <- "shiny::fluidRow(
                column(2, offset = 0, div(style=\"
                    text-align:right;
                \", shiny::helpText(\"Find markers by:\"))),
                column(4, offset = 0, div(style=\"
                    text-align:left;
                \", shiny::helpText(\"Marker 1:\"))),
                column(4, offset = 0, div(style=\"
                    text-align:left;
                \", shiny::helpText(\"Marker 2:\")))
            )"
            de.ctrl.panel.entrys <- ""
            if (length(de.ctrl.panel.lists) > 0) {for (i in (1:length(de.ctrl.panel.lists))) {
                print(paste0(i, de.ctrl.panel.lists[i]))
                de.ctrl.panel.entrys <- paste0(de.ctrl.panel.entrys, ",", gen_comp.de.ctrl.panel.entry(
                    input = input,
                    server.params = server.params,
                    server.envs = server.envs,
                    entry.no = i
                ))
            }}
            # set de.ctrl.panel
            de.ctrl.panel <- paste0("shiny::fluidRow(",
                paste0(de.ctrl.panel.title, de.ctrl.panel.entrys),
            ")")
            shiny::fluidRow(
                eval(parse(text = de.ctrl.panel))
            )
        })
        ## onclick event
        # de.ctrl.panel
        de.ctrl.panel.delete.button.events <- reactive({
            print("HERE!")
            de.ctrl.panel.lists.length <- server.envs$vars$de.ctrl.panel.lists.length
            if (de.ctrl.panel.lists.length > 0) {for (i in (1:de.ctrl.panel.lists.length)) {
                print("AGAIN")
                shinyjs::onclick(id = paste0("de.ctrl.panel.entry.delete.button", i), {
                    server.envs$envs$de.ctrl.panel.lists <- server.envs$envs$de.ctrl.panel.lists[-i]
                })
            }}
        })

        output$de.ctrl.panel.add <- gen_output.de.ctrl.panel.add(
            input = input,
            server.params = server.params,
            server.envs = server.envs
        )
        ## onclick event
        # de.ctrl.panel.add
        shinyjs::onclick(id = "de.ctrl.panel.add.button", {
            de.ctrl.panel.lists <- server.envs$envs$de.ctrl.panel.lists
            if (input$de.ctrl.panel.add.type == SELECT.INPUT.NONE) {
                # do nothing
            } else if (is.null(de.ctrl.panel.lists)) {
                de.ctrl.panel.lists <- array(input$de.ctrl.panel.add.type)
            } else {
                if (!(input$de.ctrl.panel.add.type %in% de.ctrl.panel.lists)) {
                    de.ctrl.panel.lists <- array(c(de.ctrl.panel.lists, input$de.ctrl.panel.add.type))
                }
            }
            # update server.envs$envs
            server.envs$envs$de.ctrl.panel.lists <- de.ctrl.panel.lists
            print(server.envs$envs$de.ctrl.panel.lists)
        })
    }
    return(server)
}

