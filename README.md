# Renewable Energy and Environmental Footprint:

## is there a reverse correlation between renewable energy production and worldwide carbon emissions? A Statistical Comparison of Renewable Energy Production and Levels of CO2 produced

---

### Table of Contents
- [Summary](#summary)
- [Data Collection](#data-collection)
- [Data Processing](#data-processing)
- [Statistical Analysis](#statistical-analysis)
- [References](#references)
- [Authors](#authors)

<br>

## Summary

This research project aims to perform a comprehensive statistical analysis of renewable energy production and its correlation with the environmental footprint, with a specific focus on CO2 emissions. Key features of the study include:

- Analyzing the relationship between renewable energy production and CO2 emissions
- Utilizing a global dataset from "Our World in Data" to provide a broad perspective
- Conducting pre-processing on the collected data to ensure quality and consistency
- Performing statistical analysis using R software, including descriptive statistics and the Pearson Coefficient
- Visualizing the results through linear charts

<br>

### Data Collection

To conduct this analysis, a comprehensive dataset was collected, encompassing information on renewable energy production and CO2 emissions over a specified timeframe. The datasets include data from the "Our World in Data" organization[^1], which covers a range of countries and regions, allowing for a global perspective on the topic.

<br>

### Data Processing

Before performing the statistical analysis, the collected data underwent a pre-processing process to ensure its quality and consistency. The following steps were taken:

- Handling missing values
- Removing outliers
- Standardizing the data format
- Data transformation, including aggregating early data and converting units

Two subsets were created: "filtered_owid" for the levels of CO2 and "filtered_energy" for the levels of TWh of energy produced in a specific year.

## Statistical Analysis

The statistical analysis consisted of several steps, starting from descriptive statistics to gain a general understanding of the dataset. R software and libraries were used for the analysis, including:

- [GGPlot2](https://ggplot2.tidyverse.org/index.html)
- [readr](https://cran.r-project.org/web/packages/readr/index.html)

These tools allowed for comprehensive comparison and visualization of the datasets, providing an overview of the phenomenon under study. Linear charts were used to facilitate the comparison of the resulting values.

Additionally, the Pearson Coefficient was computed to measure the correlation between renewable energy production and CO2 emissions. The Pearson Coefficient is a statistical measure that quantifies the linear relationship between two variables. A result of -0.8866505 suggests a strong inverse correlation between renewable energy production and CO2 emissions[^2].

<br>

### References

#### Papers and Articles

- Umair, M., Yousuf, M.U., Ul-Haq, J., Hussain, Z. & Visas, H. 2023, "Revisiting the environmental impact of renewable energy, non-renewable energy, remittances, and economic growth: CO2 emissions versus ecological footprint for top remittance-receiving countries," Environmental Science and Pollution Research, vol. 30, no. 23, pp. 63565-63579. [Read more](https://www.scopus.com/record/display.uri?eid=2-s2.0-85152668236&origin=resultslist&sort=plf-f&src=s&st1=renewables+AND+environmental+AND+footprint+AND+co2&sid=ab56510ac157cbb6850df078fbff0eae&sot=b&sdt=b&sl=65&s=TITLE-ABS-KEY%28renewables+AND+environmental+AND+footprint+AND+co2%29&relpos=13&citeCnt=0&searchTerm=)

#### R Software Manuals & Libraries

- [R Admin - Installationd]()
- [R Data - Import/Export](https://cran.r-project.org/doc/manuals/r-release/R-data.pdf)
- [GGPlot2](https://ggplot2.tidyverse.org/index.html)
- [readr](https://cran.r-project.org/web/packages/readr/index.html)

#### Datasets

- [CO2 and Greenhouse Gas Emissions](https://ourworldindata.org/co2-and-greenhouse-gas-emissions)
- [Energy](https://ourworldindata.org/energy)

<br>

### Authors

This statistical study has been performed by [Francesco Silvano](https://github.com/francescosilvano) and [Giacomo Noghera](https://github.com/giacomonoghera). The data and libraries used belong to their respective owners.

<br>

### License

[^1]: https://ourworldindata.org
[^2]: https://articles.outlier.org/pearson-correlation-coefficient
