library(tidyverse)
library(reactable)

nyt_titles <- readr::read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-05-10/nyt_titles.tsv')
nyt_full <- readr::read_tsv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-05-10/nyt_full.tsv')


# EDA ---------------------------------------------------------------------

summary(nyt_titles$total_weeks)

ggplot(nyt_titles, aes(total_weeks)) + geom_histogram(bins = 40)

titles_summary <- nyt_titles %>% 
  group_by(author) %>% 
  summarise(
    books_ranked = n(),
    avg_weeks = round(mean(total_weeks), 1)
    ) %>% 
  arrange(desc(books_ranked)) %>% 
  head(25)



# Clean Viz ---------------------------------------------------------------



