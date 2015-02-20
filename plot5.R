# plot5.R
# 5. How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?
library("ggplot2")
data <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
scc.mv <- scc[grep(".* Veh .*", scc$Short.Name, ignore.case = TRUE), ]
data.balt.mv <- data[(data$SCC %in% scc.mv$SCC) & (data$fips=="24510"), ]
ye.balt.mv <- aggregate(data.balt.mv$Emissions, 
                        list(data.balt.mv$year), 
                        sum)
names(ye.balt.mv) <- c("Year", "Emissions")
qplot(Year, Emissions, data = ye.balt.mv, 
      geom=c("point","smooth"),ylab="Emissions (tons)",
      main="Yearly emissions in Baltimore - Vehicle sources, by year")

# End of file