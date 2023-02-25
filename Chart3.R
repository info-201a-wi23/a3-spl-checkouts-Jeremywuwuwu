summary <- read.csv("10Checkouts.csv", stringsAsFactors = F)
library(ggplot2)
library(dplyr)
library(stringr)
library("scales")

Comedy <- summary %>% 
  group_by(Subjects) %>% 
  filter(str_detect(Subjects, "Comedy")) %>% 
  filter(Publisher %in% c("Warner Home Video,", "Sony Pictures Home Entertainment,"))


ggplot(data = Comedy) +
  geom_col(aes(x = Publisher, y = Checkouts, fill = Publisher))+
  labs(title = "Sony Pictures or Warner Homes?", subtitle = "The total number of checkouts for each publisher", caption = "visualization of how the two powerhouse publishers differ in terms of Checkouts")+
  scale_y_continuous(labels = label_number_si()) 
