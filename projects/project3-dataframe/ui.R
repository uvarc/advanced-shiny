dataTab <- tabPanel("data",
  selectInput("frame", "Data frame:", 
              choices = c("Choose data frame"= "", 
                          "datasets::mtcars", 
                          "datasets::iris", 
                          "mosaicData::CPS85"),
              selected = character()),
  selectInput("response", "Response var:", 
              choices = c("Waiting for you to choose frame" = "")),
  selectInput("explanatory", "Explan var:",
              choices = c("Waiting for you to choose response var" = "")),
  tableOutput("show_df")
)

plotTab <- tabPanel("plot",
  plotOutput("graph_data")
)

statsTab <- tabPanel("stats",
  verbatimTextOutput("regression_table")
)

ui <- fluidPage(
  tabsetPanel(
    dataTab,
    plotTab,
    statsTab
  )
)