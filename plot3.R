# plot3.R
# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? Which have seen increases in emissions from 
# 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library("ggplot2")
data <- readRDS("summarySCC_PM25.rds")
data.balt <- data[data$fips == "24510",]
ye.balt.type <- aggregate(x = data.balt$Emissions, 
                          by = list(Year = data.balt$year, 
                                    Type = data.balt$type), 
                          FUN = sum)
png(filename = "plot3.png",
    width = 480,
    height = 240)
q <- qplot(Year, x, 
           col = Type,
           data = ye.balt.type, 
           geom = c("point", "smooth"),
           ylab = "Emissions (tons)",
           main = "Yearly emissions in Baltimore - by type, by year")
print(q)
dev.off()

# End of file