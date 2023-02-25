summary <- read.csv("10Checkouts.csv", stringsAsFactors = F)
library(ggplot2)
library(dplyr)
library(stringr)
library(scales)

physical_publication <- summary %>% 
  filter(PublicationYear %in% c("2020", "2021", "2022")) %>% 
  filter(UsageClass == "Physical") %>% 
  arrange(desc(Checkouts)) 
  
ggplot(data = physical_publication)+
  geom_line(mapping = aes(x = PublicationYear, y = Checkouts, color = Checkouts)) +
  facet_wrap(~PublicationYear)+
  labs(title = "Publication Year vs Checkouts", subtitle = "The number of checkouts for all Physical Books between 2020, 2021, and 2022")
  
