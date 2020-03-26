library(shiny)
library(ggplot2)
library(rmarkdown)

source("ui-writeoutput.R")

server <- function(input, output, session) {
  source("server-writeoutput.R", local=TRUE)
}

options(shiny.reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)