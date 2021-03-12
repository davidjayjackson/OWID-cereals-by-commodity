## Cereals  Consumption per Capita (Kilocalories/person/year)

### BEgin Code

library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)
library(readr)
library(flextable)
library(dlookr)

### Table of Summary Statistics
cereals <- read.csv("./DATA/per-capita-consumption-of-cereals-by-commodity-type-daily-kilocalories.csv") 
colnames(cereals) <- c("Country","Code","Year","Wheat","Rice","Barley","Maize","Rye","Oats","Sorghum")
dlookr::diagnose_numeric(cereals) %>% flextable() 

### Insert first plot here


world_longer <- cereals %>% filter(Country =="World") %>% select(-Code) %>%
  pivot_longer(cols = Wheat:Sorghum)

### Histograms by Cereals Type

ggplot(world_longer) + geom_histogram(aes(x=value),bins=10) +
  facet_wrap(~name) + labs(title="Count of Calories by Cereals")

### Second PLot goes here


### Boxplots by Cereals Type

ggplot(world_longer) + geom_boxplot(aes(y=value)) +
  facet_wrap(~name)

