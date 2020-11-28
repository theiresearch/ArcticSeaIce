library(MASS)
library(tidyverse)
library(randomForest)

arctic <- read.csv("arctic_data.csv",stringsAsFactors = F) #load data

folds <- cut(seq(1,nrow(arctic)), breaks = 10, labels = FALSE) #data segmentation

prediction <- as.data.frame(
  sapply(1:10, FUN = function(i) # loop 1:K
  {
    testID <- which(folds == i, arr.ind = TRUE)
    test <- arctic[testID, ]
    train <- arctic[-testID, ] # set K-fold
    
    # print(test) # if needed
    
    # random forest (mtry = 4 and ntree = 200)
    model <- randomForest(extent ~ rainfall+daylight+population+CO2+ozone+ocean_temp+land_temp,
                     data=train, mtry=4, ntree=200)
    
    # print(summary(model)) # if needed
    
    # prediction output
    predict(model,test)
  }))

# table gathering and merging
pred_gather <- gather(data=prediction, key="fold",value="prediction",1:10)
result <- as.data.frame(cbind(arctic[,c(1,6)],pred_gather))

# calculate value of R^2
result["R^2"] <- ((result$area-result$prediction)^2)
R_square <- sum(result$`R^2`)/490

{
# plot line chart (Prediction vs True)
plot(result$observation,result$area,type ='l',ylim = c(0,1.5),lwd = '2',
     xlab = "Date", ylab = "Value",xaxt='n')
lines(result$observation,result$prediction,lty=1,col='red',lwd = '2')
axis(1,at=c(1,61,121,181,241,301,361,421,481),
     labels=c("Jan 1980","Jan 1985","Jan 1990","Jan 1995","Jan 2000","Jan 2005",
              "Jan 2010","Jan 2015","Jan 2020"))

# title and legend
title(main = list("Random Forest", cex = 1.5, col = "red", font = 3)) 
legend("topright", inset=.05, c("Prediction","True"),bty = 'n',
       lty=c(1, 1),  col=c("red", "black"),lwd =c(2, 2))
}

