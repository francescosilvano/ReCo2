filtered_data <- subset(data2, country == "OECD (GCP)" & year >= 2011 & year <= 2021, select = c(year, co2))

plot(filtered_data$year, filtered_data$co2,
     xlab = "Year", ylab = "Total CO2",
     main = "Scatterplot of Total CO2 (OECD, 2011-2021)")

