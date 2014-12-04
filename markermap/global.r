library(shiny)
library(rCharts)
dataset <- read.csv("finaldata.csv")
dataset$X <- NULL
dataset$Occurred <- as.character(dataset$Occurred)
dataset$Occurred <- strtrim(dataset$Occurred,8)
dataset$Occurred <- as.Date(dataset$Occurred,format='%m/%d/%Y')
dataset <- na.omit(dataset)
dataset$Occurred <- as.Date(dataset$Occurred,format='%m/%d/%Y')
dataset$Occurred <- as.Date(paste0(format(dataset$Occurred,'%m/%d/'),as.character(as.numeric(format(dataset$Occurred,'%Y')) + 2000)),format='%m/%d/%Y')



#Split dataset into three categories: Violent crime, nonviolent crime, and noncrime
All <- dataset
violentcrime <- c('Domestic Battery','Aggravated Battery','Battery','Criminal Sexual Assault','Assault','Aggravated Battery to Police Officer','Battery (Domestic)',
                  'Armed Robbery','Att. Armed Robbery','Unlawful Possession of a Weapon','Attempt Theft from Person',
                  'Att. Theft from Person','Reckless Discharge of a Firearm','Attempt Armed Robbery',
                  'Battery / Resisting Arrest','Unlawful Possession of a Firearm','Aggravated Battery of Police Officer',
                  'Unlawful Use of Weapon','Aggravated Assault','Aggravated Robbery','Battery / Domestic','Aggravated Assault of Police Officer',
                  'Unlawful Use of a Weapon','Homicide','Battery - Simple','Robbery - Attempted','Robbery - Strong Armed (Delayed Report)',
                  'Weapons Violation','Robbery - Strong Arm','Aggravated Battery of a Police Officer','Simple Battery','Robbery-Strong Arm',
                  'Battery-Simple','Simple Assault','Robbery - Attempted Strong Arm','Aggravated Battery of a Protected Employee',
                  'Armed Robbery Arrest','Unlawful Use of Weapons')  

vc <- dataset[grep(paste(violentcrime, collapse='|'), dataset$Incident, ignore.case=TRUE),]
Violent <-vc

noncrime <- c('Assist Other Agency','Found Property','Lost Property','Weapon Turn-In',
              'Missing Person','Fire Alarm','Information / Elevator Entrapment','Recovered Vehicle',
              'Information / Well-Being','Suspicious Person','Information / Disturbance','Public Peace Violation',
              'Noise Complaint','Non-criminal Damage to Property','Missing Person Found','Sick Person',
              'Information / Assist Other Agency','Information / Non Criminal','Non-Criminal','Non-Criminal Property Damage',
              'Non-Criminal Damage','Non-criminal Offense')

medical <- c('Injured Person','Mental Health Transport','Medical Call','Information / Medical Call','Information / Mental Health Transport',
             'Medical Transport','Sick Person','Injured Person - Accidental','Safety Hazard/Non-Criminal Offense','Well-Being Check')

medic <- dataset[grep(paste(medical,collapse='|'),dataset$Incident,ignore.case=TRUE),]

nonc <- dataset[grep(paste(noncrime,collapse='|'),dataset$Incident,ignore.case=TRUE),]
nonc <- rbind(nonc,medic)

allbut <- rbind(nonc,vc)

nonviolent <- dataset[setdiff(rownames(dataset),rownames(allbut)),]
NonCrime <- nonc
NonViolent <- nonviolent



main <- function(dset) {
    map <- Leaflet$new()
    map$setView(c(41.7907333,  -87.5968857), zoom = 14)
    map$tileLayer(provider = 'OpenStreetMap')
    #map$set(dom = 'chart1')
  for(i in 1:dim(dset)[1]) {
    map$marker(
      c(dset$latitude[i],dset$longitude[i]),
      bindPopup = paste(dset$Occurred[i],dset$Comments[i],sep=" : ")
    )
  }
  map
}
