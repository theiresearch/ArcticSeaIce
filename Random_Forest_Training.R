library(randomForest)

# read file
arctic <- read.csv("arctic_data.csv",stringsAsFactors = F)

# train model
{mtry_1 <- randomForest(extent~ rainfall+daylight+population+CO2
                       +ozone+ocean_temp+land_temp, data = arctic, mtry=2, ntree=300)
mtry_2<-randomForest(extent~ rainfall+daylight+population+CO2
                       +ozone+ocean_temp+land_temp, data = arctic, mtry=3, ntree=300)
mtry_3<-randomForest(extent~ rainfall+daylight+population+CO2
                       +ozone+ocean_temp+land_temp, data = arctic, mtry=4, ntree=300)
mtry_4<-randomForest(extent~ rainfall+daylight+population+CO2
                       +ozone+ocean_temp+land_temp, data = arctic, mtry=5, ntree=300)
mtry_5<-randomForest(extent~ rainfall+daylight+population+CO2
                       +ozone+ocean_temp+land_temp, data = arctic, mtry=6, ntree=300)}

# plot result (the error tends to be stable when tree = 200)
{plot(mtry_1,col='red',ylim=c(0.0005,0.005),lwd = '2',main = 'Random Forest')
par(new=TRUE)
plot(mtry_2,col='blue',ylim=c(0.0005,0.005),lwd ='2',main = '')
par(new=TRUE)
plot(mtry_3,col='orange',ylim=c(0.0005,0.005),lwd = '2',main = '')
par(new=TRUE)
plot(mtry_4,col='green',ylim=c(0.0005,0.005),lwd = '2',main = '')
par(new=TRUE)
plot(mtry_5,col='pink',ylim=c(0.0005,0.005),lwd = '2',main = '')}

legend("topright", inset=.05, c("mtry=2","mtry=3","mtry=4","mtry=5","mtry=6"),bty = 'n',
       lty=c(1,1,1,1,1),  col=c("red","blue","orange","green","pink"),lwd =c(2, 2))

# load and tidy result (use tree = 200)
{mse1 <- as.data.frame(mtry_1$mse)
mse2 <- as.data.frame(mtry_2$mse)
mse3 <- as.data.frame(mtry_3$mse)
mse4 <- as.data.frame(mtry_4$mse)
mse5 <- as.data.frame(mtry_5$mse)}
test <- cbind(as.data.frame(t(cbind(mse1,mse2,mse3,mse4,mse5)))[,c(200)],
              as.data.frame(c(2,3,4,5,6)))

# plot ¡°mtry vs error¡± and choose mtry for testing and visulization
{plot(test$`c(2, 3, 4, 5, 6)`,
     test$`as.data.frame(t(cbind(mse1, mse2, mse3, mse4, mse5)))[, c(200)]`,
     type ='l',lwd = '2',xlab = "mtry", ylab = "Error",col = "red")
title(main = list("Error for Different mtry Values", cex = 1.5, col = "red", font = 3))}


