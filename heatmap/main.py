import numpy
import matplotlib
import httplib2
from bs4 import BeautifulSoup
import time
import calendar
import datetime
from dateutil.parser import parse
import csv
import folium
"""
h = httplib2.Http('.cache')
reports = {}

for i in range(1293861600,calendar.timegm(time.gmtime()), 86400):
	content = h.request('https://incidentreports.uchicago.edu/viewReport.php?reportDate=' + str(i), 'GET')[1]
	soup = BeautifulSoup(content)
	incidents = soup.find_all('tr')
	incidents = incidents[2:]
	incident = {}
	for row in incidents:
		cols = row.findAll('td')
		if len(cols) == 7:
			incident['type'] = cols[0].text.encode('ascii','ignore').strip()
			incident['loc'] = cols[1].text.encode('ascii','ignore').strip()
			try:
				incident['timer'] = parse(cols[2].text.encode('ascii','ignore').strip()).ctime()
			except:
				continue
			try:
				incident['timeo'] = parse(cols[3].text.encode('ascii','ignore').strip()).ctime()
			except:
				continue
			incident['desc'] = cols[4].text.encode('ascii','ignore').strip()
			incident['disp'] = cols[5].text.encode('ascii','ignore').strip()
			reports[cols[6].text.encode('ascii','ignore').strip()] = incident
print('done')
"""
reports = []

with open('coordata.csv','rb') as csvf:
	r = csv.reader(csvf)
	for row in r:
		if (row[0] != "" and len(row) == 10):
			incident = {}
			incident['id'] = row[7]
			incident['type'] = row[1]
			incident['lat'] = row[8]
			incident['lng'] = row[9]
			try:
				incident['timer'] = parse(row[3])
				incident['timeo'] = parse(row[4])
			except:
				continue
			incident['desc'] = row[5]
			incident['disp'] = row[6]
			try:
				reports.append(incident)
			except:
				continue


htmlstring = "var addressPoints = ["

for i in reports:
	ct = i['type'].lower()
	if ("battery" in ct) or ("armed" in ct) or ("assault" in ct) or ("robbery" in ct) or ("homicide" in ct) or ("firearm" in ct) or ("sexual" in ct):
		htmlstring = htmlstring + '[' +  i['lat'] + ',' + i['lng'] + ',"0.5"],'
	else:
		htmlstring = htmlstring + '[' +  i['lat'] + ',' + i['lng'] + ',"0.05"],'

htmlstring += "];"

htmlstring2 = "var timeCorrespondence = ["

for i in reports:
	htmlstring2 = htmlstring2 + '"' +  i['timer'].strftime('%d %b %Y') + '",'

htmlstring2 += "];"

finalstring = htmlstring + htmlstring2

with open('incidents.js','w') as f:
	f.write(finalstring)
