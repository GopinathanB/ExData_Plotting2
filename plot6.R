# plot6.R
# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

library("ggplot2")
data <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
scc.mv <- scc[grep(".* Veh .*", scc$Short.Name), ]
data.balt_la.mv <- data[(data$SCC %in% scc.mv$SCC) & 
                          (data$fips == "24510" | 
                             data$fips == "06037"), ]
ye.balt_la.mv <- aggregate(x = data.balt_la.mv$Emissions, 
                           by = list(Year = data.balt_la.mv$year, 
                                     Fips = data.balt_la.mv$fips), 
                           FUN = sum)
ye.balt_la.mv$City[ye.balt_la.mv$Fips == "06037"] <- "LA"
ye.balt_la.mv$City[ye.balt_la.mv$Fips == "24510"] <- "Baltimore"
png(filename = "plot6.png",
    width = 480,
    height = 240)
q <- qplot(Year, x, 
           col = City,
           data = ye.balt_la.mv, 
           geom = c("point", "smooth"),
           ylab = "Emissions (tons)",
           main = "Yearly emissions in Baltimore and LA - Vehicle source, by year")
print(q)
dev.off()

# End of file.