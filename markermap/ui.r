#require(rCharts)
options(shiny.trace=FALSE)
shinyUI(pageWithSidebar(
  headerPanel("UCPD Report Incidence"),
  
  sidebarPanel(
#     selectInput(inputId = "year",
#                 label = "Select year",
#                 choices = c('2011','2012','2013','2014','All'),
#                 selected = 'All'),
#     selectInput("month",
#                 label = "Select month",
#                 choices = c('01','02','03','04','05','06','07','08','09','10','11','12','All'),
#                 selected = 'All'),
    dateRangeInput("dates", label = h3("Date range"),
                   start = Sys.Date() - 60),
    selectInput(inputId = 'type',
                label = 'Select type of incident',
                choices = c('Violent','NonViolent','NonCrime','All'),
                selected = 'All'),
    actionButton("get", "Get Map")       
  ),
  mainPanel(
    tags$style('.leaflet {height: 800px;}'),
    showOutput("chart1",'leaflet')
)))