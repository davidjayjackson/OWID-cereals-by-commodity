##  USA Cereals  Consumption By Type (Kilocalories/person/year) [Part 3]

### BEgin Code

library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)
library(readr)
library(flextable)
library(dlookr)
rm(list=ls())

### Table of Summary Statistics
cereals <- read.csv("./DATA/per-capita-consumption-of-cereals-by-commodity-type-daily-kilocalories.csv") 
colnames(cereals) <- c("Country","Code","Year","Wheat","Rice","Barley","Maize","Rye","Oats","Sorghum")

us_cereals <- cereals %>% filter(Code == "USA") 

us_longer <- us_cereals %>% pivot_longer(cols = Wheat:Sorghum,names_to ="Cereals",values_to ="Calories" )
  
us_cereals %>% select(-Country,-Code, -Year) %>% dlookr::diagnose_numeric() %>% flextable() 

us_longer %>% select(-Country,-Code,-Year) %>% dlookr::diagnose_category() %>% flextable() 


### Plot of US Cereal Consumption by Kilocalories by Cereals

ggplot(us_longer) + geom_line(aes(x=Year,y=Calories,col=Cereals)) +
  labs(title = "US Cereals Consumption By Cereals",y="Kilocalories")
