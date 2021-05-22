# handle inputs from Rscript execution
args = commandArgs(trailingOnly=TRUE)

library(tidyverse)

oecd <- read_csv(args[1], col_types = cols(
  iso3 = col_character(),
  oecd_name = col_character(),
  date = col_date(format = "")
))

wdi <- read_csv(args[2], col_types = cols(
  iso3 = col_character(),
  oecd_name = col_character(),
  date = col_date(format = "")
))

final_dataset <- oecd %>% left_join(wdi, by = "iso3")

write_csv(final_dataset, args[3])