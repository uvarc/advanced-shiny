Raw_data <- reactive({
  req(input$file1)
  df <- read.delim(input$file1$datapath, header = input$header, sep = input$sep)
  return(df)
})

observeEvent(input$file1,
             updateSelectInput(session, "response", choices=names(Raw_data()))
)

observeEvent(input$file1,
             updateSelectInput(session, "explanatory", choices=names(Raw_data()))
)

data <- reactive({
  Raw_data()[c(input$response, input$explanatory)]
})

output$show_df <- renderTable({
  head(data())
})

output$graph_data <- renderPlot({
  ggplot(data(), aes_string(x = input$explanatory, y=input$response)) + geom_point()
})

formula <- reactive({
  paste0(input$response,"~",input$explanatory)
})

fitted_model <- reactive({
  lm(formula(), data=data())
})

output$regression_table <- renderPrint({
  summary(fitted_model())
})

outputOptions(output, "graph_data", suspendWhenHidden = FALSE)
outputOptions(output, "regression_table", suspendWhenHidden = FALSE)