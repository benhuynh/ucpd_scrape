library(rMaps)
library(shiny)
#year <- subset(dataset,format((as.Date(dataset$Occurred,'%m/%d/%Y')),'%Y')=='0014')
#month <- subset(year,format((as.Date(dataset$Occurred,'%m/%d/%Y')),'%m')=='11')
#vc <- dataset[grep(paste(violentcrime, collapse='|'), dataset$Incident, ignore.case=TRUE),]
#nonc <- dataset[grep(paste(noncrime,collapse='|'),dataset$Incident,ignore.case=TRUE),]
#nonc <- rbind(nonc,medical)

#allbut <- rbind(nonc,vc)

#nonviolent <- dataset[setdiff(rownames(dataset),rownames(allbut)),]

# shinyServer(function(input,output) {
#   outdata <- reactive({
#   if(input$year=='All') {
#     year <- dataset
#   }
#   else {
#   year <- subset(dataset,format((as.Date(dataset$Occurred,'%m/%d/%Y')),'%Y')==input$year)
#   }
#   if(input$month=='All') {
#     month <- year
#   }
#   else {
#     month <- subset(year,format((as.Date(dataset$Occurred,'%m/%d/%Y')),'%m')==input$month)
#   }
#   if(input$type=='All') {
#     outdata <- month
#     return(outdata)
#     
#   }
#   else {
#   vc <- month[grep(paste(violentcrime, collapse='|'), month$Incident, ignore.case=TRUE),]
#   nonc <- month[grep(paste(noncrime,collapse='|'),month$Incident,ignore.case=TRUE),]
#   nonc <- rbind(nonc,medical)
#   allbut <- rbind(nonc,vc)
#   nonviolent <- month[setdiff(rownames(month),rownames(allbut)),]
#   if(input$type=='Violent Crime') {
#     outdata <- vc    
#   }
#   if(input$type=='Non-Violent Crime') {
#     outdata <- nonviolent    
#   }
#   if(input$type=='Non-crime') {
#     outdata <- nonc    
#   }
#   }
shinyServer(function(input,output) {
#   datainput <- reactive({
#     if(input$type=='All') {
#           isolate({outdata <- dataset
#           return(outdata) 
#           })
#         }
#         else {
#           isolate({
#         vc <- dataset[grep(paste(violentcrime, collapse='|'), dataset$Incident, ignore.case=TRUE),]
#         nonc <- dataset[grep(paste(noncrime,collapse='|'),dataset$Incident,ignore.case=TRUE),]
#         medic <- data[grep(paste(medical,collapse='|'),data$Incident,ignore.case=TRUE),]
#         nonc <- rbind(nonc,medic)
#         allbut <- rbind(nonc,vc)
#         nonviolent <- dataset[setdiff(rownames(dataset),rownames(allbut)),]
#           })
#         if(input$type=='Violent Crime') {
#           isolate({
#           outdata <- vc 
#           return(outdata)
#           })
#         }
#         if(input$type=='Non-Violent Crime') {
#           isolate({
#           outdata <- nonviolent    
#           return(outdata)
#           })
#         }
#         if(input$type=='Non-crime') {
#           isolate({
#           outdata <- nonc 
#           return(outdata)
#           })
#         }
#         }
#   })
#datainput <- reactive({
 #outdata <- subset(dataset,format((as.Date(dataset$Occurred,'%m/%d/%Y')),'%m')==input$month)
  #outdata <- droplevels(outdata)
  #return(outdata)
#})


# inp <- reactive({
# isolate({sser(input$month)})
# })
# 
# nnp <- reactive({
#   input$get
#   isolate({
#     return(inp())
#   })
# })

#observe({
#  sser(input$month)
#})

output$chart1 <- renderMap({  
  
main(eval(as.name(input$type)))
})

})
#})