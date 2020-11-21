# arctic
BENV0091 Group Project for (predicting) Arctic Sea Ice by Supervised Learning (SL).

We are heavily using [**Jupyter Notebook**](https://jupyter.org/) as our developing platform to implement, build, and test our SL models for environmental risks on Arctic sea ice, and using [**miniconda**](https://docs.conda.io/en/latest/miniconda.html) to create isolated environments and manage our R packages.

## For existing conda users: create a new and isolated R environment
Open terminal and run:
```terminal
conda create -n r_env r-essentials
```
p.s., This command will install the package [r-essentials](https://docs.anaconda.com/anaconda/user-guide/tasks/using-r-language/#:~:text=The%20R%20Essentials%20bundle%20contains,interpreter%20installed%20into%20new%20environments.) when creating new environment.
The ```new and isolated R environment``` is named ```r_env``` here.

### Open Jupyter Notebook
Open terminal & activate your R environment:
```terminal
conda activate r_env
```
Open Jupyter Notebook:
```terminal
jupyter notebook
```
Exit the current Jupyter environment: press ```control``` ```c``` at terminal

### Install new packages for R
Open terminal & activate your R environment:
```terminal
conda activate r_env
```
Google: "conda + install + 'package name'":
![](https://i.loli.net/2020/11/11/CmctZKLaVk13z6i.png)
You can search packages in Anaconda Cloud as well:
![](https://i.loli.net/2020/11/11/2CyjwKpDrhTbRLZ.png)

For popular packages, I suggest installing packages from these two package owners: **r** and **conda-forge**:
![](https://i.loli.net/2020/11/11/oIExn5U8zpFLdkV.png)

Select package, copy and paste the code and run:
![](https://i.loli.net/2020/11/11/5QPBfTN1OXdmrAu.jpg)

## Data Credits
- Arctic sea ice: ...
- CO2: ...
- Ozone: ...
- Temperature: ...
- Rainfall and daylight: ...
- Primary Energy Consumption/Fossil fuel consumption: ...
- Population:...
