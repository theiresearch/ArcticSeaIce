# arctic
BENV0091 Group Project: Predicting Arctic Sea Ice with Supervised Learning ([Shiny App](https://grouporangearcticiceextent.shinyapps.io/shiny/?_ga=2.114418575.940438834.1607903962-2063170584.1607903962))

## R environment
We are heavily using [**Jupyter Notebook**](https://jupyter.org/) as our developing platform to implement, build, and test our SL models for environmental risks on Arctic sea ice, and using [**miniconda**](https://docs.conda.io/en/latest/miniconda.html) to create isolated environments and manage our R packages.

For new/existing users of miniconda/Anaconda, please go to [Install miniconda & set base environment](https://github.com/realgjl/r_basic/blob/master/README.md#install-miniconda--set-base-environment-python) and/or [For existing conda users: create a new and isolated R environment](https://github.com/realgjl/r_basic/blob/master/README.md#for-existing-conda-users-create-a-new-and-isolated-r-environment).

## Necessary libraries
tidyverse corrplot MASS randomforest neuralnet
```terminal
conda install -c conda-forge r-tidyverse r-corrplot r-mass r-randomforest r-neuralnet
```

## Data Credits
- Arctic sea ice: [National Snow & Ice Data Center](https://nsidc.org/arcticseaicenews/sea-ice-tools/)
- CO2: [National Oceanic and Atmospheric Administration](https://climate.nasa.gov/vital-signs/carbon-dioxide/)
- Ozone: [NASA Goddard Space Flight Center](https://ozonewatch.gsfc.nasa.gov/meteorology/NH.html)
- Temperature: [National Oceanic and Atmospheric Administration](https://www.ncdc.noaa.gov/cag/global/time-series)
- Rainfall and daylight: [Weather US](https://www.weather-us.com/en/alaska-usa/north-pole-climate)
- Population:[Our World in Data](https://ourworldindata.org/grapher/projected-population-by-country?tab=chart&stackMode=absolute&time=1967..latest&country=~OWID_WRL&region=World)
- GDP in current USD: [World Bank](https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?end=2019&start=1960) & [IMF](https://www.imf.org/external/datamapper/NGDP_RPCH@WEO/OEMDC/ADVEC/WEOWORLD) (World GDP will fall -4.4% in 2020, +5.2% in 2021, +4.2% in 2022)

## Key results: Performance Table
| Model                                       | R-squared |   MSE  |
| --------------------------------------------|-----------|--------| 
|Linear Regression                            | 0.898     | 0.00946|
|Penalized Linear Regression (Lasso, min)     | 0.863     | 0.00690|
|Penalized Linear Regression (Lasso, 1se)     | 0.857     | 0.00734|
|Penalized Polynomial Regression (Lasso, min) | 0.931     | 0.00448|
|Penalized Polynomial Regression (Lasso, 1se) | 0.917     | 0.00483|
|**Random Forest                                | 0.983     |  0.00105**| 
|Neural Networks                              | 0.927     | 0.00106|
