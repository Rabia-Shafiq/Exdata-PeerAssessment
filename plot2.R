## This first lines reading files !
NEI <- readRDS("summarySCC_PM25.rds")

##Aggregate Emissions by year and county and filter Baltimore City, Maryland (fips == "24510")

select <- (NEI$fips == "24510")
n <- sum(select) # 2096
baltimore <- NEI[select,]
baltimoreYearTotalEmissions <- aggregate(Emissions ~ year, baltimore, sum)
#Open PNG Device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
# Base plotting
##Total emissions from PM2.5 on average decreased in the Baltimore City, Maryland from 1999 to 2008
plot(baltimoreYearTotalEmissions , type = "b",pch = 18, col = "green", ylab = "Emissions", xlab = "Year", main = "Baltimore Emissions")
#Closing PNG Device
dev.off()