# plot2.R
# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.

data <- readRDS("summarySCC_PM25.rds")
data.balt <- data[data$fips=="24510",]
yearlyEmissions.baltimore <- aggregate(data.balt$Emissions, 
                                       list(data.balt$year), sum)
names(yearlyEmissions.baltimore) <- c("Year", "Emissions")
plot(yearlyEmissions.baltimore,     
     ylab="Emissions (tons)",
     main="Yearly emissions in Baltimore - all sources, by year")
abline(lm(yearlyEmissions.baltimore$Emissions ~ yearlyEmissions.baltimore$Year), 
       col="blue", 
       lwd=2)
# End of file