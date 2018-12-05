install.packages("quantmod")
library(quantmod)

getSymbols("BA", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("NKE", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("DIS", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("DWDP", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("MMM", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("CAT", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("PG", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("V", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("MCD", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("AAPL", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("TRV", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("UNH", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("CVX", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("JNJ", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("WMT", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))
getSymbols("VZ", env = dji, src = "yahoo", from = as.Date("2017-1-1"), to = as.Date("2017-12-31"))

Boeing<- dji$BA
Nike <- dji$NKE
Disney <- dji$DIS
DWDP <- dji$DWDP
MMM<- dji$MMM
CAT<- dji$CAT
PG <- dji$PG
Visa<- dji$V
MCD<- dji$MCD
Apple <- dji$AAPL
TRV<- dji$TRV
UNH<- dji$UNH
Chevron <- dji$CVX
JNJ<- dji$JNJ
Walmart <- dji$WMT
Verizon <- dji$VZ

Boeing$logreturn <- log(Boeing$BA.Close/Boeing$BA.Open)
Nike$logreturn <- log(Nike$NKE.Close/Nike$NKE.Open)
Disney$logreturn <- log(Disney$DIS.Close/Disney$DIS.Open)
DWDP$logreturn <- log(DWDP$DWDP.Close/DWDP$DWDP.Open)
MMM$logreturn <- log(MMM$MMM.Close/MMM$MMM.Open)
CAT$logreturn <- log(CAT$CAT.Close/CAT$CAT.Open)
PG$logreturn <- log(PG$PG.Close/PG$PG.Open)
Visa$logreturn <- log(Visa$V.Close/Visa$V.Open)
MCD$logreturn <- log(MCD$MCD.Close/MCD$MCD.Open)
Apple$logreturn <- log(Apple$AAPL.Close/Apple$AAPL.Open)
TRV$logreturn <- log(TRV$TRV.Close/TRV$TRV.Open)
UNH$logreturn <- log(UNH$UNH.Close/UNH$UNH.Open)
Chevron$logreturn <- log(Chevron$CVX.Close/Chevron$CVX.Open)
JNJ$logreturn <- log(JNJ$JNJ.Close/JNJ$JNJ.Open)
Walmart$logreturn <- log(Walmart$WMT.Close/Walmart$WMT.Open)
Verizon$logreturn <- log(Verizon$VZ.Close/Verizon$VZ.Open)

DailyLogReturn <- data.frame(index(Boeing), Boeing$logreturn, Nike$logreturn, Disney$logreturn,
                           DWDP$logreturn, MMM$logreturn, CAT$logreturn, PG$logreturn,
                           Visa$logreturn, MCD$logreturn, Apple$logreturn,  TRV$logreturn,
                           UNH$logreturn, Chevron$logreturn, JNJ$logreturn, Walmart$logreturn, Verizon$logreturn)

nameslist <- c("Date","Boeing",	"Nike",	"Disney",	"DWDP",	"3M", "Caterpillar", "PG",	"Visa",	
               "MCD","Apple", "TRV", "UNH", "Chevron", "JNJ", "Walmart", "Verizon")
colnames(DailyLogReturn) <- nameslist



