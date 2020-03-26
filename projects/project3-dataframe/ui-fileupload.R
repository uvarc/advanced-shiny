dataTab <- tabPanel("data",
                    fileInput("file1" ,"Choose CSV File",
                              multiple = FALSE,
                              accept = c(
                                "text/csv",
                                "text/comma-separated-values,text/plain",
                                ".csv")
                              ),
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