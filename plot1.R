# plot1.R
# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

data <- readRDS("summarySCC_PM25.rds")
yearlyEmissions <- aggregate(data$Emissions, list(data$year), sum)
names(yearlyEmissions) <- c("Year", "Emissions")
plot(yearlyEmissions,     
     ylab="Emissions (tons)",
     main="Yearly emissions - all sources, by year")
abline(lm(yearlyEmissions$Emissions ~ yearlyEmissions$Year), 
       col="blue", 
       lwd=2)
# End of file