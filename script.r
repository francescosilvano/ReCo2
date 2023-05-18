# Install and load the ggplot2 package for data visualization
install.packages("ggplot2")
library(ggplot2)

# Install and load the readr package for reading CSV files
install.packages("readr")
library(readr)

# Read the OWID CO2 data from a CSV file
owid.co2.data <- read.csv(PARAMETER)

# View the content of the OWID CO2 data
View(owid.co2.data)

# Filter the OWID CO2 data for the specified conditions
filtered_owid <- subset(owid.co2.data, country == "OECD (GCP)" & year >= 2011 & year <= 2021, select = c(year, co2))

# View the filtered OWID CO2 data
View(filtered_owid)

# Create a scatterplot of the filtered OWID CO2 data
plot(filtered_owid$year, filtered_owid$co2,
     xlab = "Year", ylab = "Total CO2",
     main = "Scatterplot of Total CO2 (OECD, 2011-2021)",
     col = "#6F1AB6",
     pch = 19)

# Read the WTI monthly data from a CSV file
wti.monthly <- read.csv(PARAMETER)

# Filter the WTI monthly data for the specified conditions
filtered_wti <- wti.monthly[strftime(wti.monthly$Date, format = "%m") == "01" & strftime(wti.monthly$Date, format = "%Y") >= "2011" & strftime(wti.monthly$Date, format = "%Y") <= "2021", ]

# View the filtered WTI monthly data
View(filtered_wti)

# Extract the Price column from the filtered WTI data
prices <- filtered_wti$Price

# Create a bar chart of the WTI prices
wti_chart <- ggplot(filtered_wti, aes(x = Date, y = Price)) +
  geom_bar(stat = "identity", fill = "#6F1AB6") +
  labs(x = "Date", y = "Price", title = "Bar Chart of Price (2011-2021)") +
  theme_bw()

# Print the WTI chart
print(wti_chart)

# Extract the year from the Date column in the filtered WTI data
filtered_wti$Year <- format(as.Date(filtered_wti$Date), "%Y")

# Convert the Year and Price columns to numeric format
filtered_wti$Year <- as.numeric(filtered_wti$Year)
filtered_wti$Price <- as.numeric(as.character(filtered_wti$Price))

# Combine the scatterplot of OWID CO2 data and the bar chart of WTI prices
combined_chart <- ggplot() +
  geom_point(data = filtered_owid, aes(x = year, y = co2), color = "#6F1AB6", shape = 19) +
  geom_bar(data = filtered_wti, aes(x = Year, y = Price), stat = "identity", fill = "#6F1AB6") +
  labs(x = "Year", y = "Value", title = "Combined Chart") +
  theme_bw()

# Print the combined chart
print(combined_chart)
