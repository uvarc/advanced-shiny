library(shiny)
library(mosaicData)
library(ggplot2)

source("ui.R")

server <- function(input, output, session) {
  source("server.R", local=TRUE)
}

options(shiny.reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)