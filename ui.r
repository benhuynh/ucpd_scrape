require(rCharts)
require(shiny)
options(shiny.trace=FALSE)
shinyUI(pageWithSidebar(
  headerPanel("UCPD Report Incidence"),
  
  sidebarPanel(
    #selectInput(inputId = "year",
     #           label = "Select year",
      #          choices = c('0011','0012','0013','0014','All'),
       #         selected = '0011'),
    #selectInput("month",
     #           label = "Select month",
      #          choices = sort(unique(format((as.Date(dataset$Occurred,'%m/%d/%Y')),'%m'))),
       #         selected = '01'),
    selectInput(inputId = 'type',
                label = 'Select type of incident',
                choices = c('Violent','NonViolent','NonCrime'),
                selected = 'All')#,
    #actionButton("get", "Get Map")       
  ),
  mainPanel(
    tags$style('.leaflet {height: 400px;}'),
    showOutput("chart1",'leaflet')
)))