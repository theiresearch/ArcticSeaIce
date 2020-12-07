library(glmnet)
library(mice)

arctic <- read.csv("arctic_data.csv",stringsAsFactors = F)
x <- as.matrix(arctic[,c(7:13)])
y <- as.matrix(arctic[,c(6)])

# lasso regression
r1 <- glmnet(x = x, y = y, family = "gaussian", alpha = 1)

# coefficients variation plot
plot(r1, xvar="lambda", lwd = '2')

# n-fold testing 
rlcv <- cv.glmnet(x = x, y = y, family = "gaussian", alpha = 1, nfolds = 10)

# Log Lambda vs Testing Error
plot(rlcv)

# Print value of "min" and "1se"
print(rlcv)

# view coefficients (the result can be different after each training
# since n-folds method above split data set randomly)
coef(rlcv,s=rlcv$lambda.1se)
coef(rlcv,s=rlcv$lambda.min)

# put optimum coefficients into model
rlcv_min <- glmnet(x = x, y = y, family = "gaussian", 
                   alpha = 1, lambda = rlcv$lambda.min)

# prediction and table merging
result <- as.data.frame(cbind(arctic[,c(1,2,3,6)],predict(rlcv_min,x)))

# calculate value of R^2
result["R^2"] <- ((result$area-result$s0)^2)
R_square <- sum(result$`R^2`)/490

# plot line chart (Prediction vs True)
{plot(result$observation,result$area,type ='l',ylim = c(0,1.5),lwd = '2',
      xlab = "Observation_ID", ylab = "Value")
  lines(result$observation,result$s0,lty=1,col='red',lwd = '2')}

# title and legend
{title(main = list("Penalized Linear Regression", cex = 1.5, col = "red", font = 3)) 
  legend("topright", inset=.05, c("Prediction","True"),bty = 'n',
         lty=c(1, 1),  col=c("red", "black"),lwd =c(2, 2))}

