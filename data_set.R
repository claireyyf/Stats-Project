############################
#### IEOR 4150 Project #####
### Claire Feng (yf2476) ###
### Wenjie Wang (ww2503) ###
### Yizhou Zhang (yz3425) ##
############################

# Set up environment 
install.packages("quantmod")
library(quantmod)
dji <- new.env()

# The Dow Jones Industrial Average constitutes of 30 stocks that cover 16 sectors
# We want only one stock per sector. 
# So for sectors with multiple stocks, we pick the one with highest returns

options("getSymbols.warning4.0"=FALSE)

## There are 2 stocks under sector: Conglomerate
# 3M
getSymbols("MMM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
# Cannot have variable name starting with number. Add "c"
c3M<- dji$MMM
c3M$logreturn <- log(c3M$MMM.Close/c3M$MMM.Open)
c3M_mean = mean(c3M$logreturn) 
# United Technologies
getSymbols("UTX", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
UTX<- dji$UTX
UTX$logreturn <- log(UTX$UTX.Close/UTX$UTX.Open)
UTX_mean = mean(UTX$logreturn)
# Compare the two stocks
sec_con = c('3M','UTX')[which.max(c(c3M_mean, UTX_mean))]

## There are 4 stocks under sector: Financial
# American Express
getSymbols("APX", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
APX<- dji$APX
APX$logreturn <- log(APX$APX.Close/APX$APX.Open)
APX_mean = mean(APX$logreturn) 
# Goldman Sachs
getSymbols("GS", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
GS<- dji$GS
GS$logreturn <- log(GS$GS.Close/GS$GS.Open)
GS_mean = mean(GS$logreturn) 
# JP Morgan
getSymbols("JPM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
JPM<- dji$JPM
JPM$logreturn <- log(JPM$JPM.Close/JPM$JPM.Open)
JPM_mean = mean(JPM$logreturn) 
# Visa
getSymbols("V", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
V<- dji$V
V$logreturn <- log(V$V.Close/V$V.Open)
V_mean = mean(V$logreturn) 
# Compare across the sector
sec_fin = c('American Express','Goldman Sachs','JP Morgan','Visa')[which.max(c(APX_mean, GS_mean, JPM_mean, V_mean))]

## There are 2 stocks under sector: Food
# Coca-Cola
getSymbols("KO", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
KO<- dji$KO
KO$logreturn <- log(KO$KO.Close/KO$KO.Open)
KO_mean = mean(KO$logreturn) 
# McDonald's
getSymbols("MCD", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
MCD<- dji$MCD
MCD$logreturn <- log(MCD$MCD.Close/MCD$MCD.Open)
MCD_mean = mean(MCD$logreturn) 
# Compare across the sector
sec_food = c("Coca-Cola","McDonald's")[which.max(c(KO_mean,MCD_mean))]

## There are 5 stocks under the sector: IT
# Apple
getSymbols("AAPL", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
AAPL<- dji$AAPL
AAPL$logreturn <- log(AAPL$AAPL.Close/AAPL$AAPL.Open)
AAPL_mean = mean(AAPL$logreturn) 
# Cisco
getSymbols("CSCO", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
CSCO<- dji$CSCO
CSCO$logreturn <- log(CSCO$CSCO.Close/CSCO$CSCO.Open)
CSCO_mean = mean(CSCO$logreturn) 
# IBM
getSymbols("IBM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
IBM<- dji$IBM
IBM$logreturn <- log(IBM$IBM.Close/IBM$IBM.Open)
IBM_mean = mean(IBM$logreturn) 
# Intel
getSymbols("INTC", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
INTC<- dji$INTC
INTC$logreturn <- log(INTC$INTC.Close/INTC$INTC.Open)
INTC_mean = mean(INTC$logreturn) 
# Microsoft
getSymbols("MSFT", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
MSFT<- dji$MSFT
MSFT$logreturn <- log(MSFT$MSFT.Close/MSFT$MSFT.Open)
MSFT_mean = mean(MSFT$logreturn) 
# Compare across the sector
sec_it = c('Apple','Cisco','IBM','Intel','Microsoft')[which.max(c(AAPL_mean,CSCO_mean,IBM_mean,INTC_mean,MSFT_mean))]

# There are 2 stocks under the sector: Oil & Gas
# Chevron
getSymbols("CVX", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
CVX<- dji$CVX
CVX$logreturn <- log(CVX$CVX.Close/CVX$CVX.Open)
CVX_mean = mean(CVX$logreturn) 
# ExxonMobil
getSymbols("XOM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
XOM<- dji$XOM
XOM$logreturn <- log(XOM$XOM.Close/XOM$XOM.Open)
XOM_mean = mean(XOM$logreturn) 
# Compare across the sector
sec_oil = c('Chevron','ExxonMobil')[which.max(c(CVX_mean,XOM_mean))]

## There are 3 stocks under the sector: Pharmaceuticals
# Johnson & Johnson
getSymbols("JNJ", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
JNJ<- dji$JNJ
JNJ$logreturn <- log(JNJ$JNJ.Close/JNJ$JNJ.Open)
JNJ_mean = mean(JNJ$logreturn) 
# Merk & Company
getSymbols("MRK", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
MRK<- dji$MRK
MRK$logreturn <- log(MRK$MRK.Close/MRK$MRK.Open)
MRK_mean = mean(MRK$logreturn) 
# Pfizer
getSymbols("PFE", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
PFE<- dji$PFE
PFE$logreturn <- log(PFE$PFE.Close/PFE$PFE.Open)
PFE_mean = mean(PFE$logreturn) 
# Compare across the sector
sec_phar = c('J&J','Merk&Co','Pfizer')[which.max(c(JNJ_mean,MRK_mean,PFE_mean))]

## There are 3 stocks under the sector: Retail
# The Home Depot
getSymbols("HD", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
HD<- dji$HD
HD$logreturn <- log(HD$HD.Close/HD$HD.Open)
HD_mean = mean(HD$logreturn)
# Walmart
getSymbols("WMT", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
WMT<- dji$WMT
WMT$logreturn <- log(WMT$WMT.Close/WMT$WMT.Open)
WMT_mean = mean(WMT$logreturn)
# Walgreens Boots Alliance
getSymbols("WBA", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
WBA<- dji$WBA
WBA$logreturn <- log(WBA$WBA.Close/WBA$WBA.Open)
WBA_mean = mean(WBA$logreturn)
# Compare across the sector
sec_ret = c('The Home Depot','Walmart','Walgreens')[which.max(c(HD_mean,WMT_mean,WBA_mean))]

## For sectors with multiple stocks, the selected ones are:
sec_multi = c(sec_con, sec_fin, sec_food, sec_it, sec_oil, sec_phar, sec_ret)

## Get information on the remaining 9 sectors' single stocks for the portfolio
getSymbols("BA", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("NKE", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("DIS", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("DWDP", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("CAT", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("PG", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("TRV", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("UNH", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("VZ", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))

Boeing<- dji$BA
Nike <- dji$NKE
Disney <- dji$DIS
DWDP <- dji$DWDP
CAT<- dji$CAT
PG <- dji$PG
TRV<- dji$TRV
UNH<- dji$UNH
JNJ<- dji$JNJ
Verizon <- dji$VZ

# Calculate the log-returns of each of the 9 stocks
Boeing$logreturn <- log(Boeing$BA.Close/Boeing$BA.Open)
Nike$logreturn <- log(Nike$NKE.Close/Nike$NKE.Open)
Disney$logreturn <- log(Disney$DIS.Close/Disney$DIS.Open)
DWDP$logreturn <- log(DWDP$DWDP.Close/DWDP$DWDP.Open)
CAT$logreturn <- log(CAT$CAT.Close/CAT$CAT.Open)
PG$logreturn <- log(PG$PG.Close/PG$PG.Open)
TRV$logreturn <- log(TRV$TRV.Close/TRV$TRV.Open)
UNH$logreturn <- log(UNH$UNH.Close/UNH$UNH.Open)
Verizon$logreturn <- log(Verizon$VZ.Close/Verizon$VZ.Open)

# Create data frame of portfolio stock's log returns (16 stocks)
DailyLogReturn = 
  data.frame(index(Boeing), Boeing$logreturn, Nike$logreturn, Disney$logreturn, 
             DWDP$logreturn, c3M$logreturn, CAT$logreturn, PG$logreturn, 
             V$logreturn, MCD$logreturn, AAPL$logreturn,  TRV$logreturn, 
             UNH$logreturn, CVX$logreturn, JNJ$logreturn, WMT$logreturn, Verizon$logreturn)

nameslist <- c("Date","Boeing",	"Nike",	"Disney",	"DuPont",	"3M", "Caterpillar", 
               "P&G",	"Visa",	"McDonald's","Apple", "Travelers", "United Health", 
               "Chevron", "J&J", "Walmart", "Verizon")
colnames(DailyLogReturn) <- nameslist

# Get the logreturns of Dow Jones Industrial Average = Benchmark
getSymbols("^DJI", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
DowJones <- dji$DJI
DowJones$logreturn <- log(DowJones$DJI.Close/DowJones$DJI.Open)
