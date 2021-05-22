# handle inputs from Rscript execution
args = commandArgs(trailingOnly=TRUE)

library(tidyverse)

# read data
oecd <- read_csv(args[1], col_types = cols(
  oecd_name = col_character(),
  oecd_date = col_character(),
  iso3c = col_character()
))

wdi <- read_csv(args[2], col_types = cols(
  iso2c = col_character(),
  country = col_character(),
  fert_consumption = col_double(),
  year = col_integer(),
  iso3c = col_character()
))

# merge
final_dataset <- inner_join(wdi, oecd, by = "iso3c")

# save
write_csv(final_dataset, args[3])