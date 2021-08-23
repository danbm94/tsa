##### plts
library(tidyverse)
data <- read.csv("Dataset/API_EN.ATM.CO2E.PC_DS2_en_csv_v2_2708833.csv",skip = 3, header = T)
data <- data[,-c(2:4)]
#Europe
eur <- data[74,]
eur <- pivot_longer(eur,cols = !1)
eur <- eur[-62,]
eur$name <- gsub(pattern = "X",replacement = "", eur$name)
eur$date <- as.Date(eur$name,format = "%Y")
ggplot(data=eur)+geom_line(aes(x=date, y=value)) + 
  theme_classic() +
  xlab(label = "Year")+
  ylab("CO2 Emissions (metric tons per capita)")+
  ggtitle(label = "CO2 Emissions in the European Union", subtitle = "in metric tons per capita from 1960 to 2020")


# US
us <- data[data$Country.Name=="United States",] %>% 
  pivot_longer(cols = !c(1:4)) %>% 
  select(name, value) %>% 
  na.omit()
us$name <- gsub(pattern="X", replacement = "", us$name) 
us$date <- as.Date(us$name,format = "%Y")

ggplot(data=us)+ geom_line(aes(x=date,y= value))+
  theme_classic() +
  xlab(label = "Year")+
  ylab("CO2 Emissions (metric tons per capita)")+
  ggtitle(label = "CO2 Emissions in the United States", subtitle = "in metric tons per capita from 1960 to 2018")


# China

chi <- data[data$Country.Name=="China",] %>% 
  pivot_longer(cols = !c(1:4)) %>% 
  select(name, value) %>% 
  na.omit()
chi$name <- gsub(pattern="X", replacement = "", chi$name) 
chi$date <- as.Date(chi$name,format = "%Y")

ggplot(data=chi)+ geom_line(aes(x=date,y= value))+
  theme_classic() +
  xlab(label = "Year")+
  ylab("CO2 Emissions (metric tons per capita)")+
  ggtitle(label = "CO2 Emissions in China", subtitle = "in metric tons per capita from 1960 to 2018")


# Brazil
br <- data[data$Country.Name=="Brazil",] %>% 
  pivot_longer(cols = !c(1:4)) %>% 
  select(name, value) %>% 
  na.omit()
br$name <- gsub(pattern="X", replacement = "", br$name) 
br$date <- as.Date(br$name,format = "%Y")

ggplot(data=br)+ geom_line(aes(x=date,y= value))+
  theme_classic() +
  xlab(label = "Year")+
  ylab("CO2 Emissions (metric tons per capita)")+
  ggtitle(label = "CO2 Emissions in Brazil", subtitle = "in metric tons per capita from 1960 to 2018")


# India

ind <- data[data$Country.Name=="India",] %>% 
  pivot_longer(cols = !c(1:4)) %>% 
  select(name, value) %>% 
  na.omit()
ind$name <- gsub(pattern="X", replacement = "", ind$name) 
ind$date <- as.Date(ind$name,format = "%Y")

ggplot(data=ind)+ geom_line(aes(x=date,y= value))+
  theme_classic() +
  xlab(label = "Year")+
  ylab("CO2 Emissions (metric tons per capita)")+
  ggtitle(label = "CO2 Emissions in India", subtitle = "in metric tons per capita from 1960 to 2018")


## All combined

ggplot()+
  geom_line(aes(x=date, y=value, colour= "European Union"), data=eur, col="darkblue")+
  geom_line(aes(x=date, y=value), data=us, col="blue")+
  geom_line(aes(x=date, y=value), data=chi, col="red")+
  geom_line(aes(x=date, y=value), data=br, col="green")+
  geom_line(aes(x=date, y=value), data=ind, col="orange")+
  theme_classic() +
  xlab(label = "Year")+
  ylab("CO2 Emissions (metric tons per capita)")+
  ggtitle(label = "CO2 Emissions", subtitle = "in metric tons per capita from 1960 to 2018")


  
  
  
  
  
  
  
