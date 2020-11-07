##################################
# Created on 19:34, Nov. 6th, 2020
# Author: fassial
# Filename: body.R
##################################
# dep
library(shinydashboard)
# local dep

# macro

# def gen_body func
gen_body <- function(cells, markers) {
    # gen body
    body <- dashboardBody(
        tabItems(
            # first tab content
            tabItem(
                tabName = "overview",
                fluidRow(
                    # sidebar control panel
                    column(3,
                        # wellPanel No.1
                        wellPanel(
                            # legend and label
                            selectInput(
                                inputId = "ltype",
                                label = "Legend:",
                                choices = c("Louvain clusters res0.3"="integrated_snn_res.0.3","Cell type (putative)"="cell_type")
                            ),
                            checkboxInput(
                                inputId = "label",
                                label = "Toggle label",
                                value = FALSE
                            )
                        ),
                        # wellPanel No.2
                        wellPanel(
                            # figure control
                            selectInput(
                                inputId = "assay",
                                label = "Assay view:",
                                choices = c("Integrated","Un-integrated")
                            ),
                            selectInput(
                                inputId = "plottype",
                                label = "Type of Figure:",
                                choices = c("UMAP"="UMAP","TSNE"="TSNE","Gene expression"="GENE")
                            ),
                            selectizeInput(
                                inputId = "feature",
                                label = "Select a gene to plot expression level:",
                                choices = rownames(cells),
                                selected = "Gh",
                                multiple = FALSE,
                                options = NULL
                            )
                        ),
                        # wellPanel No.3
                        wellPanel(
                            # functionality highlight
                            selectInput(
                                inputId = "htype",
                                label = "Highlight:",
                                choices = c("", names(cells@meta.data), rownames(cells))
                            ),
                            uiOutput("conditional_highlight"),
                            ## conditionalPanel is not ideally the best function to use in R environment
                            # conditionalPanel(
                            #     condition = c("input.htype == 'barcode' || input.htype == 'codename'"),
                            #     selectInput(inputId = "test", label = "test", choices = c("test","test2"))),
                            checkboxInput(
                                inputId = "highlight",
                                label = "Toggle highlight",
                                value = FALSE
                            )
                        ),
                        # wellPanel No.4
                        wellPanel(
                            # variables extracted by hover
                            selectInput(
                                inputId = "vars_to_fetch", label = "Variables extracted by hover:", multiple = TRUE,
                                choices = c(rownames(cells),names(cells@meta.data)),
                                selected = markers
                            )
                        )
                    ),
                    # show dimplot
                    column(8, box(plotOutput("dimplot", height = 400))),
                    # Show plotly
                    column(8, box(plotlyOutput("hoverplot"), height = 400))
                )
            ),
            #-----------------------------------------------------------------------------------------
            # second tab content
            tabItem(
                tabName = "de_analysis",
                # preview of cells
                column(8,
                    offset = 3,
                    wellPanel(
                        fluidRow(
                            column(6, plotOutput("preview_left")),
                            column(6, conditionalPanel(
                                condition = "input.test_perform != 'Multiple'",
                                plotOutput("preview_right")
                            ))
                        )
                    )
                ),
                # hr
                hr(),
                # control panels
                fluidRow(
                    column(3, wellPanel(
                        selectInput(
                            inputId = "test_perform",
                            label = "Test:",
                            choices = c("Grouped comparison","Multiple","Conserved")
                        ),
                        selectInput(
                            inputId = "preview_type",
                            label = "Assay view:",
                            choices = c("Integrated UMAP"="umap.int", "Unintegrated UMAP"="umap")
                        ),
                        # hr
                        hr(),
                        actionButton(
                            inputId = "analyze_button",
                            label = "Analyze Differential Expression"
                        )
                    )),
                    column(8, wellPanel(
                        fluidRow(
                            column(3, offset = 1, uiOutput("DE_ctrl_panel_factor_1")),
                            column(3, offset = 1, uiOutput("DE_ctrl_panel_left_level_1")),
                            column(3, uiOutput("DE_ctrl_panel_right_level_1"))
                        ),
                        fluidRow(
                            column(3, offset = 1, uiOutput("DE_ctrl_panel_factor_2")),
                            column(3, offset = 1, uiOutput("DE_ctrl_panel_left_level_2")),
                            column(3, uiOutput("DE_ctrl_panel_right_level_2"))
                        ),
                        fluidRow(
                            column(3, offset = 1, uiOutput("DE_ctrl_panel_factor_3")),
                            column(3, offset = 1, uiOutput("DE_ctrl_panel_left_level_3")),
                            column(3, uiOutput("DE_ctrl_panel_right_level_3"))
                        ),
                        fluidRow(
                            column(3, offset = 1, uiOutput("DE_ctrl_panel_factor_4")),
                            column(3, offset = 1, uiOutput("DE_ctrl_panel_left_level_4")),
                            column(3, uiOutput("DE_ctrl_panel_right_level_4"))
                        )
                    ))
                ),
                # analyze output
                wellPanel(
                    DT::DTOutput("de_result")
                )
            )
        )
    )
    return(body)
}

