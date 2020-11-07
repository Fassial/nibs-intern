###################################
# Modified on 17:27, Nov. 6th, 2020
# Modifier: fassial
# Filename: app.R
###################################
# dep
library(rdrop2)
library(dplyr)
# local dep
DIR.ROOT <- getwd()
DIR.UI <- file.path(DIR.ROOT, "ui")
DIR.SERVER <- file.path(DIR.ROOT, "server")
source(file.path(DIR.UI, "ui.R"))
source(file.path(DIR.SERVER, "server.R"))

# macro
DIR.DATA <- file.path(getwd(), "..", "data")
FILE.DATA <- file.path(DIR.DATA, "cells_preprocessed.rds")

# init page
cells <- readRDS(FILE.DATA)
metadata <- cells@meta.data
# Additional variables may not fit into the space
markers <- c(
    "Gh","Prl","Pomc","Tbx19","Pax7",
    "Fshb","Lhb","Tshb","Pecam1",
    "Col1a1","Lcn2","Pbk","Hbb-bs",
    "C1qa","treat","dose","duration",
    "percent.mito","nCount_RNA",
    "nFeature_RNA","cell_type"
)
# Character type metadata
char_vars <- names(which(sapply(cells@meta.data, is.character)))
# Numeric metadata
num_vars <- c(names(which(sapply(cells@meta.data, is.numeric))), rownames(cells))
# Categorical metadata
cat_vars <- c(
    "Cell Type"="cell_type",
    "Treatment"="treat",
    "Dose"="dose",
    "Duration"="duration",
    "Louvain clusters"="integrated_snn_res.0.3",
    "Library"="codename",
    "Mouse"="mouse",
    "Serum"="serum"
)  

# init ui
ui <- gen_ui(cells = cells, markers = markers)

# init server.params
server.params <- list(
    cells = cells,
    metadata = metadata,
    char_vars = char_vars,
    num_vars = num_vars,
    cat_vars = cat_vars
)
# init server
server <- gen_server(server.params = server.params)

# run the application 
shinyApp(ui = ui, server = server)

