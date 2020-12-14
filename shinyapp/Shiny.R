library(shiny)
library(shinythemes)
library(rsconnect)

arctic <- read.csv("Jeff.csv",stringsAsFactors = F)
tit <- read.csv("Jeff1.csv",stringsAsFactors = F)
pred <- read.csv("pred.csv",stringsAsFactors = F)
tool <- read.csv("tool.csv",stringsAsFactors = F)

# Define UI
{ui <- fluidPage(theme = shinytheme("united"),
                navbarPage(
                  "Group Orange",
                  {tabPanel("Nowcasting",
                           sidebarPanel(
                             h1("Arctic Ice Extent Nowcasting"),
                             h1(" (Model Evaluation)    "),
                             hr(),
                             h3("From 1980 to 2020 (based on normolized data)"),
                             hr(),
                             selectInput("region", "Algorithm Selection:",
                                         choices=colnames(tit)),
                             hr(),
                             helpText("7 algorithms in total")
                             
                           ), # sidebarPanel
                           mainPanel(
                             
                             plotOutput("phonePlot",width = "90%",height = "400px"),
                             plotOutput("Plot",width = "60%",height = "400px")
                             
                           ) # mainPanel
                           
                  )}, # Navbar 1, tabPanel
                  
                  tabPanel("Forcasting",
                           sidebarPanel(
                             h1("Arctic Ice Extent Forcasting"),
                             h1(" (Future Prediction)    "),
                             hr(),
                             h3("From 2020 to 2030"),
                             hr(),
                             selectInput("rr", "Scenarios Selection:",
                                         choices=colnames(tool)),
                             hr(),
                             helpText("3 Scenarios are provided")
                             
                           ), # sidebarPanel
                           mainPanel(
                             
                             plotOutput("abc",width = "90%",height = "600px"),
                             
                           ) # mainPanel
                           
                  )
                  
                ) # navbarPage
) # fluidPage
}

# Define server function  
server <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    if(input$region == 'Linear_Regression')
    {
    options(repr.plot.width=15, repr.plot.height=7.5)
    plot(arctic$observation,arctic$Extent,type ='l',ylim = c(0,1.5),lwd = '2',
           xlab = "Date", ylab = "Value",xaxt='n',cex.lab = 1.5)
    lines(arctic$observation,arctic$Linear_Regression,lty=1,col='red',lwd = '2')
    axis(1,at=c(1,61,121,181,241,301,361,421,481),
         labels=c("Jan 1980","Jan 1985","Jan 1990","Jan 1995","Jan 2000","Jan 2005","Jan 2010","Jan 2015","Jan 2020"))
    title(main = list("Time Series", cex = 2, col = "black", font = 2))
    legend("topright",inset=.05,c("Prediction","True"),
           bty = 'n',lty=c(1, 1),col=c("red", "black"),lwd =c(2, 2),cex = 1.5)
    }
    if(input$region == 'Penalised_Linear_Regression_Lasso_min')
    {
      options(repr.plot.width=15, repr.plot.height=7.5)
      plot(arctic$observation,arctic$Extent,type ='l',ylim = c(0,1.5),lwd = '2',
           xlab = "Date", ylab = "Value",xaxt='n',cex.lab = 1.5)
      lines(arctic$observation,arctic$Penalised_Linear_Regression_Lasso_min,lty=1,col='red',lwd = '2')
      axis(1,at=c(1,61,121,181,241,301,361,421,481),
           labels=c("Jan 1980","Jan 1985","Jan 1990","Jan 1995","Jan 2000","Jan 2005","Jan 2010","Jan 2015","Jan 2020"))
      title(main = list("Time Series", cex = 2, col = "black", font = 2))
      legend("topright",inset=.05,c("Prediction","True"),
             bty = 'n',lty=c(1, 1),col=c("red", "black"),lwd =c(2, 2),cex = 1.5)
    }
    if(input$region == 'Penalised_Linear_Regression_Lasso_1se')
    {
      options(repr.plot.width=15, repr.plot.height=7.5)
      plot(arctic$observation,arctic$Extent,type ='l',ylim = c(0,1.5),lwd = '2',
           xlab = "Date", ylab = "Value",xaxt='n',cex.lab = 1.5)
      lines(arctic$observation,arctic$Penalised_Linear_Regression_Lasso_1se,lty=1,col='red',lwd = '2')
      axis(1,at=c(1,61,121,181,241,301,361,421,481),
           labels=c("Jan 1980","Jan 1985","Jan 1990","Jan 1995","Jan 2000","Jan 2005","Jan 2010","Jan 2015","Jan 2020"))
      title(main = list("Time Series", cex = 2, col = "black", font = 2))
      legend("topright",inset=.05,c("Prediction","True"),
             bty = 'n',lty=c(1, 1),col=c("red", "black"),lwd =c(2, 2),cex = 1.5)
    }
    if(input$region == 'Penalised_Polynomial_Regression_Lasso_min')
    {
      options(repr.plot.width=15, repr.plot.height=7.5)
      plot(arctic$observation,arctic$Extent,type ='l',ylim = c(0,1.5),lwd = '2',
           xlab = "Date", ylab = "Value",xaxt='n',cex.lab = 1.5)
      lines(arctic$observation,arctic$Penalised_Polynomial_Regression_Lasso_min,lty=1,col='red',lwd = '2')
      axis(1,at=c(1,61,121,181,241,301,361,421,481),
           labels=c("Jan 1980","Jan 1985","Jan 1990","Jan 1995","Jan 2000","Jan 2005","Jan 2010","Jan 2015","Jan 2020"))
      title(main = list("Time Series", cex = 2, col = "black", font = 2))
      legend("topright",inset=.05,c("Prediction","True"),
             bty = 'n',lty=c(1, 1),col=c("red", "black"),lwd =c(2, 2),cex = 1.5)
    }
    if(input$region == 'Penalised_Polynomial_Regression_Lasso_1se')
    {
      options(repr.plot.width=15, repr.plot.height=7.5)
      plot(arctic$observation,arctic$Extent,type ='l',ylim = c(0,1.5),lwd = '2',
           xlab = "Date", ylab = "Value",xaxt='n',cex.lab = 1.5)
      lines(arctic$observation,arctic$Penalised_Polynomial_Regression_Lasso_1se,lty=1,col='red',lwd = '2')
      axis(1,at=c(1,61,121,181,241,301,361,421,481),
           labels=c("Jan 1980","Jan 1985","Jan 1990","Jan 1995","Jan 2000","Jan 2005","Jan 2010","Jan 2015","Jan 2020"))
      title(main = list("Time Series", cex = 2, col = "black", font = 2))
      legend("topright",inset=.05,c("Prediction","True"),
             bty = 'n',lty=c(1, 1),col=c("red", "black"),lwd =c(2, 2),cex = 1.5)
    }
    if(input$region == 'Random_Forest')
    {
      options(repr.plot.width=15, repr.plot.height=7.5)
      plot(arctic$observation,arctic$Extent,type ='l',ylim = c(0,1.5),lwd = '2',
           xlab = "Date", ylab = "Value",xaxt='n',cex.lab = 1.5)
      lines(arctic$observation,arctic$Random_Forest,lty=1,col='red',lwd = '2')
      axis(1,at=c(1,61,121,181,241,301,361,421,481),
           labels=c("Jan 1980","Jan 1985","Jan 1990","Jan 1995","Jan 2000","Jan 2005","Jan 2010","Jan 2015","Jan 2020"))
      title(main = list("Time Series", cex = 2, col = "black", font = 2))
      legend("topright",inset=.05,c("Prediction","True"),
             bty = 'n',lty=c(1, 1),col=c("red", "black"),lwd =c(2, 2),cex = 1.5)
    }
    if(input$region == 'Neural_Networks')
    {
      options(repr.plot.width=15, repr.plot.height=7.5)
      plot(arctic$observation,arctic$Extent,type ='l',ylim = c(0,1.5),lwd = '2',
           xlab = "Date", ylab = "Value",xaxt='n',cex.lab = 1.5)
      lines(arctic$observation,arctic$Neural_Networks,lty=1,col='red',lwd = '2')
      axis(1,at=c(1,61,121,181,241,301,361,421,481),
           labels=c("Jan 1980","Jan 1985","Jan 1990","Jan 1995","Jan 2000","Jan 2005","Jan 2010","Jan 2015","Jan 2020"))
      title(main = list("Time Series", cex = 2, col = "black", font = 2))
      legend("topright",inset=.05,c("Prediction","True"),
             bty = 'n',lty=c(1, 1),col=c("red", "black"),lwd =c(2, 2),cex = 1.5)
    }
    
  })
  output$Plot <- renderPlot({
    if(input$region == 'Linear_Regression')
    {
      options(repr.plot.width=15, repr.plot.height=15)
      
      plot(arctic$Extent, arctic$Linear_Regression,xlim = c(0,1.0), ylim = c(0,1.2),
           xlab = "True value", ylab = "Predicted value",cex.lab = 1.5)
      par(new = TRUE)
      curve(x+0,0,1,bty="l",xlim = c(0,1.0), ylim = c(0,1.2),
            col=c("red"),lwd =c(2),lty=c(2),xlab = "True value", ylab = "Predicted value",cex.lab=1.5)
      # title
      title(main = list("Fitting Diagram", cex = 2, col = "black", font = 2))
    }
    if(input$region == 'Penalised_Linear_Regression_Lasso_min')
    {
      options(repr.plot.width=15, repr.plot.height=15)
      
      plot(arctic$Extent, arctic$Penalised_Linear_Regression_Lasso_min,xlim = c(0,1.0), ylim = c(0,1.2),
           xlab = "True value", ylab = "Predicted value",cex.lab = 1.5)
      par(new = TRUE)
      curve(x+0,0,1,bty="l",xlim = c(0,1.0), ylim = c(0,1.2),
            col=c("red"),lwd =c(2),lty=c(2),xlab = "True value", ylab = "Predicted value",cex.lab=1.5)
      # title
      title(main = list("Fitting Diagram", cex = 2, col = "black", font = 2))
    }
    if(input$region == 'Penalised_Linear_Regression_Lasso_1se')
    {
      options(repr.plot.width=15, repr.plot.height=15)
      
      plot(arctic$Extent, arctic$Penalised_Linear_Regression_Lasso_1se,xlim = c(0,1.0), ylim = c(0,1.2),
           xlab = "True value", ylab = "Predicted value",cex.lab = 1.5)
      par(new = TRUE)
      curve(x+0,0,1,bty="l",xlim = c(0,1.0), ylim = c(0,1.2),
            col=c("red"),lwd =c(2),lty=c(2),xlab = "True value", ylab = "Predicted value",cex.lab=1.5)
      # title
      title(main = list("Fitting Diagram", cex = 2, col = "black", font = 2))
    }
    if(input$region == 'Penalised_Polynomial_Regression_Lasso_min')
    {
      options(repr.plot.width=15, repr.plot.height=15)
      
      plot(arctic$Extent, arctic$Penalised_Polynomial_Regression_Lasso_min,xlim = c(0,1.0), ylim = c(0,1.2),
           xlab = "True value", ylab = "Predicted value",cex.lab = 1.5)
      par(new = TRUE)
      curve(x+0,0,1,bty="l",xlim = c(0,1.0), ylim = c(0,1.2),
            col=c("red"),lwd =c(2),lty=c(2),xlab = "True value", ylab = "Predicted value",cex.lab=1.5)
      # title
      title(main = list("Fitting Diagram", cex = 2, col = "black", font = 2))
    }
    if(input$region == 'Penalised_Polynomial_Regression_Lasso_1se')
    {
      options(repr.plot.width=15, repr.plot.height=15)
      
      plot(arctic$Extent, arctic$Penalised_Polynomial_Regression_Lasso_1se,xlim = c(0,1.0), ylim = c(0,1.2),
           xlab = "True value", ylab = "Predicted value",cex.lab = 1.5)
      par(new = TRUE)
      curve(x+0,0,1,bty="l",xlim = c(0,1.0), ylim = c(0,1.2),
            col=c("red"),lwd =c(2),lty=c(2),xlab = "True value", ylab = "Predicted value",cex.lab=1.5)
      # title
      title(main = list("Fitting Diagram", cex = 2, col = "black", font = 2))
    }
    if(input$region == 'Random_Forest')
    {
      options(repr.plot.width=15, repr.plot.height=15)
      
      plot(arctic$Extent, arctic$Random_Forest,xlim = c(0,1.0), ylim = c(0,1.2),
           xlab = "True value", ylab = "Predicted value",cex.lab = 1.5)
      par(new = TRUE)
      curve(x+0,0,1,bty="l",xlim = c(0,1.0), ylim = c(0,1.2),
            col=c("red"),lwd =c(2),lty=c(2),xlab = "True value", ylab = "Predicted value",cex.lab=1.5)
      # title
      title(main = list("Fitting Diagram", cex = 2, col = "black", font = 2))
    }
    if(input$region == 'Neural_Networks')
    {
      options(repr.plot.width=15, repr.plot.height=15)
      
      plot(arctic$Extent, arctic$Neural_Networks,xlim = c(0,1.0), ylim = c(0,1.2),
           xlab = "True value", ylab = "Predicted value",cex.lab = 1.5)
      par(new = TRUE)
      curve(x+0,0,1,bty="l",xlim = c(0,1.0), ylim = c(0,1.2),
            col=c("red"),lwd =c(2),lty=c(2),xlab = "True value", ylab = "Predicted value",cex.lab=1.5)
      # title
      title(main = list("Fitting Diagram", cex = 2, col = "black", font = 2))
    }
  })
  
  output$abc <- renderPlot({
    
    if(input$rr == 'Normal_Situation_40_Years')
    {
    pred["prediction"] <- (pred$normal*(16.09-3.57)+3.57)
    pred["Ex"] <- (pred$Extent*(16.09-3.57)+3.57)
    
    # plot line chart (Prediction vs True)
    plot(pred$year,pred$Ex,type ='l',lwd = '2',ylim = c(8,14),
          xlab = "Year", ylab = "Sea Ice Extent (Mkm^2)")
      lines(pred$year,pred$prediction,lty=2,col='red',lwd = '2')
    
    
    # title and legend
    title(main = list("Normal Situation Prediction", cex = 1.5, col = "black", font = 2)) 
      legend("topright", c("Prediction Value","Existed Value"),bty = 'n',
             lty=c(2, 1),  col=c("red", "black"),lwd =c(2, 2))
    }
    
    if(input$rr == 'Special_Situation_Ozone')
    {
      pred <- pred[which(pred$year>=2020),]
      pred["prediction"] <- (pred$normal*(16.09-3.57)+3.57)
      pred["Ex"] <- (pred$Extent*(16.09-3.57)+3.57)
      pred["O+"] <- (pred$omax*(16.09-3.57)+3.57)
      pred["O-"] <- (pred$omin*(16.09-3.57)+3.57)
      
      options(repr.plot.width=30, repr.plot.height=15)
      # plot line chart (Prediction vs True)
      plot(pred$year,pred$prediction,type ='l',lty=1,col='red',lwd = '2',ylim = c(9,11),
           xlab = "Year", ylab = "Sea Ice Extent (Mkm^2)")
      lines(pred$year,pred$'O+',lty=1,col='green',lwd = '2')
      lines(pred$year,pred$'O-',lty=1,col='blue',lwd = '2')
      
      # title and legend
      title(main = list("Special Situation Prediction (Ozone)", cex = 1.5, col = "black", font = 2)) 
      legend("topright", c("Normal Prediction","Ozone (high level)","Ozone (low level)"),bty = 'n',
             lty=c(1,1,1),  col=c("red", "green","blue"),lwd =c(2,2,2))
    }
    
    if(input$rr == 'Special_Situation_Temperature')
    {
      pred <- pred[which(pred$year>=2020),]
      pred["prediction"] <- (pred$normal*(16.09-3.57)+3.57)
      pred["Ex"] <- (pred$Extent*(16.09-3.57)+3.57)
      pred["O+"] <- (pred$tmax*(16.09-3.57)+3.57)
      pred["O-"] <- (pred$tmin*(16.09-3.57)+3.57)
      
      options(repr.plot.width=30, repr.plot.height=15)
      # plot line chart (Prediction vs True)
      plot(pred$year,pred$prediction,type ='l',lty=1,col='red',lwd = '2',ylim = c(9,11),
           xlab = "Year", ylab = "Sea Ice Extent (Mkm^2)")
      lines(pred$year,pred$'O+',lty=1,col='green',lwd = '2')
      lines(pred$year,pred$'O-',lty=1,col='blue',lwd = '2')
      
      # title and legend
      title(main = list("Special Situation Prediction (Temperatre)", cex = 1.5, col = "black", font = 2)) 
      legend("topright", c("Normal Prediction","Temperature (high level)","Temperature (low level)"),bty = 'n',
             lty=c(1,1,1),  col=c("red", "green","blue"),lwd =c(2,2,2))
    }
    
  })}


# Create Shiny object
shinyApp(ui = ui, server = server)

