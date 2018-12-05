
library(pdfetch)
library(shiny)
library(xts)

IBM = pdfetch_YAHOO("IBM", from = "2017-01-01", to = "2017-12-31")
Apple = pdfetch_YAHOO("AAPL", from = "2017-01-01", to = "2017-12-31")
Tesla = pdfetch_YAHOO("TSLA", from = "2017-01-01", to = "2017-12-31")
Navidia = pdfetch_YAHOO("NVDA", from = "2017-01-01", to = "2017-12-31")
Google = pdfetch_YAHOO("GOOG", from = "2017-01-01", to = "2017-12-31")
Microsoft = pdfetch_YAHOO("MSFT", from = "2017-01-01", to = "2017-12-31")
GE = pdfetch_YAHOO("GE", from = "2017-01-01", to = "2017-12-31")
GM = pdfetch_YAHOO("GM", from = "2017-01-01", to = "2017-12-31")
JP = pdfetch_YAHOO("JP", from = "2017-01-01", to = "2017-12-31")
Amazon = pdfetch_YAHOO("AMZN", from = "2017-01-01", to = "2017-12-31")


Amazon$logreturn = log(Amazon$AMZN.close/Amazon$AMZN.open)
IBM$logreturn = log(IBM$IBM.close/IBM$IBM.open)
Google$logreturn = log(Google$GOOG.close/Google$GOOG.open)
Apple$logreturn = log(Apple$AAPL.close/Apple$AAPL.open)
Tesla$logreturn = log(Tesla$TSLA.close/Tesla$TSLA.open)
Navidia$logreturn = log(Navidia$NVDA.close/Navidia$NVDA.open)
Microsoft$logreturn = log(Microsoft$MSFT.close/Microsoft$MSFT.open)
GE$logreturn = log(GE$GE.close/GE$GE.open)
GM$logreturn = log(GM$GM.close/GM$GM.open)
JP$logreturn = log(JP$JP.close/JP$JP.open)

qqnorm(Amazon$logreturn)
qqline(Amazon$logreturn)

AllLogReturn <- data.frame(index(Amazon),index(Amazon),Amazon$logreturn,	IBM$logreturn,	
                           Google$logreturn,	Apple$logreturn,	
                           Tesla$logreturn,	Navidia$logreturn,	
                           Microsoft$logreturn,	GE$logreturn,	
                           GM$logreturn,	JP$logreturn)
colnameslist <- c("Date","Date2","Amazon",	"IBM",	"Google",	"Apple",	"Tesla",
                  "Navidia",	"Microsoft",	"GE",	"GM",	"JP")
colnames(AllLogReturn) <- colnameslist

AllLogReturn[,1] <- as.character(AllLogReturn[,1])



#1 ticker
##linear regression

linear=lm(formula = AllLogReturn$Amazon ~ AllLogReturn$Date2, data =AllLogReturn )
summary(summary(linear))
summary(linear)$coefficients[1]
summary(linear)$coefficients[2]
summary(linear)$r.squared




##plot data with ols line
plot( AllLogReturn$Date2, AllLogReturn$Amazon, pch = 16, cex = 1.3, col = "blue",  xlab = "Date", ylab = "LogReturn")
abline(lm(AllLogReturn$Amazon ~ AllLogReturn$Date2, data =AllLogReturn))
##plot residual 
linear.res = resid(linear)
plot(AllLogReturn$Date2, linear.res,  ylab="Residuals", xlab="date", main="residuals") 
abline(0,0)

#2 tickers
linear.two=lm(formula = AllLogReturn$Amazon ~ AllLogReturn$GE, data =AllLogReturn )
summary(linear.two)


##plot data with ols line
plot( AllLogReturn$GE, AllLogReturn$Amazon, pch = 16, cex = 1.3, col = "blue",  xlab = "Date", ylab = "LogReturn")
abline(lm(AllLogReturn$Amazon ~ AllLogReturn$GE, data =AllLogReturn))
##plot residual 
linear.restwo = resid(linear.two)
plot(AllLogReturn$Date2, linear.restwo,  ylab="Residuals", xlab="date", main="residuals") 
abline(0,0)




 #Shiny 



# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Daily Logreturn Histogram"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 40,
                  value = 10),
      numericInput(inputId = "cl",
                  label = "Confidence Level",
                  value = 0.95),
      selectInput("Ticker", "Stock Tickers:", 
                  choices=colnames(AllLogReturn)[c(-1,-2)]),
      selectInput("TickerY", "Second Stock Tickers(For Linear Regression as Y and mean check):", 
                  choices=colnames(AllLogReturn)[c(-1,-2)])
      ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      tabsetPanel(
        tabPanel("Histogram", plotOutput("plot")),
        tabPanel("Normal Probability Plot", plotOutput("plot1")),
        tabPanel("CI",verbatimTextOutput("text1"),
                 verbatimTextOutput("text2"),
                 verbatimTextOutput("text3"),
                 verbatimTextOutput("text4")),
        tabPanel("Regression on single stock", verbatimTextOutput("lm_summary")),
        tabPanel("Regression on single stock_Graph",  plotOutput("Single_Diagram"), plotOutput("Single_Res")),
        tabPanel("Regression on two stocks",verbatimTextOutput("lm_summary2")),
        tabPanel("Regression on two stocks_Graph",  plotOutput("two_Diagram"), plotOutput("two_Res")),
        tabPanel("Test the equality of the two population means",  verbatimTextOutput("meanCheck"))    
      )
    )
  )
)

server <- function(input, output) {
  
  
  output$plot <- renderPlot({
    
    x    <- AllLogReturn[,input$Ticker]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "lightblue", border = "white",
         xlab = "Daily logreturn",
         main = "Histogram of daily logreturn")
    
  })
  output$plot1 <- renderPlot({
    
    x    <- AllLogReturn[,input$Ticker]
    
    qqnorm(x, col = "lightblue", border = "white")
    qqline(x, col = "red")
    
  })
  
  output$text1 <- renderText ({paste("Mean:", mean(AllLogReturn[,input$Ticker]))})
  output$text2 <- renderText ({paste("Variance:", var(AllLogReturn[,input$Ticker]))})
  output$text3 <- renderText ({
    mean=mean(AllLogReturn[,input$Ticker])
    var=var(AllLogReturn[,input$Ticker])
    interval=mean + qt(c((1-input$cl)/2,1-(1-input$cl)/2),df=250)*(sqrt(var/nrow(AllLogReturn)))
    paste("CI of Mean:[",interval[1],",",interval[2],"]")
    })
  output$text4 <- renderText ({
    var=var(AllLogReturn[,input$Ticker])
    varlower = (nrow(AllLogReturn)-1)*var/qchisq((1-input$cl)/2,df=250)
    varupper = (nrow(AllLogReturn)-1)*var/qchisq(1-(1-input$cl)/2,df=250)
    paste("CI of Variance:[",varlower,",",varupper,"]")
    })
  
  output$lm_summary=renderText({
    
    #1 ticker
    ##linear regression

    linear=lm(formula = AllLogReturn[,input$Ticker] ~ AllLogReturn$Date2, data =AllLogReturn )
    intercept=round(summary(linear)$coefficients[1],5)
    slope=round(summary(linear)$coefficients[2],5)
    rsquared=round(summary(linear)$r.squared,5)
    paste("intercept:",intercept,"slope:",slope,"R squared:",rsquared)
  }) 
  
  output$Single_Diagram <- renderPlot({
    
    
    linear=lm(formula = AllLogReturn[,input$Ticker] ~ AllLogReturn$Date2, data =AllLogReturn )
    
    ##plot data with ols line
    plot( AllLogReturn$Date2, AllLogReturn[,input$Ticker], pch = 16, cex = 1.3, col = "blue",  xlab = "Date", ylab = "LogReturn",main="ols line")
    abline(lm(AllLogReturn[,input$Ticker] ~ AllLogReturn$Date2, data =AllLogReturn))

  })
  
  output$Single_Res <- renderPlot({
    
    
    linear=lm(formula = AllLogReturn[,input$Ticker] ~ AllLogReturn$Date2, data =AllLogReturn )
    ##plot residual 
    linear.res = resid(linear)
    plot(AllLogReturn$Date2, linear.res,  ylab="Residuals", xlab="date", main="residuals") 
    abline(0,0)
  })
  
  
  #####two stocks#####
  output$lm_summary2=renderText({
    
    #2 tickers
    ##linear regression
    
    linear.two=lm(formula = AllLogReturn[,input$TickerY] ~ AllLogReturn[,input$Ticker], data =AllLogReturn )
    intercept=round(summary(linear.two)$coefficients[1],5)
    slope=round(summary(linear.two)$coefficients[2],5)
    rsquared=round(summary(linear.two)$r.squared,5)
    paste("intercept:",intercept,"slope:",slope,"R squared:",rsquared)
  }) 
  
  output$two_Diagram <- renderPlot({
    
    
    linear.two=lm(formula = AllLogReturn[,input$TickerY] ~ AllLogReturn[,input$Ticker], data =AllLogReturn )
    
    ##plot data with ols line
    plot( AllLogReturn[,input$Ticker], AllLogReturn[,input$TickerY], pch = 16, cex = 1.3, col = "blue",  xlab = "LogReturn X", ylab = "LogReturn Y",main="ols line")
    abline(lm(AllLogReturn[,input$TickerY] ~ AllLogReturn[,input$Ticker], data =AllLogReturn))
    
  })
  
  output$two_Res <- renderPlot({
    
    
    linear.two=lm(formula = AllLogReturn[,input$TickerY] ~ AllLogReturn[,input$Ticker], data =AllLogReturn )
    ##plot residual 
    linear.res2 = resid(linear.two)
    plot(AllLogReturn[,input$Ticker], linear.res2,  ylab="Residuals", xlab="LogReturn X", main="residuals") 
    abline(0,0)
  })
  
  output$meanCheck <- renderText({
    meanX=mean(AllLogReturn[,input$Ticker])
    meanY=mean(AllLogReturn[,input$TickerY])
    
    VarX=var(AllLogReturn[,input$Ticker])
    VarY=var(AllLogReturn[,input$TickerY])
    
    VarX1=VarX/length(AllLogReturn[,input$Ticker])
    VarY1=VarY/length(AllLogReturn[,input$TickerY])
    
    value=(meanX-meanY)/sqrt(VarX1+VarY1)
    
    upper=qnorm(1-(1-input$cl)/2)
    lower=-upper
    if (value>upper | value<lower){
      paste("Reject the null hypothesis and two populations have different mean, Interval[",lower,",",upper,"]", "     ","statistic:" ,value )
      
    }else{
      paste("Do not Reject the null hypothesis and two populations have same mean, Interval[",lower,",",upper,"]", "     ","statistic:" ,value )
      
    }
    
  
  })
  

 
  
}

shinyApp(ui, server)

