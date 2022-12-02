
library(tidyverse)

summary <- read_rds("summarySCC_PM25.rds") %>%as_tibble(rownames = "tons") %>% mutate(tons=as.numeric(tons))
source_classification <- read_rds("Source_Classification_Code.rds") %>% as_tibble()

p5 <- source_classification %>% left_join(summary)%>% 
  group_by(year) %>% 
  filter(EI.Sector %in% str_subset(EI.Sector,fixed('vehicle', ignore_case=TRUE))) %>% 
  filter(fips=="24510") %>% 
  summarise(tons_total=sum(tons)) %>% ggplot(aes(year,tons_total))+geom_line() + ggtitle("emissions from motor vehicle sources changed from 1999–2008 in Baltimore City")

ggsave("plot5.png", plot = p5)