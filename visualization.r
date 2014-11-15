data <- read.csv("~/newcrimedata.csv")
data$X <- NULL
colnames(data) <- c('Incident','Location','Reported','Occurred','Comments','Disposition','UCPDI#')


jan = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='January')
feb = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='February')
mar = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='March')
apr = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='April')
may = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='May')
jun = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='June')
jul = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='July')
aug = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='August')
sep = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='September')
oct = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='October')
nov = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='November')
dec = subset(data, months(as.Date(data$Occurred,'%m/%d/%Y'))=='December')

jansum = length(jan$Incident)
febsum = length(feb$Incident)
marsum = length(mar$Incident)
aprsum = length(apr$Incident)
maysum = length(may$Incident)
junsum = length(jun$Incident)
julsum = length(jul$Incident)
augsum = length(aug$Incident)
sepsum = length(sep$Incident)
octsum = length(oct$Incident)
novsum = length(nov$Incident)
decsum = length(dec$Incident)


monthlist = c(jansum,febsum,marsum,aprsum,maysum,junsum,julsum,augsum,sepsum,octsum,novsum,decsum)
monthnames = c('Jan','Feb','March','April','May','June','July','August','Sept','Oct','Nov','Dec')

#monthsales = barplot(monthlist, main = 'Crime Incidence by Month',names.arg=monthnames,las=2)

sun = subset(data, weekdays(as.Date(data$Occurred,'%m/%d/%Y'))=='Sunday')
mon = subset(data, weekdays(as.Date(data$Occurred,'%m/%d/%Y'))=='Monday')
tue = subset(data, weekdays(as.Date(data$Occurred,'%m/%d/%Y'))=='Tuesday')
wed = subset(data, weekdays(as.Date(data$Occurred,'%m/%d/%Y'))=='Wednesday')
thu = subset(data, weekdays(as.Date(data$Occurred,'%m/%d/%Y'))=='Thursday')
fri = subset(data, weekdays(as.Date(data$Occurred,'%m/%d/%Y'))=='Friday')
sat = subset(data, weekdays(as.Date(data$Occurred,'%m/%d/%Y'))=='Saturday')

sunsum = length(sun$Incident)
monsum = length(mon$Incident)
tuesum = length(tue$Incident)
wedsum = length(wed$Incident)
thusum = length(thu$Incident)
frisum = length(fri$Incident)
satsum = length(sat$Incident)

daylist = c(sunsum,monsum,tuesum,wedsum,thusum,frisum,satsum)
daynames = c('Sun','Mon','Tues','Wed','Thur','Fri','Sat')
barplot(daylist,main='Crime Incidence by Weekday',names.arg=daynames,las=2)


violentcrime <- c('Domestic Battery','Aggravated Battery','Battery','Criminal Sexual Assault','Assault','Aggravated Battery to Police Officer','Battery (Domestic)',
                  'Armed Robbery','Att. Armed Robbery','Unlawful Possession of a Weapon','Attempt Theft from Person',
                  'Att. Theft from Person','Reckless Discharge of a Firearm','Attempt Armed Robbery',
                  'Battery / Resisting Arrest','Unlawful Possession of a Firearm','Aggravated Battery of Police Officer',
                  'Unlawful Use of Weapon','Aggravated Assault','Aggravated Robbery','Battery / Domestic','Aggravated Assault of Police Officer',
                  'Unlawful Use of a Weapon','Homicide','Battery - Simple','Robbery - Attempted','Robbery - Strong Armed (Delayed Report)',
                  'Weapons Violation','Robbery - Strong Arm','Aggravated Battery of a Police Officer','Simple Battery','Robbery-Strong Arm',
                  'Battery-Simple','Simple Assault','Robbery - Attempted Strong Arm','Aggravated Battery of a Protected Employee',
                  'Armed Robbery Arrest','Unlawful Use of Weapons')  

vc <- data[grep(paste(violentcrime, collapse='|'), data$Incident, ignore.case=TRUE),]

substances <- c('Liquor Law Violation','Found Suspect Narcotics','Possession of Narcotics','Found Suspect Marijuana','Possession of Cannabis','Found Narcotics',
                'Traffic Violation / DUI','Found / Suspect Narcotics','Possession of Controlled Substance','Liquor Law  Violation',
                'Liquor Law Violation / Injured Person','Drug Law Violation','Suspect Narcotics Found','Possession of Crack Cocaine','Possession of Controlled Substances')

subst <- data[grep(paste(substances,collapse='|'),data$Incident,ignore.case=TRUE),]

medical <- c('Injured Person','Mental Health Transport','Medical Call','Information / Medical Call','Information / Mental Health Transport',
             'Medical Transport','Sick Person','Injured Person - Accidental','Safety Hazard/Non-Criminal Offense','Well-Being Check')

medic <- data[grep(paste(medical,collapse='|'),data$Incident,ignore.case=TRUE),]

noncrime <- c('Assist Other Agency','Found Property','Lost Property','Weapon Turn-In',
              'Missing Person','Fire Alarm','Information / Elevator Entrapment','Recovered Vehicle',
              'Information / Well-Being','Suspicious Person','Information / Disturbance','Public Peace Violation',
              'Noise Complaint','Non-criminal Damage to Property','Missing Person Found','Sick Person',
              'Information / Assist Other Agency','Information / Non Criminal','Non-Criminal','Non-Criminal Property Damage',
              'Non-Criminal Damage','Non-criminal Offense')

nonc <- data[grep(paste(noncrime,collapse='|'),data$Incident,ignore.case=TRUE),]
nonc <- rbind(nonc,medic)

allbut <- rbind(nonc,vc)

nonviolent <- data[setdiff(rownames(data),rownames(allbut)),]

#vc, nonc, and nonviolent are used

map <- Leaflet$new()
map$setView(c(41.785054, -87.60034029999997), zoom = 13)
map$tileLayer(provider = 'OpenStreetMap')
for(i in 1:4811) {
  map$marker(
    c(data$latitude[i],data$longitude[i]),
    bindPopup = data$Comments[i]
  )
}
map

for(i in 1:100) {
  x = ceiling(runif(1,min=1,max=4811))
  map$marker(
    c(dataset$latitude[x],dataset$longitude[x]),
    bindPopup = dataset$Comments[x]
  )
}
map



map2 = map$copy()
map2$set(
  bodyattrs = "ng-app ng-controller='rChartsCtrl'"
)
map2$addAssets(
  jshead = "http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.1/angular.min.js"
)





#street2coordinates <- function(address, session=getCurlHandle()) {
#  api <- paste(getOption("RDSTK_api_base"), "/street2coordinates/", sep="")
#  get.addy <- getURL(paste(api, URLencode(address), sep=""), curl=session)
#  clean.addy <- lapply(fromJSON(get.addy), 
#                       lapply, 
#                       function(x) ifelse(is.null(x), NA, x))
#  result <- ldply(clean.addy, data.frame)
#  names(result)[1] <- "full.address"
#  return(result)
#}

#taboh <- as.data.frame(street2coordinates(locs[1]))
#for(i in 1:50) {
#  table <- as.data.frame(street2coordinates(locs[i]))
#  taboh <- rbind(table,taboh)
#}

