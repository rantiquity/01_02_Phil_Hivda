#install.packages("gutenbergr")
library(gutenbergr)
library(tidyverse)

works <- gutenberg_works()

# (1)
my_data <- works |> 
  filter(gutenberg_author_id %in% c(65, 410)) |> 
  select(author, title)

# (2)
my_data2 <- my_data |>
  separate(author, into = c("author", "name"), sep = ", ") |> 
  select(-name)

# (3)
my_data3 <- my_data2 |>
  group_by(author) |> 
  summarise(n = n())
