library(plyr)
library(ggplot2)

#Aggregate emissions by year and filter Baltimore '24510'
NEI_Baltimore <- NEI[which(NEI$fips == "24510"), ]
total.emissions.baltimore <- with(NEI_Baltimore, aggregate(Emissions, by = list(year), 
    sum))
colnames(total.emissions.baltimore) <- c("year", "Emissions")

#Aggregate emissions by year,county, type and filter Baltimore '24510'

Total_Emissions_Baltimore_Type<-ddply(NEI_Baltimore,.(type,year),summarize, Emissions=sum(Emissions))
Total_Emissions_Baltimore_Type$Pollutant_Type<-Total_Emissions_Baltimore_Type$type
#Open PNG Device
png(filename='plot3.png', width=480, height=480, units='px')

##Plot emissions per year grouped by source type using ggplot2 plotting system NON-ROAD, NONPOINT, ON-ROAD type sources have seen decreases in emissions.
##POINT type has seen increased emissions until year 2005 and then decreased in year 2008.
qplot(year, Emissions, data = Total_Emissions_Baltimore_Type, group = Pollutant_Type, 
    color = Pollutant_Type, geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), 
    xlab = "Year", main = "Total Emissions in Baltimore City by Type of Pollutant")
#Close the PNG Device
dev.off()