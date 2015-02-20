# plot3.R
# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions 
# from 1999–2008 for Baltimore City? Which have seen increases in emissions from 
# 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
library("ggplot2")
data <- readRDS("summarySCC_PM25.rds")
data.balt <- data[data$fips=="24510",]
data.balt$type <- factor(data.balt$type)
yearlyEmissions.baltimore.type <- aggregate(data.balt$Emissions, 
                                            list(data.balt$year, data.balt$type), 
                                            sum)
names(yearlyEmissions.baltimore.type) <- c("Year", "Type", "Emissions")
qplot(Year, Emissions, 
      data=yearlyEmissions.baltimore.type, col = Type,
      geom=c("point", "smooth"),ylab="Emissions (tons)",
      main="Yearly emissions in Baltimore - by type, by year")
# End of file