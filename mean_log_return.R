install.packages("quantmod")
library(quantmod)
dji <- new.env()
options("getSymbols.warning4.0"=FALSE)
#--a
getSymbols("MMM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
a3M<- dji$MMM
a3M$logreturn <- log(a3M$MMM.Close/a3M$MMM.Open)
a3M_mean = mean(a3M$logreturn) 

getSymbols("UTX", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aUTX<- dji$UTX
aUTX$logreturn <- log(aUTX$UTX.Close/aUTX$UTX.Open)
aUTX_mean = mean(aUTX$logreturn)

#--Financial
getSymbols("APX", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aAPX<- dji$APX
aAPX$logreturn <- log(aAPX$APX.Close/aAPX$APX.Open)
aAPX_mean = mean(aAPX$logreturn) 

getSymbols("GS", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aGS<- dji$GS
aGS$logreturn <- log(aGS$GS.Close/aGS$GS.Open)
aGS_mean = mean(aGS$logreturn) 

getSymbols("JPM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aJPM<- dji$JPM
aJPM$logreturn <- log(aJPM$JPM.Close/aJPM$JPM.Open)
aJPM_mean = mean(aJPM$logreturn) 

getSymbols("V", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aV<- dji$V
aV$logreturn <- log(aV$V.Close/aV$V.Open)
aV_mean = mean(aV$logreturn) 
sec_f = max(aAPX_mean, aGS_mean,aJPM_mean,aV_mean)

#--food
getSymbols("KO", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aKO<- dji$KO
aKO$logreturn <- log(aKO$KO.Close/aKO$KO.Open)
aKO_mean = mean(aKO$logreturn) 

getSymbols("MCD", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aMCD<- dji$MCD
aMCD$logreturn <- log(aMCD$MCD.Close/aMCD$MCD.Open)
aMCD_mean = mean(aMCD$logreturn) 
max(aKO_mean, aMCD_mean)

#--IT
getSymbols("AAPL", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aAAPL<- dji$AAPL
aAAPL$logreturn <- log(aAAPL$AAPL.Close/aAAPL$AAPL.Open)
aAAPL_mean = mean(aAAPL$logreturn) 

getSymbols("CSCO", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aCSCO<- dji$CSCO
aCSCO$logreturn <- log(aCSCO$CSCO.Close/aCSCO$CSCO.Open)
aCSCO_mean = mean(aCSCO$logreturn) 

getSymbols("IBM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aIBM<- dji$IBM
aIBM$logreturn <- log(aIBM$IBM.Close/aIBM$IBM.Open)
aIBM_mean = mean(aIBM$logreturn) 

getSymbols("INTC", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
INTC<- dji$INTC
INTC$logreturn <- log(INTC$INTC.Close/INTC$INTC.Open)
aINTC_mean = mean(INTC$logreturn) 

getSymbols("MSFT", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aMSFT<- dji$MSFT
aMSFT$logreturn <- log(aMSFT$MSFT.Close/aMSFT$MSFT.Open)
aMSFT_mean = mean(aMSFT$logreturn) 
max(aAAPL_mean,aCSCO_mean,aIBM_mean,aINTC_mean,aMSFT_mean)

#--OIL
getSymbols("CVX", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aCVX<- dji$CVX
aCVX$logreturn <- log(aCVX$CVX.Close/aCVX$CVX.Open)
aCVX_mean = mean(aCVX$logreturn) 

getSymbols("XOM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aXOM<- dji$XOM
aXOM$logreturn <- log(aXOM$XOM.Close/aXOM$XOM.Open)
aXOM_mean = mean(aXOM$logreturn) 
max(aCVX_mean)

#--phar
getSymbols("JNJ", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aJNJ<- dji$JNJ
aJNJ$logreturn <- log(aJNJ$JNJ.Close/aJNJ$JNJ.Open)
aJNJ_mean = mean(aJNJ$logreturn) 

getSymbols("MRK", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aMRK<- dji$MRK
aMRK$logreturn <- log(aMRK$MRK.Close/aMRK$MRK.Open)
aMRK_mean = mean(aMRK$logreturn) 

getSymbols("PFE", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aPFE<- dji$PFE
aPFE$logreturn <- log(aPFE$PFE.Close/aPFE$PFE.Open)
aPFE_mean = mean(aPFE$logreturn) 
max(aJNJ_mean,aMRK_mean,aPFE_mean)

#--
getSymbols("HD", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aHD<- dji$HD
aHD$logreturn <- log(aHD$HD.Close/aHD$HD.Open)
aHD_mean = mean(aHD$logreturn)

getSymbols("WMT", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aWMT<- dji$WMT
aWMT$logreturn <- log(aWMT$WMT.Close/aWMT$WMT.Open)
aWMT_mean = mean(aWMT$logreturn)

getSymbols("WBA", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
aWBA<- dji$WBA
aWBA$logreturn <- log(aWBA$WBA.Close/aWBA$WBA.Open)
aWBA_mean = mean(aWBA$logreturn)

max(aWBA_mean,aHD_mean,aWMT_mean)
