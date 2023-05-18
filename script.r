# this script extracts the Total Co2 per year in the OECD countries.

filtered_data <- subset(data2, country == "OECD (GCP)" & year >= 2011 & year <= 2021, select = c(year, co2))

plot(filtered_data$year, filtered_data$co2,
     xlab = "Year", ylab = "Total CO2",
     main = "Scatterplot of Total CO2 (OECD, 2011-2021)")



# Then we create a subset of the database "data1" to analyse the trend in prices from 2011 to 2021

subset_data <- subset(data1, strftime(Date, format = "%m-%d") == "01-15" & strftime(Date, format = "%Y") >= "2011" & strftime(Date, format = "%Y") <= "2021")
> prices <- subset_data$Price


