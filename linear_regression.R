# load data

arctic <-read.csv("arctic_data.csv",stringsAsFactors = F)

# correlation matrix

library(corrplot)
feature_correlations <- cor(arctic[,5:13])
corrplot(feature_correlations,method="circle")

# Linear Regression

lm1<-lm(extent~rainfall+daylight+population+CO2+ozone+ocean_temp+land_temp,data=arctic)
lm1 # extent as y

lm2<-lm(area~rainfall+daylight+population+CO2+ozone+ocean_temp+land_temp,data=arctic)
lm2 # area as y


# show results

summary(lm1)
summary(lm2)

# AIC optimization

step(lm1)
step(lm2)