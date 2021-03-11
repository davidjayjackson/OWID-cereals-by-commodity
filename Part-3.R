library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)
library(readr)
library(flextable)
library(dlookr)

cereals <- read.csv("./DATA/per-capita-consumption-of-cereals-by-commodity-type-daily-kilocalories.csv") 
colnames(cereals) <- c("Country","Code","Year","Wheat","Rice","Barley","Maize","Rye","Oats","Sorghum")
dlookr::diagnose_numeric(cereals) %>% flextable() 

world_longer <- cereals %>% filter(Country =="World") %>% select(-Code) %>%
  pivot_longer(cols = Wheat:Sorghum)

ggplot(world_longer) + geom_histogram(aes(x=value),bins=10) +
  facet_wrap(~name)
