xdata1 <- getURL('https://incidentreports.uchicago.edu//viewReport.php?reportDate=1293861600',ssl.verifypeer=FALSE)
table1 <- readHTMLTable(xdata1)
table1 <- as.data.frame(table1)
colnames(table1) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
table1 <- table1[-1,]
row.names(table1) <- NULL



for(i in seq(1293948000,1299996000,86400)) {
  
  xdata <- getURL(paste0('https://incidentreports.uchicago.edu//viewReport.php?reportDate=',i),ssl.verifypeer=FALSE)
  table <- readHTMLTable(xdata)
  table <- as.data.frame(table)
  if(length(names(table)==7)) {
  colnames(table) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
  table <- table[-1,]
  row.names(table) <- NULL
  table1 <- rbind(table,table1)
  }
}


for(i in seq(1300078800,1320555600,86400)) {
  
  xdata <- getURL(paste0('https://incidentreports.uchicago.edu//viewReport.php?reportDate=',i),ssl.verifypeer=FALSE)
  table <- readHTMLTable(xdata)
  table <- as.data.frame(table)
  if(length(names(table)==7)) {
    colnames(table) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
    table <- table[-1,]
    row.names(table) <- NULL
    table1 <- rbind(table,table1)
  }
}

for(i in seq(1320645600,1331445600,86400)) {
  
  xdata <- getURL(paste0('https://incidentreports.uchicago.edu//viewReport.php?reportDate=',i),ssl.verifypeer=FALSE)
  table <- readHTMLTable(xdata)
  table <- as.data.frame(table)
  if(length(names(table)==7)) {
    colnames(table) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
    table <- table[-1,]
    row.names(table) <- NULL
    table1 <- rbind(table,table1)
  }
}

for(i in seq(1331528400,1352095200,86400)) {
  
  xdata <- getURL(paste0('https://incidentreports.uchicago.edu//viewReport.php?reportDate=',i),ssl.verifypeer=FALSE)
  table <- readHTMLTable(xdata)
  table <- as.data.frame(table)
  if(length(names(table)==7)) {
    colnames(table) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
    table <- table[-1,]
    row.names(table) <- NULL
    table1 <- rbind(table,table1)
  }
}

for(i in seq(1352181600,1362895200,86400)) {
  
  xdata <- getURL(paste0('https://incidentreports.uchicago.edu//viewReport.php?reportDate=',i),ssl.verifypeer=FALSE)
  table <- readHTMLTable(xdata)
  table <- as.data.frame(table)
  if(length(names(table)==7)) {
    colnames(table) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
    table <- table[-1,]
    row.names(table) <- NULL
    table1 <- rbind(table,table1)
  }
}

for(i in seq(1362978000,1383544800,86400)) {
  
  xdata <- getURL(paste0('https://incidentreports.uchicago.edu//viewReport.php?reportDate=',i),ssl.verifypeer=FALSE)
  table <- readHTMLTable(xdata)
  table <- as.data.frame(table)
  if(length(names(table)==7)) {
    colnames(table) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
    table <- table[-1,]
    row.names(table) <- NULL
    table1 <- rbind(table,table1)
  }
}

for(i in seq(1383631200,1394344800,86400)) {
  
  xdata <- getURL(paste0('https://incidentreports.uchicago.edu//viewReport.php?reportDate=',i),ssl.verifypeer=FALSE)
  table <- readHTMLTable(xdata)
  table <- as.data.frame(table)
  if(length(names(table)==7)) {
    colnames(table) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
    table <- table[-1,]
    row.names(table) <- NULL
    table1 <- rbind(table,table1)
  }
}


for(i in seq(1394427600,1415858400,86400)) {
  
  xdata <- getURL(paste0('https://incidentreports.uchicago.edu//viewReport.php?reportDate=',i),ssl.verifypeer=FALSE)
  table <- readHTMLTable(xdata)
  table <- as.data.frame(table)
  if(length(names(table)==7)) {
    colnames(table) <- c('Incident','Location','Date/Time Reported','Date/Time Occurred','Comments','Disposition','UCPDI#')
    table <- table[-1,]
    row.names(table) <- NULL
    table1 <- rbind(table,table1)
  }
}


table1 <- na.omit(table1)
table1 <- subset(table1,table1$Incident != 'Void')
row.names(table1) <- NULL




