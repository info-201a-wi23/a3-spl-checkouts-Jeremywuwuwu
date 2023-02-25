summary <- read.csv("10Checkouts.csv", stringsAsFactors = F)

library(ggplot2)
library(dplyr)

#Write a summary paragraph of findings that includes the 5 values calculated from your summary information R script

#What is the average number of checkouts for Digital Books?
avg_Digital <- summary %>% 
  filter(UsageClass == "Digital") %>% 
  summarize(meanDigital = mean(Checkouts)) 
pull(avg_Digital)

#What is the average number of checkouts for Physical Books?
avg_Physical <- summary %>% 
  filter(UsageClass == "Physical") %>% 
  summarize(meanPhysical = mean(Checkouts)) 
pull(avg_Physical)
  
#Which subject is the most popular with the most number of checkouts 
maxsubject <- summary %>% 
  filter(Checkouts == max(Checkouts)) %>% 
pull(Subjects)

#Which subject is the least popular with the least amount of checkouts 
minsubject <- summary %>% 
  filter(Checkouts == min(Checkouts)) %>% 
pull(Subjects)

#How many material types are there?
materialtypes <- summary %>% 
  summarize(x = n_distinct(MaterialType))

#Out of the 32 material types, how many was Horizon and Zinio, and had more than 50 checkouts?
materialtypesabove30 <- summary %>% 
  filter(CheckoutType %in% c("Horizon", "Zinio")) %>% 
  filter(Checkouts > 50) %>% 
  summarize(x = n_distinct(MaterialType)) 
pull(materialtypesabove30)


