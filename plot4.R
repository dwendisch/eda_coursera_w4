
library(tidyverse)

summary <- read_rds("summarySCC_PM25.rds") %>%as_tibble(rownames = "tons") %>% mutate(tons=as.numeric(tons))
source_classification <- read_rds("Source_Classification_Code.rds") %>% as_tibble()


comb <- source_classification[str_detect(source_classification$Short.Name, pattern="Comb"),]

p4 <- left_join(comb,summary)%>% group_by(year) %>% summarise(tons_total=sum(tons)) %>% ggplot(aes(year,tons_total))+geom_line() + ggtitle("emissions from coal combustion-related sources")

ggsave("plot4.png", plot = p4)