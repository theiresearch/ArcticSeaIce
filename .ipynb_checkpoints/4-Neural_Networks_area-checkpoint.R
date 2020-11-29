library(neuralnet)
library(tidyverse)

arctic <- read.csv("arctic_data.csv",stringsAsFactors = F) #load data

folds <- cut(seq(1,nrow(arctic)), breaks = 10, labels = FALSE) #data segmentation

prediction <- as.data.frame(
  sapply(1:10, FUN = function(i) # loop 1:K
{
  testID <- which(folds == i, arr.ind = TRUE)
  test <- arctic[testID, ]
  train <- arctic[-testID, ] # set K-fold
  
  # print(test) # if needed
  
  # Neural Network
  nn = neuralnet(area~rainfall+daylight+population+CO2+ozone+ocean_temp+land_temp,
                 data=train, hidden = c(5,3))
  plot(nn)
  # prediction output
  predict(nn,test)
}))

# table gathering and merging
pred_gather <- gather(data=prediction, key="fold",value="prediction",1:10)
result <- as.data.frame(cbind(arctic[,c(1,2,3,6)],pred_gather))

# calculate value of R^2
result["R^2"] <- ((result$area-result$prediction)^2)
R_square <- sum(result$`R^2`)/490

# plot line chart (Prediction vs True)
{plot(result$observation,result$area,type ='l',ylim = c(0,1.5),lwd = '2',
     xlab = "Observation_ID", ylab = "Value")
lines(result$observation,result$prediction,lty=1,col='red',lwd = '2')}

# title and legend
{title(main = list("Neural Networks", cex = 1.5, col = "red", font = 3)) 
legend("topright", inset=.05, c("Prediction","True"),bty = 'n',
       lty=c(1, 1),  col=c("red", "black"),lwd =c(2, 2))}

