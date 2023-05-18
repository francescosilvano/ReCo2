# Install and load the required package
install.packages("ggplot2")  # Install the ggplot2 package
library(ggplot2)  # Load the ggplot2 package for creating charts


# The two datasets we are using

wti_file <- "https://github.com/francescosilvano/FPD-EF/blob/main/References/wti-monthly.csv"



# This script extracts the Total CO2 per year in the OECD countries.

filtered_data <- subset(data2, country == "OECD (GCP)" & year >= 2011 & year <= 2021, select = c(year, co2))
# Subset the "data2" dataset to filter rows where the country is "OECD (GCP)" and the year is between 2011 and 2021
# Select only the "year" and "co2" columns from the subsetted data and store it in "filtered_data"

plot(filtered_data$year, filtered_data$co2,
     xlab = "Year", ylab = "Total CO2",
     main = "Scatterplot of Total CO2 (OECD, 2011-2021)")
# Create a scatterplot using the "year" and "co2" columns from "filtered_data"
# Set the x-axis label as "Year", y-axis label as "Total CO2", and main title as "Scatterplot of Total CO2 (OECD, 2011-2021)"


# Then, we create a subset of the "data1" database to analyze the trend in WTI prices from 2011 to 2021

subset_data <- subset(data1, strftime(Date, format = "%m-%d") == "01-15" & strftime(Date, format = "%Y") >= "2011" & strftime(Date, format = "%Y") <= "2021")
# Subset the "data1" dataset to filter rows where the date is January 15th and the year is between 2011 and 2021
# Store the subsetted data in "subset_data"

prices <- subset_data$Price
# Extract the "Price" column from "subset_data" and store it in "prices"

# Create the bar chart
bar_chart <- ggplot(selected_data, aes(x = Year, y = Price)) +
    geom_bar(stat = "identity", fill = "blue") +
    labs(x = "Year", y = "Price", title = "Bar Chart of Price (2011-2021)") +
    theme_bw()

# Display the bar chart
print(bar_chart)
# Create a bar chart using the "Year" and "Price" columns from "selected_data"
# Set the fill color of the bars as "blue"
# Set the x-axis label as "Year", y-axis label as "Price", and main title as "Bar Chart of Price (2011-2021)"
# Use a black-and-white theme with "theme_bw()"
# Print the bar chart


# Combine the datasets
combined_data <- merge(subset_data1, filtered_data2, by.x = "Date", by.y = "year", all = TRUE)

# Create a combined chart
combined_chart <- ggplot(combined_data) +
  geom_bar(aes(x = strftime(Date, format = "%Y"), y = Price), stat = "identity", fill = "blue", alpha = 0.5) +
  geom_line(aes(x = year, y = co2), color = "red") +
  labs(x = "Year", y = "Value", title = "Comparison of WTI Prices and CO2 Levels") +
  theme_bw()

# Display the combined chart
print(combined_chart)
