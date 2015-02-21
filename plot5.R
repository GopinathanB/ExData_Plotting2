# plot5.R
# 5. How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?

library("ggplot2")
data <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
scc.mv <- scc[grep(".* Veh .*", scc$Short.Name), ]
data.balt.mv <- data[(data$SCC %in% scc.mv$SCC) & 
                       (data$fips == "24510"), ]
ye.balt.mv <- aggregate(x = data.balt.mv$Emissions, 
                        by = list(Year = data.balt.mv$year), 
                        FUN = sum)
png(filename = "plot5.png",
    width = 480,
    height = 240)
q <- qplot(Year, x, 
           data = ye.balt.mv,
           geom = c("point","smooth"),
           ylab = "Emissions (tons)",
           main = "Yearly emissions in Baltimore - Vehicle sources, by year")
print(q)
dev.off()

# End of file