# arctic
BENV0091 Group Project: Predicting Arctic Sea Ice with Supervised Learning

## R environment
We are heavily using [**Jupyter Notebook**](https://jupyter.org/) as our developing platform to implement, build, and test our SL models for environmental risks on Arctic sea ice, and using [**miniconda**](https://docs.conda.io/en/latest/miniconda.html) to create isolated environments and manage our R packages.

For new/existing users of miniconda/Anaconda, please go to [Install miniconda & set base environment](https://github.com/realgjl/r_basic/blob/master/README.md#install-miniconda--set-base-environment-python) or [For existing conda users: create a new and isolated R environment](https://github.com/realgjl/r_basic/blob/master/README.md#for-existing-conda-users-create-a-new-and-isolated-r-environment).

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
- Primary Energy Consumption/Fossil fuel consumption: [Our World in Data](https://ourworldindata.org/grapher/fossil-fuel-primary-energy?tab=chart&time=2002..2019&country=~OWID_WRL)
- Population:[Our World in Data](https://ourworldindata.org/grapher/projected-population-by-country?tab=chart&stackMode=absolute&time=1967..latest&country=~OWID_WRL&region=World)
