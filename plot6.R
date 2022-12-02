
library(tidyverse)

summary <- read_rds("summarySCC_PM25.rds") %>%as_tibble(rownames = "tons") %>% mutate(tons=as.numeric(tons))
source_classification <- read_rds("Source_Classification_Code.rds") %>% as_tibble()



p6 <- source_classification %>% left_join(summary)%>% 
  filter(EI.Sector %in% str_subset(EI.Sector,fixed('vehicle', ignore_case=TRUE))) %>% 
  filter(fips%in% c("24510","06037")) %>% mutate(city=ifelse(fips=="24510","Baltimore","L.A.")) %>%  group_by(year,city) %>% 
  summarise(tons_total=sum(tons)) %>% ggplot(aes(year,tons_total, color=city))+geom_line() + ggtitle("emissions from motor vehicle sources changed from 1999–2008 in Baltimore City and LA")


ggsave("plot6.png", plot = p6)