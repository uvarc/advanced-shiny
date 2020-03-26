dataTab <- tabPanel("data",
                    sidebarLayout(
                      sidebarPanel(
                        fileInput("file1" ,"Choose Any Delimited File",
                                  multiple = FALSE,
                                  accept = c(
                                    "text/csv",
                                    "text/comma-separated-values,text/plain",
                                    ".csv",
                                    "text/tsv",
                                    "text/tab-separated-values,text/plain",
                                    ".tsv",
                                    ".txt")
                        ),
                        
                        checkboxInput("header", "Header",value = TRUE),
                        radioButtons("sep", "Delimiter", 
                                     choices = c(Comma = ",", Semicolon = ";", Tab = "\t"), selected = ",")
                      ),
                      mainPanel(
                        selectInput("response", "Response var:", 
                                    choices = c("Waiting for you to choose frame" = "")),
                        selectInput("explanatory", "Explan var:",
                                    choices = c("Waiting for you to choose response var" = "")),
                        tableOutput("show_df")
                      )
                    )
)

plotTab <- tabPanel("plot",
                    plotOutput("graph_data")
)

statsTab <- tabPanel("stats",
                     verbatimTextOutput("regression_table")
)

reportTab <- tabPanel("report",
                      tags$br(),
                      p("Download your chosen data to a dataframe"),
                      downloadButton("csvdownload", "Download Dataframe"),
                      tags$br(),tags$br(),tags$br(),
                      p("Print all outputs to a HTML report"),
                      downloadButton("htmldownload", "Download HTML Report")
)

ui <- fluidPage(
  tabsetPanel(
    dataTab,
    plotTab,
    statsTab,
    reportTab
  )
)