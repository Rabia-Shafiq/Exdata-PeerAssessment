setwd("C://MyStuf/Rabiz-Data/JohnHopkins/ExpolatoryData/Week2/exdata-data-NEI_data/")

## This first lines reading files !
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#...Aggregate Emissions per year
total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))
#Open PNG File...
png(filename = "plot1.png", width = 480, height = 480, units = "px")
##Plot emissions per year using basic package

##Total emissions from PM2.5 decreased in the United States from 1999 to 2008

plot(total.emissions, type = "b", pch = 18, col = "red", ylab = "Emissions",xlab = "Year", main = "Annual Emissions")
#Closing the PNG Device
dev.off()
