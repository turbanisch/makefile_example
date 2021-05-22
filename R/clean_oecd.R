# handle inputs from Rscript execution
args = commandArgs(trailingOnly=TRUE)

library(tidyverse)
library(countrycode)

# import data
oecd <- read_csv(args[1], col_types = cols(
  oecd_name = col_character(),
  oecd_date = col_character()
))

# clean
oecd <- oecd %>% 
  mutate(iso3 = countrycode(oecd_name, "country.name.en", "iso3c"),
         date = lubridate::dmy(oecd_date)) %>% 
  select(!oecd_date) %>% 
  relocate(iso3)

# save
write_csv(oecd, args[2])
