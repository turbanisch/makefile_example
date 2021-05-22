library(tidyverse)

oecd <- read_csv("data_intermediate/oecd.csv", col_types = cols(
  iso3 = col_character(),
  oecd_name = col_character(),
  date = col_date(format = "")
))

wdi <- read_csv("data_intermediate/wdi.csv", col_types = cols(
  iso3 = col_character(),
  oecd_name = col_character(),
  date = col_date(format = "")
))

final_dataset <- oecd %>% left_join(wdi, by = "iso3")

write_csv(final_dataset, "data_final/merged_dataset.csv")