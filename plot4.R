# plot4.R
# 4. Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

library("ggplot2")
data <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")
scc.cc <- scc[grep(".*Comb.*Coal.*", scc$Short.Name), ]
data.cc <- data[data$SCC %in% scc.cc$SCC, ]
ye.cc <- aggregate(x = data$Emissions, 
                   by = list(Year = data$year), 
                   FUN = sum)
qplot(Year, x, 
      data = ye.cc, 
      geom = c("point","smooth"),
      ylab = "Emissions (tons)",
      main = "Yearly emissions - Coal combustion sources, by year")

# End of file.