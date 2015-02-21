# plot2.R
# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.

data <- readRDS("summarySCC_PM25.rds")
data.balt <- data[data$fips == "24510",]
ye.balt <- aggregate(x = data.balt$Emissions, 
                     by = list(Year = data.balt$year), 
                     FUN = sum)
png(filename = "plot2.png",
    width = 480,
    height = 240)
plot(ye.balt,     
     ylab = "Emissions (tons)",
     main = "Yearly emissions in Baltimore - all sources, by year")
abline(lm(ye.balt$x ~ ye.balt$Year), 
       col = "blue", 
       lwd = 2)
dev.off()

# End of file