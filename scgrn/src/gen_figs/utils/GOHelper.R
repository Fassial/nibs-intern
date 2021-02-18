###################################
# Created on 09:35, Feb. 18th, 2021
# Author: fassial
# Filename: GOHelper.R
###################################
# dep
library(ggplot2)
# local dep

# macro

# def theme_blank var
theme_blank <- ggplot2::theme(
    axis.line = ggplot2::element_blank(),
    axis.text.x = ggplot2::element_blank(),
    axis.text.y = ggplot2::element_blank(),
    axis.ticks = ggplot2::element_blank(),
    axis.title.x = ggplot2::element_blank(),
    axis.title.y = ggplot2::element_blank(),
    panel.background = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),
    plot.background = ggplot2::element_blank()
)

