
library(tidyverse)

summary <- read_rds("summarySCC_PM25.rds") %>%as_tibble(rownames = "tons") %>% mutate(tons=as.numeric(tons))
source_classification <- read_rds("Source_Classification_Code.rds") %>% as_tibble()
p1 <- summary %>% group_by(year) %>% summarise(tons_total=sum(tons)) %>% ggplot(aes(year,tons_total))+geom_col()
ggsave("plot1.png", plot = p1)

