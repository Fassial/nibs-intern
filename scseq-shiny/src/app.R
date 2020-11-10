###################################
# Modified on 17:27, Nov. 6th, 2020
# Modifier: fassial
# Filename: app.R
###################################
# dep
# local dep
DIR.ROOT <- file.path(getwd())
DIR.SRC <- file.path(DIR.ROOT, "src")
source(file.path(DIR.SRC, "defs.Rh"))
source(file.path(DIR.UI, "ui.R"))
source(file.path(DIR.SERVER, "server.R"))

# macro
DIR.DATA <- file.path(DIR.ROOT, "data")
FILE.DATA <- file.path(DIR.DATA, "cells_preprocessed.rds")

## init page
cells <- readRDS(FILE.DATA)
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
char.vars <- names(which(sapply(cells@meta.data, is.character)))
# Numeric metadata
num.vars <- c(names(which(sapply(cells@meta.data, is.numeric))), rownames(cells))
# Categorical metadata
cat.vars <- c(
    "Cell Type"="cell_type",
    "Treatment"="treat",
    "Dose"="dose",
    "Duration"="duration",
    "Louvain clusters"="integrated_snn_res.0.3",
    "Library"="codename",
    "Mouse"="mouse",
    "Serum"="serum"
)

# init ui.params
ui.params <- list(
    cells = cells,
    markers = markers
)
# init ui
ui <- gen_ui(ui.params = ui.params)

# init server.params
server.params <- list(
    cells = cells,
    char.vars = char.vars,
    num.vars = num.vars,
    cat.vars = cat.vars
)
# init server
server <- gen_server(server.params = server.params)

