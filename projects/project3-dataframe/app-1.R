library(shiny)
library(ggplot2)

source("ui-fileupload.R")

server <- function(input, output, session) {
  source("server-fileupload.R", local=TRUE)
}

options(shiny.reactlog=TRUE)
reactlogReset()
# after App runs:  reactlogShow()

shinyApp(ui, server)