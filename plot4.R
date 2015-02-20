# plot4.R
# 4. Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
library("ggplot2")
data <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
scc.cc <- scc[grep(".*Comb.*Coal.*", scc$Short.Name, ignore.case = TRUE), ]
data.cc <- data[data$SCC %in% scc.cc$SCC, ]
ye.coal <- aggregate(data$Emissions, list(data$year), sum)
names(ye.coal) <- c("Year", "Emissions")
qplot(Year, Emissions, data = ye.coal, 
      geom=c("point","smooth"),ylab="Emissions (tons)",
      main="Yearly emissions - Coal combustion sources, by year")
# End of file.