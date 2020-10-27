#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyjs)
library(plotly)
library(Seurat)
library(rdrop2)
library(dplyr)
library(tibble)
library(shinydashboard)


# token <- readRDS('token.rds')
# cells <- drop_read_csv("my_file.txt", dtoken=token, header=FALSE, sep='\t', col.names=c('c1','c2'))

cells <- readRDS('data/cells_preprocessed.rds')
metadata <- cells@meta.data
markers <- c("Gh","Prl","Pomc","Tbx19","Pax7","Fshb","Lhb","Tshb","Pecam1","Col1a1","Lcn2","Pbk","Hbb-bs","C1qa",
             "treat","dose","duration","percent.mito","nCount_RNA","nFeature_RNA","cell_type")  # Additional variables may not fit into the space
char_vars <- names(which(sapply(cells@meta.data, is.character)))  # Character type metadata
num_vars <- c(names(which(sapply(cells@meta.data, is.numeric))), rownames(cells))  # Numeric metadata
cat_vars <- c("Cell Type"="cell_type",
              "Treatment"="treat",
              "Dose"="dose",
              "Duration"="duration",
              "Louvain clusters"="integrated_snn_res.0.3",
              "Library"="codename",
              "Mouse"="mouse",
              "Serum"="serum")  # Categorical metadata

header <- dashboardHeader(title = "Pituitary scRNAseq")

sidebar <- dashboardSidebar(
  # Use shinyjs to disable/enable certain inputs
  shinyjs::useShinyjs(),
  
  sidebarMenu(
    menuItem("Overview", tabName = "overview", icon = icon("dashboard")),
    menuItem("DE analysis", tabName = "de_analysis", icon = icon("th"))
    # menuItem("Debug", tabName = "debug", icon = icon("th"))
  )
)

body <- dashboardBody(
    tabItems(
        # First tab content
        tabItem(
            tabName = "overview",
            fluidRow(

                # Sidebar control panel
                column(3,
                    # wellPanel No.1
                    wellPanel(
                        # Legend and label
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
                        # Figure control
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
                        # Functionality Highlight
                        selectInput(
                            inputId = "htype",
                            label = "Highlight:",
                            choices = c("", names(cells@meta.data), rownames(cells))
                        ),
                        uiOutput("conditional_highlight"),
                        ## conditionalPanel is not ideally the best function to use in R environment
                        # conditionalPanel(
                        #   condition = c("input.htype == 'barcode' || input.htype == 'codename'"),
                        #   selectInput(inputId = "test", label = "test", choices = c("test","test2"))),
                        checkboxInput(
                            inputId = "highlight",
                            label = "Toggle highlight",
                            value = FALSE
                        )
                    ),
                    # wellPanel No.4
                    wellPanel(
                        # Variables extracted by hover
                        selectInput(
                            inputId = "vars_to_fetch", label = "Variables extracted by hover:", multiple = TRUE,
                            choices = c(rownames(cells),names(cells@meta.data)),
                            selected = markers
                        )
                    )
                ),

                # Show dimplot
                column(8, box(plotOutput("dimplot", height = 400))),
                # Show plotly
                column(8, box(plotlyOutput("hoverplot"), height = 400))
            )
        ),
        #-----------------------------------------------------------------------------------------------------------------
        # Second tab content
        tabItem(
            tabName = "de_analysis",
            # Preview of cells
            column(8,
                offset = 3,
                wellPanel(
                    fluidRow(
                        column(6,
                            plotOutput("preview_left")
                        ),
                        column(6,
                            conditionalPanel(
                                condition = "input.test_perform != 'Multiple'",
                                plotOutput("preview_right")
                            )
                        )
                    )
                )
            ),
            # hr
            hr(),
            # Control panels
            fluidRow(
                column(3,
                    wellPanel(
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

                        hr(),

                        actionButton(
                            inputId = "analyze_button",
                            label = "Analyze Differential Expression"
                        )
                    )
                ),
                column(8,
                    wellPanel(
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
                    )
                )
            ),
            # Analyze output
            wellPanel(
                # downloadButton("download1","Download DE result as csv"),
                DT::DTOutput("de_result")
            )
            # fluidRow(textOutput("debug")),
            # fluidRow(textOutput("debug2"))
        )
    )
)

# Define UI for application that draws the page
ui <- dashboardPage(header, sidebar, body)

# Define server logic required to draw the page
server <- function(input, output, session) {
  ## First tabItem "overview"
  # Dimplot
  output$dimplot <- renderPlot({
    if (input$assay == "Integrated"){
      if (input$plottype == "UMAP"){
        if (input$highlight){
          if (input$htype == ""){
            cells.hl <- ""
          } else if (input$htype %in% num_vars){
            hl <- paste0(input$htype,">=",input$htype_threshold)
            cells.hl <- WhichCells(cells, expression = hl, slot = "counts")
          } else if (input$htype %in% char_vars) {
            hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
            cells.hl <- WhichCells(cells, expression = hl)
          }
          DimPlot(cells, reduction = "umap.int", cells.highlight = cells.hl) + NoLegend()
        } else {
          DimPlot(cells, reduction = "umap.int", group.by = input$ltype, label = input$label, label.size = 4) + NoLegend()
        }
      } else if (input$plottype == "TSNE"){
        if (input$highlight){
          if (input$htype == ""){
            cells.hl <- ""
          } else if (input$htype %in% num_vars){
            hl <- paste0(input$htype,">=",input$htype_threshold)
            cells.hl <- WhichCells(cells, expression = hl, slot = "counts")
          } else if (input$htype %in% char_vars) {
            hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
            cells.hl <- WhichCells(cells, expression = hl)
          }
          DimPlot(cells, reduction = "tsne.int", cells.highlight = cells.hl) + NoLegend()
        } else {
          DimPlot(cells, reduction = "tsne.int", group.by = input$ltype, label = input$label, label.size = 4) + NoLegend()
        }
      } else if (input$plottype == "GENE"){
        if (input$highlight){
          if (input$htype == ""){
            cells.hl <- ""
          } else if (input$htype %in% num_vars){
            hl <- paste0(input$htype,">=",input$htype_threshold)
            cells.hl <- WhichCells(cells, expression = hl, slot = "counts")
          } else if (input$htype %in% char_vars) {
            hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
            cells.hl <- WhichCells(cells, expression = hl)
          }
          DimPlot(cells, reduction = "umap.int", cells.highlight = cells.hl) + NoLegend()
        } else {
          FeaturePlot(cells, reduction = "umap.int",input$feature)
        }
      }
    } else if (input$assay == "Un-integrated"){
      if (input$plottype == "UMAP"){
        if (input$highlight){
          if (input$htype == ""){
            cells.hl <- ""
          } else if (input$htype %in% num_vars){
            hl <- paste0(input$htype,">=",input$htype_threshold)
            cells.hl <- WhichCells(cells, expression = hl, slot = "counts")
          } else if (input$htype %in% char_vars) {
            hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
            cells.hl <- WhichCells(cells, expression = hl)
          }
          DimPlot(cells, reduction = "umap", cells.highlight = cells.hl) + NoLegend()
        } else {
          DimPlot(cells, reduction = "umap", group.by = input$ltype, label = input$label, label.size = 4) + NoLegend()
        }
      } else if (input$plottype == "TSNE"){
        if (input$highlight){
          if (input$htype == ""){
            cells.hl <- ""
          } else if (input$htype %in% num_vars){
            hl <- paste0(input$htype,">=",input$htype_threshold)
            cells.hl <- WhichCells(cells, expression = hl, slot = "counts")
          } else if (input$htype %in% char_vars) {
            hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
            cells.hl <- WhichCells(cells, expression = hl)
          }
          DimPlot(cells, reduction = "tsne", cells.highlight = cells.hl) + NoLegend()
        } else {
          DimPlot(cells, reduction = "tsne", group.by = input$ltype, label = input$label, label.size = 4) + NoLegend()
        }
      } else if (input$plottype == "GENE"){
        if (input$highlight){
          if (input$htype == ""){
            cells.hl <- ""
          } else if (input$htype %in% num_vars){
            hl <- paste0(input$htype,">=",input$htype_threshold)
            cells.hl <- WhichCells(cells, expression = hl, slot = "counts")
          } else if (input$htype %in% char_vars) {
            hl <- paste0(input$htype,"==","\'",input$htype_value,"\'")
            cells.hl <- WhichCells(cells, expression = hl)
          }
          DimPlot(cells, reduction = "umap", cells.highlight = cells.hl) + NoLegend()
        } else {
          FeaturePlot(cells, reduction = "umap", input$feature)
        }
      }
    }
  })
  # Hover plotly
  output$hoverplot <- renderPlotly({
    DefaultAssay(cells) <- "RNA"
    if (input$assay == "Integrated"){
      if (input$plottype == "UMAP"){
        HoverLocator(DimPlot(cells, reduction = "umap.int") + NoLegend(), information = FetchData(cells, vars = input$vars_to_fetch, slot = "counts"))
      } else if (input$plottype == "TSNE"){
        HoverLocator(DimPlot(cells, reduction = "tsne.int") + NoLegend(), information = FetchData(cells, vars = input$vars_to_fetch, slot = "counts"))
      } else if (input$plottype == "GENE"){
        HoverLocator(FeaturePlot(cells, reduction = "umap.int",input$feature), information = FetchData(cells, vars = input$vars_to_fetch, slot = "counts"))
      }
    } else if (input$assay == "Un-integrated"){
      if (input$plottype == "UMAP"){
        HoverLocator(DimPlot(cells, reduction = "umap") + NoLegend(), information = FetchData(cells, vars = input$vars_to_fetch, slot = "counts"))
      } else if (input$plottype == "TSNE"){
        HoverLocator(DimPlot(cells, reduction = "tsne") + NoLegend(), information = FetchData(cells, vars = input$vars_to_fetch, slot = "counts"))
      } else if (input$plottype == "GENE"){
        HoverLocator(FeaturePlot(cells, reduction = "umap", input$feature), information = FetchData(cells, vars = input$vars_to_fetch, slot = "counts"))
      }
    }
  })
  
  ## Some conditional controls on side-bar inputs
  # Only enable `label` checkbox when `plottype` is "UMAP" or "TSNE", only enable `feature` selectize input box when `plottype` is "Gene expression"
  observeEvent(input$plottype, {
    if(input$plottype == "UMAP"){
      shinyjs::enable("label")
      shinyjs::disable("feature")
    } else if (input$plottype == "TSNE") {
      shinyjs::enable("label")
      shinyjs::disable("feature")
    } else if (input$plottype == "GENE"){
      shinyjs::disable("label")
      shinyjs::enable("feature")
    }
  })
  # Only enable `htype` selectInput when `highlight` is toggled 
  observeEvent(input$highlight, {
    if(input$highlight){
      shinyjs::enable("htype")
      shinyjs::enable("htype_value")
      shinyjs::enable("htype_threshold")
    } else {
      shinyjs::disable("htype")
      shinyjs::disable("htype_value")
      shinyjs::disable("htype_threshold")
    }
  })
  
  output$conditional_highlight = renderUI({
    if(input$htype %in% char_vars) {
      selectInput(
        inputId = "htype_value", 
        label = "", 
        choices = levels(factor(deframe(cells[[input$htype]]))))
    } else if (input$htype %in% num_vars) {
      min_val <- min(FetchData(cells, vars = input$htype, slot = "counts")); min_digit <- floor(log10(min_val))
      max_val <- max(FetchData(cells, vars = input$htype, slot = "counts")); max_digit <- floor(log10(max_val))
      sliderInput(
        inputId = "htype_threshold", 
        label = "Threshold:",
        min = floor(min_val/10^min_digit)*10^min_digit,
        max = ceiling(max_val/10^max_digit)*10^max_digit, # Didn't work very well at certain values (i.e. nFeature_RNA)
        value = max(FetchData(cells, vars = input$htype, slot = "counts")))
    }
  })
  
  #-----------------------------------------------------------------------------------------------------------------
  ## Second tabItem content "de_analysis"
  
  # Generic function: parses conditions that will be passed to WhichCells() function
  recursive_paste0 <- function(expr_condition, f_use, l_use){
    # Takes valid input$factors and input$levels, construct a condition clause that is passed to WhichCells(expression =...)
    if (length(f_use)==0){
      return (expr_condition)
    } else if (length(f_use)==1){
      expr_condition = paste0(expr_condition, f_use[1],"==","\'",l_use[1],"\'")
      f_use = f_use[-1]; l_use = l_use[-1]
      return (recursive_paste0(expr_condition, f_use, l_use))
    } else {
      expr_condition = paste0(expr_condition, f_use[1],"==","\'",l_use[1],"\'", " & ")
      f_use = f_use[-1]; l_use = l_use[-1]
      return (recursive_paste0(expr_condition, f_use, l_use))
    }
  }
  
  parse_cells_chosen <- function(f, l){
    # Initialize vector to store cells to be selected
    cells_selected <- ""
    if (any(l!="")){
      # Parse factor and levels
      f_use <- f[which(l!="")]
      l_use <- l[which(l!="")]
      
      # Parse expression condition
      expr_condition <- recursive_paste0(expr_condition = "", f_use, l_use)
      
      # Extract cell names
      cells_selected <- WhichCells(cells, expression = expr_condition)
    }
    return(cells_selected)
  }
  
  # Generates DE analysis result
  result <- eventReactive(input$analyze_button, {
    if (input$test_perform == "Multiple") {
      Idents(cells) <- "cell_type"
      tab <- FindAllMarkers(cells)
    } else if (input$test_perform == "Conserved") {
      f <- c("f"=input$factor_1)
      l_left <- c("l"=input$level_left_1)
      l_right <- c("l"=input$level_right_1)
      
      ident_left <- parse_cells_chosen(f, l_left)
      ident_right <- parse_cells_chosen(f, l_right)
      
      if (input$level_right_1 == "") {
        withProgress(message = "Computing in progress. Please wait.", {
          tab <- FindConservedMarkers(cells, ident.1 = input$level_left_1, grouping.var = "stim")
        })
      } else {
        withProgress(message = "Computing in progress. Please wait.", {
          tab <- FindConservedMarkers(cells, ident.1 = input$level_left_1, ident.2 = input$level_right_1, grouping.var = "stim")
        })
      }
    } else if (input$test_perform == "Grouped comparison") {
      f <- c("f1"=input$factor_1, "f2"=input$factor_2, "f3"=input$factor_3, "f4"=input$factor_4)
      l_left <- c("l1"=input$level_left_1, "l2"=input$level_left_2, "l3"=input$level_left_3, "l4"=input$level_left_4)
      l_right <- c("l1"=input$level_right_1, "l2"=input$level_right_2, "l3"=input$level_right_3, "l4"=input$level_right_4)
      
      ident_left <- parse_cells_chosen(f, l_left)
      ident_right <- parse_cells_chosen(f, l_right)
      
      withProgress(message = "Computing in progress. Please wait.", {
        tab <- FindMarkers(cells, ident.1 = ident_left, ident.2 = ident_right)
        tab <- tibble::rownames_to_column(tab, "gene")
      })
    }
    return(tab)
  })
  
  observeEvent(input$test, {
    print("hello")
    showModal(myModal())
  })
  
  output$downloadResult <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(result(), file)
    }
  )
  
  output$de_result <- DT::renderDT({  # https://github.com/rstudio/shiny/issues/2653
    DT::datatable(result(),
                  extensions = 'Buttons',
                  options = list(
                    dom = 'Bfrtip',
                    buttons = list(
                      "copy",
                      list(
                        extend = "collection",
                        text = 'Download DE result table',
                        action = DT::JS("function ( e, dt, node, config ) {
                                        Shiny.setInputValue('test', true, {priority: 'event'});
                                        }")))))
  })
  
  # https://github.com/rstudio/DT/issues/267
  myModal <- function() {
    div(id = "test",
        modalDialog(downloadButton("downloadResult","Download DE result as csv"),
                    easyClose = TRUE, title = "Download Table")
    )
  }
  
  output$preview_left <- renderPlot({
    if (input$test_perform == "Multiple"){
      if (input$factor_1 == ""){
        DimPlot(cells, reduction = input$preview_type, cells.highlight = "") + NoLegend()
      } else {
        DimPlot(cells, reduction = input$preview_type, group.by = input$factor_1) + NoLegend()
      }
    } else {
      f <- c("f1"=input$factor_1, "f2"=input$factor_2, "f3"=input$factor_3, "f4"=input$factor_4)
      l <- c("l1"=input$level_left_1, "l2"=input$level_left_2, "l3"=input$level_left_3, "l4"=input$level_left_4)
      
      # Get cells chosen
      cells.hl_preview <- parse_cells_chosen(f,l)
      
      # Plot output
      DimPlot(cells, reduction = input$preview_type, cells.highlight = cells.hl_preview, cols.highlight = "#CC0000") + NoLegend()
    }
  })
  
  output$preview_right <- renderPlot({
    if(input$test_perform != "Multiple"){
      f <- c("f1"=input$factor_1, "f2"=input$factor_2, "f3"=input$factor_3, "f4"=input$factor_4)
      l <- c("l1"=input$level_right_1, "l2"=input$level_right_2, "l3"=input$level_right_3, "l4"=input$level_right_4)
      
      cells.hl_preview <- parse_cells_chosen(f,l)
      
      # Plot output
      DimPlot(cells, reduction = input$preview_type, cells.highlight = cells.hl_preview, cols.highlight = "#FFCC00") + NoLegend()
    }
  })
  
  output$DE_ctrl_panel_factor_1 <- renderUI({
    if (input$test_perform == "Multiple"){
      selectInput(
        inputId = "factor_1",
        label = "Find markers by:",
        choices = c("", "Cell type"="cell_type"))
    } else if (input$test_perform == "Grouped comparison"){
      selectInput(
        inputId = "factor_1",
        label = "Define cell groups:",
        choices = c("",cat_vars))
    } else if (input$test_perform == "Conserved"){
      selectInput(
        inputId = "factor_1",
        label = "Conserved markers:",
        choices = c("","Cell Type"="cell_type"))
    }
  })
  
  output$DE_ctrl_panel_factor_2 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$level_left_1) && input$level_left_1 != "" && !is.null(input$level_right_1) && input$level_right_1 != "") {
      selectInput(
        inputId = "factor_2",
        label = "",
        choices = c("",cat_vars))
    }
  })
  
  output$DE_ctrl_panel_factor_3 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$level_left_2) && input$level_left_2 != "" && !is.null(input$level_right_2) && input$level_right_2 != "") {
      selectInput(
        inputId = "factor_3",
        label = "",
        choices = c("",cat_vars))
    }
  })
  
  output$DE_ctrl_panel_factor_4 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$level_left_3) && input$level_left_3 != "" && !is.null(input$level_right_3) && input$level_right_3 != "") {
      selectInput(
        inputId = "factor_4",
        label = "",
        choices = c("",cat_vars))
    }
  })
  
  output$DE_ctrl_panel_left_level_1 <- renderUI({
    if (input$test_perform == "Multiple") {
      # renders nothing
    } else {
      if (input$factor_1 == "") {
        selectInput(
          inputId = "level_left_1",
          label = "Group 1:",
          choices = c(""))
      } else {
        # flevels <- levels(factor(deframe(metadata_left[[input$factor_1]])))
        # flevels <- levels(factor(metadata[[input$factor_1]]))
        flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                                                         .[[\'",input$factor_1,"\']]")))))
        selectInput(
          inputId = "level_left_1",
          label = "Group 1:",
          choices = c("",flevels))
      }
    }
  })

  output$DE_ctrl_panel_left_level_2 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$factor_2)) {
      if (input$factor_2 == ""){
        selectInput(
          inputId = "level_left_2",
          label = "",
          choices = c(""))
      } else {
        flevels <- levels(factor(eval(parse(text= paste0("metadata %>%
                                                          filter(",input$factor_1,"==\'",input$level_left_1,"\') %>% 
                                                          .[[\'",input$factor_2,"\']]")))))
        selectInput(
          inputId = "level_left_2",
          label = "",
          choices = c("",flevels))
      }
    }
  })

  output$DE_ctrl_panel_left_level_3 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$factor_3)) {
      if (input$factor_3 == ""){
        selectInput(
          inputId = "level_left_3",
          label = "",
          choices = c(""))
      } else {
        flevels <- levels(factor(eval(parse(text= paste0("metadata %>%
                                                          filter(",input$factor_1,"==\'",input$level_left_1,"\') %>% 
                                                          filter(",input$factor_2,"==\'",input$level_left_2,"\') %>%
                                                          .[[\'",input$factor_3,"\']]")))))
        selectInput(
          inputId = "level_left_3",
          label = "",
          choices = c("",flevels))
      }
    }
  })

  output$DE_ctrl_panel_left_level_4 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$factor_4)) {
      if (input$factor_4 == ""){
        selectInput(
          inputId = "level_left_4",
          label = "",
          choices = c(""))
      } else {
        flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                                                          filter(",input$factor_1,"==\'",input$level_left_1,"\') %>% 
                                                          filter(",input$factor_2,"==\'",input$level_left_2,"\') %>%
                                                          filter(",input$factor_3,"==\'",input$level_left_3,"\') %>%
                                                          .[[\'",input$factor_4,"\']]")))))
        selectInput(
          inputId = "level_left_4",
          label = "",
          choices = c("",flevels))
      }
    }
  })
  
  output$DE_ctrl_panel_right_level_1 <- renderUI({
    if (input$test_perform == "Multiple"){
      # renders nothing
    } else {
      if (input$factor_1 == "") {
        selectInput(
          inputId = "level_right_1",
          label = "Group 2:",
          choices = c(""))
      } else {
        # flevels <- levels(factor(deframe(metadata_right[[input$factor_1]])))
        # flevels <- levels(factor(metadata[[input$factor_1]]))
        flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                                                          .[[\'",input$factor_1,"\']]")))))
        selectInput(
          inputId = "level_right_1",
          label = "Group 2:",
          choices = c("",flevels))
      }
    }
  })
  
  output$DE_ctrl_panel_right_level_2 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$factor_2)) {
      if (input$factor_2 == ""){
        selectInput(
          inputId = "level_right_2",
          label = "",
          choices = c(""))
      } else {
        flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                                                         filter(",input$factor_1,"==\'",input$level_right_1,"\') %>% 
                                                         .[[\'",input$factor_2,"\']]")))))
        selectInput(
          inputId = "level_right_2",
          label = "",
          choices = c("",flevels))
      }
    }
  })

  output$DE_ctrl_panel_right_level_3 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$factor_3)) {
      if (input$factor_3 == ""){
        selectInput(
          inputId = "level_right_3",
          label = "",
          choices = c(""))
      } else {
        flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                                                          filter(",input$factor_1,"==\'",input$level_right_1,"\') %>% 
                                                          filter(",input$factor_2,"==\'",input$level_right_2,"\') %>%
                                                          .[[\'",input$factor_3,"\']]")))))
        selectInput(
          inputId = "level_right_3",
          label = "",
          choices = c("",flevels))
      }
    }
  })

  output$DE_ctrl_panel_right_level_4 <- renderUI({
    if (input$test_perform != "Grouped comparison"){
      # renders nothing
    } else if (!is.null(input$factor_4)) {
      if (input$factor_4 == ""){
        selectInput(
          inputId = "level_right_4",
          label = "",
          choices = c(""))
      } else {
        flevels <- levels(factor(eval(parse(text= paste0("metadata %>% 
                                                          filter(",input$factor_1,"==\'",input$level_right_1,"\') %>% 
                                                          filter(",input$factor_2,"==\'",input$level_right_2,"\') %>%
                                                          filter(",input$factor_3,"==\'",input$level_right_3,"\') %>%
                                                          .[[\'",input$factor_4,"\']]")))))
        selectInput(
          inputId = "level_right_4",
          label = "",
          choices = c("",flevels))
      }
    }
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
