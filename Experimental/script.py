import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Install and load the required packages
!pip install pandas matplotlib seaborn

# Read the OWID CO2 data from a CSV file
owid_co2_data = pd.read_csv("References/owid-co2-data.csv")

# Filter the OWID CO2 data for the specified conditions
filtered_owid = owid_co2_data[
    (owid_co2_data['country'] == "OECD (GCP)") &
    (owid_co2_data['year'] >= 2011) &
    (owid_co2_data['year'] <= 2021)
][['year', 'co2']]

# Create a scatterplot of the filtered OWID CO2 data
owid_plot = plt.scatter(filtered_owid['year'], filtered_owid['co2'])
plt.xlabel("Year")
plt.ylabel("Total CO2")
plt.title("Scatterplot of Total CO2 (OECD, 2011-2021)")
plt.show()

# Read the energy data from a CSV file
energy = pd.read_csv("References/energy.csv")

# Filter the energy data for the specified conditions
filtered_energy = energy[
    (energy['Entity'] == "World") &
    (energy['Year'] >= 2011) &
    (energy['Year'] <= 2021)
][['Year', 'Electricity from renewables (TWh)']]

# Create a scatterplot of the filtered energy data
energy_plot = plt.scatter(filtered_energy['Year'], filtered_energy['Electricity from renewables (TWh)'])
plt.xlabel("Year")
plt.ylabel("Electricity from Renewables (TWh)")
plt.title("Scatterplot of Electricity from Renewables (World, 2011-2021)")
plt.show()

# Combine the filtered OWID CO2 data and filtered energy data
combined_data = pd.merge(filtered_owid, filtered_energy, left_on='year', right_on='Year', how='outer')

# Scale the y-axis values using normalization
combined_data['scaled_co2'] = (combined_data['co2'] - combined_data['co2'].min()) / (combined_data['co2'].max() - combined_data['co2'].min())
combined_data['scaled_energy'] = (combined_data['Electricity from renewables (TWh)'] - combined_data['Electricity from renewables (TWh)'].min()) / (combined_data['Electricity from renewables (TWh)'].max() - combined_data['Electricity from renewables (TWh)'].min())

# Create a line chart of the combined data with overlapping lines and scaled values
combined_plot = sns.lineplot(data=combined_data, x='year', y='scaled_co2', color='#6F1AB6')
combined_plot = sns.lineplot(data=combined_data, x='year', y='scaled_energy', color='#FF9900')
combined_plot.set(xlabel='Year', ylabel='Scaled Value', title='Combined Chart of Total CO2 and Electricity from Renewables')
plt.show()

# Calculate Pearson's correlation coefficient
pearson_coeff = combined_data['scaled_co2'].corr(combined_data['scaled_energy'])
print(pearson_coeff)
