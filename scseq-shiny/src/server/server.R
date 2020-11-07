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

# def gen_server func
gen_server <- function(server.params) {
    # gen server
    server <- function(input, output, session) {
        # set server.events
        result <- gen_event.result(
            input = input,
            server.params = server.params
        )
        server.events <- list(
            result = result
        )
        ## first tabItem "overview"
        # dimplot
        output$dimplot <- gen_output.dimplot(
            input = input,
            server.params = server.params,
            server.events = server.events
        )
        # hover plotly
        output$hoverplot <- gen_output.hoverplot(
            input = input,
            server.params = server.params,
            server.events = server.events
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
            server.events = server.events
        )
  
        #---------------------------------------------------------------
        ## second tabItem content "de_analysis"
        # generic function: parses conditions that will be passed to WhichCells() function
        # generates DE analysis result
        output$downloadResult <- function(
            input = input,
            server.params = server.params,
            server.events = server.events
        )
  
        output$de_result <- gen_output.de_result(
            input = input,
            server.params = server.params,
            server.events = server.events
        )
  
        output$preview_left <- gen_output.preview_left(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$preview_right <- gen_output.preview_right(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_factor_1 <- gen_output.DE_ctrl_panel_factor_1(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_factor_2 <- gen_output.DE_ctrl_panel_factor_2(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_factor_3 <- gen_output.DE_ctrl_panel_factor_3(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_factor_4 <- gen_output.DE_ctrl_panel_factor_4(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_left_level_1 <- gen_output.DE_ctrl_panel_left_level_1(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_left_level_2 <- gen_output.DE_ctrl_panel_left_level_2(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_left_level_3 <- gen_output.DE_ctrl_panel_left_level_3(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_left_level_4 <- gen_output.DE_ctrl_panel_left_level_4(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_right_level_1 <- gen_output.DE_ctrl_panel_right_level_1(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_right_level_2 <- gen_output.DE_ctrl_panel_right_level_2(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_right_level_3 <- gen_output.DE_ctrl_panel_right_level_3(
            input = input,
            server.params = server.params,
            server.events = server.events
        )

        output$DE_ctrl_panel_right_level_4 <- gen_output.DE_ctrl_panel_right_level_4(
            input = input,
            server.params = server.params,
            server.events = server.events
        )
    }
    return(server)
}

