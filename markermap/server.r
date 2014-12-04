#library(rMaps)
shinyServer(function(input,output) {
  
type <- reactive({
  return(eval(as.name(input$type)))
})

daterange <- reactive({
  newset <- type()
  newset <- subset(newset, newset$Occurred >= input$dates[1] & newset$Occurred <= input$dates[2])
  return(newset)
})

# year <- reactive({
#   newset <- type()
#   
#   if(input$year=='All'){
#     return(newset)
#   }
#   else if(input$year=='2011') {
#     return(subset(newset,format((as.Date(newset$Occurred,'%m/%d/%Y')),'%Y')=='0011'))     
#   }
# 
#   else if(input$year=='2012') {
#     return(subset(newset,format((as.Date(newset$Occurred,'%m/%d/%Y')),'%Y')=='0012'))     
#   }
#   
#   else if(input$year=='2013') {
#     return(subset(newset,format((as.Date(newset$Occurred,'%m/%d/%Y')),'%Y')=='0013'))     
#   }
#   
#   else if(input$year=='2014') {
#     return(subset(newset,format((as.Date(newset$Occurred,'%m/%d/%Y')),'%Y')=='0014'))     
#   }
# })
# 
# month <- reactive({
#   if(input$month=='All') {
#     return(year())
#   }
#   else {
#     return(subset(year(),format((as.Date(year()$Occurred,'%m/%d/%Y')),'%m')==input$month))
#   }
# })


output$chart1 <- renderMap({  
  
main(daterange())

})

})