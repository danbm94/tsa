##### plts
library(tidyverse)
data <- read.csv("Dataset/API_EN.ATM.CO2E.PC_DS2_en_csv_v2_2708833.csv",skip = 3, header = T)
data <- data[,-c(2:4)]
ger <- data[56,]
ger <- pivot_longer(data = ger, cols = !1,names_to = "Germany" )
series <- ts(data = ger$value)
plot(series,type="l") 
eur <- data[74,]
eur <- pivot_longer(eur,cols = !1)
eur <- eur[-62,]
eur$name <- gsub(pattern = "X",replacement = "", eur$name)
eur$date <- as.Date(eur$name,format = "%Y")
ggplot(data=eur)+geom_line(aes(x=date, y=value)) + 
  theme_minimal()
eur <- ts(data=eur$value)
log_eur <- ts(data=log(eur$value))
plot(eur, type='l')

log_eur <- log(eur$value)
ts_l_eur <- ts(log_eur)
plot(ts_l_eur, type='l')
max(ts_l_eur,na.rm = TRUE)
