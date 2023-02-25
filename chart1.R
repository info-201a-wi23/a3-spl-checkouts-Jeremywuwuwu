summary <- read.csv("10Checkouts.csv", stringsAsFactors = F)
library(ggplot2)
library(dplyr)
library(stringr)
library("scales")

sumofcheckouts <- summary %>% 
  group_by(CheckoutYear, Checkouts) %>% 
  summarize(median_checkouts = median(Checkouts, na.rm = T)) %>% 
  mutate(median_checkouts = median(Checkouts, na.rm = T))


ggplot(data = sumofcheckouts) +
  geom_line(mapping = aes(x=CheckoutYear, y = median_checkouts))+
  labs(title = "Median Checkouts", subtitle = "Per Material Type", caption = "the median number of checkouts per material type")+
  scale_y_continuous(labels = label_number_si()) +
  scale_color_brewer(palette = "Set2")


