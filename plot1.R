# plot1.R
# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

data <- readRDS("summarySCC_PM25.rds")
ye <- aggregate(x = data$Emissions, 
                by = list(Year = data$year), 
                FUN = sum)
plot(ye,     
     ylab = "Emissions (tons)",
     main = "Yearly emissions - all sources, by year")
abline(lm(ye$x ~ ye$Year), 
       col = "blue", 
       lwd = 2)

# End of file