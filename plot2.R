library(tidyverse)

summary <- read_rds("summarySCC_PM25.rds") %>%as_tibble(rownames = "tons") %>% mutate(tons=as.numeric(tons))
source_classification <- read_rds("Source_Classification_Code.rds") %>% as_tibble()



p2 <- summary %>% filter(fips=="24510") %>% group_by(year) %>% summarise(tons_total=sum(tons)) %>% ggplot(aes(year,tons_total))+geom_col() 
ggsave("plot2.png", plot = p2)+ggtitle("Baltimore")