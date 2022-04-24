# arctic
Predicting Arctic Sea Ice with Machine Learning

## Past source code and report during UCL
https://github.com/UCL-BENV0091-Antarctic/arctic

## Python environment
We use [Deepnote](https://deepnote.com) as our development and analysis platform.

## Main libraries
```python
import pandas as pd
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt
import seaborn as sns # contains barplot
from sklearn.metrics import r2_score, explained_variance_score, mean_squared_error, mean_absolute_error
from sklearn.linear_model import LassoCV # lasso linear model with cross-validation
from sklearn.ensemble import RandomForestRegressor # random forest
from sklearn.ensemble import GradientBoostingRegressor # gradient boosting
from sklearn.neural_network import MLPRegressor # multiplayer perceptron
```

## Data Credits
- (new) Arctic ice volumn: [PIOMAS Ice Volume Data](http://psc.apl.uw.edu/research/projects/arctic-sea-ice-volume-anomaly/data/) (daily; 1979-present (the 90th day of 2022); downloaded on 24th Apr 2022)
- Arctic sea ice: [National Snow & Ice Data Center](https://nsidc.org/arcticseaicenews/sea-ice-tools/)
- CO2: [National Oceanic and Atmospheric Administration](https://climate.nasa.gov/vital-signs/carbon-dioxide/)
- Ozone: [NASA Goddard Space Flight Center](https://ozonewatch.gsfc.nasa.gov/meteorology/NH.html)
- Temperature: [National Oceanic and Atmospheric Administration](https://www.ncdc.noaa.gov/cag/global/time-series)
- Rainfall and daylight: [Weather US](https://www.weather-us.com/en/alaska-usa/north-pole-climate)
- Population:[Our World in Data](https://ourworldindata.org/grapher/projected-population-by-country?tab=chart&stackMode=absolute&time=1967..latest&country=~OWID_WRL&region=World)
- GDP in current USD: [World Bank](https://data.worldbank.org/indicator/NY.GDP.MKTP.CD?end=2019&start=1960) & [IMF](https://www.imf.org/external/datamapper/NGDP_RPCH@WEO/OEMDC/ADVEC/WEOWORLD) (World GDP will fall -4.4% in 2020, +5.2% in 2021, +4.2% in 2022)

## Key results: Performance Table
![](https://s1.ax1x.com/2022/04/24/LhN3XF.png)

|Experiment       |            Metric              |  Value     |
|-----------------|--------------------------------|------------|
|LassoLinearmodel |            R2                  |   0.916707 |
|LassoLinearmodel |            Explained Variance  |   0.920295 |
|LassoLinearmodel |            MSE                 |   0.006924 |
|LassoLinearmodel |            MAE                 |   0.068930 |
|PolynomialLassoLinearmodel |  R2                  |   0.941503 |
|PolynomialLassoLinearmodel |  Explained Variance  |   0.941943 |
|PolynomialLassoLinearmodel |  MSE                 |   0.004863 |
|PolynomialLassoLinearmodel |  MAE                 |   0.059528 |
|RandomForestmodel |           R2                  |   0.988162 |
|RandomForestmodel |           Explained Variance  |   0.988394 |
|RandomForestmodel |           MSE                 |   0.000984 |
|RandomForestmodel |           MAE                 |   0.024542 |
|AdvancedNN |                  R2                  |   0.984525 |
|AdvancedNN |                  Explained Variance  |   0.984801 |
|AdvancedNN |                  MSE                 |   0.001286 |
|AdvancedNN |                  MAE                 |   0.026479 |
