# plot6.R
# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
library("ggplot2")
data <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
scc.mv <- scc[grep(".* Veh .*", scc$Short.Name, ignore.case = TRUE), ]
data.balt_la.mv <- data[(data$SCC %in% scc.mv$SCC) & (data$fips=="24510" | data$fips=="06037"), ]
ye.balt_la.mv <- aggregate(data.balt_la.mv$Emissions, 
                        list(data.balt_la.mv$year, data.balt_la.mv$fips), 
                        sum)
names(ye.balt_la.mv) <- c("Year", "Fips", "Emissions")
qplot(Year, Emissions, 
      data=ye.balt_la.mv, col = Fips,
      geom=c("point", "smooth"),ylab="Emissions (tons)",
      main="Yearly emissions in Baltimore and LA - Vehicle source, by year")
# End of file.