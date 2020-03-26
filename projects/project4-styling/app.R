library(shiny)
library(ggplot2)
library(rmarkdown)
library(bootstraplib)



source("ui.R")
source("server.R", local=TRUE)

options(shiny.reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)