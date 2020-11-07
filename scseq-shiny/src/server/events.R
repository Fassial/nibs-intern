##################################
# Created on 20:54, Nov. 6th, 2020
# Author: fassial
# Filename: events.R
##################################
# dep
library(shiny)
library(tibble)
library(Seurat)
# local dep
DIR.SERVER <- file.path(getwd(), "server")
source(file.path(DIR.SERVER, "utils.R"))

# macro

# def gen_event.result func
gen_event.result <- function(input, server.params) {
    # init server params
    cells <- server.params$cells
    metadata <- server.params$metadata
    char_vars <- server.params$char_vars
    num_vars <- server.params$num_vars
    cat_vars <- server.params$cat_vars
    # gen event.result
    event.result <- shiny::eventReactive(input$analyze_button, {
        if (input$test_perform == "Multiple") {
            Seurat::Idents(cells) <- "cell_type"
            tab <- Seurat::FindAllMarkers(cells)
        } else if (input$test_perform == "Conserved") {
            f <- c("f"=input$factor_1)
            l_left <- c("l"=input$level_left_1)
            l_right <- c("l"=input$level_right_1)

            ident_left <- parse_cells_chosen(f, l_left, server.params = server.params)
            ident_right <- parse_cells_chosen(f, l_right, server.params = server.params)

            if (input$level_right_1 == "") {
                shiny::withProgress(message = "Computing in progress. Please wait.", {
                    tab <- Seurat::FindConservedMarkers(cells,
                        ident.1 = input$level_left_1,
                        grouping.var = "stim"
                    )
                })
            } else {
                shiny::withProgress(message = "Computing in progress. Please wait.", {
                    tab <- Seurat::FindConservedMarkers(cells,
                        ident.1 = input$level_left_1,
                        ident.2 = input$level_right_1,
                        grouping.var = "stim"
                    )
                })
            }
        } else if (input$test_perform == "Grouped comparison") {
            f <- c("f1"=input$factor_1, "f2"=input$factor_2, "f3"=input$factor_3, "f4"=input$factor_4)
            l_left <- c("l1"=input$level_left_1, "l2"=input$level_left_2, "l3"=input$level_left_3, "l4"=input$level_left_4)
            l_right <- c("l1"=input$level_right_1, "l2"=input$level_right_2, "l3"=input$level_right_3, "l4"=input$level_right_4)
      
            ident_left <- parse_cells_chosen(f, l_left, server.params = server.params)
            ident_right <- parse_cells_chosen(f, l_right, server.params = server.params)
      
            shiny::withProgress(message = "Computing in progress. Please wait.", {
                tab <- Seurat::FindMarkers(cells,
                    ident.1 = ident_left,
                    ident.2 = ident_right
                )
                tab <- tibble::rownames_to_column(tab, "gene")
            })
        }
        return(tab)
    })
    return(event.result)
}

