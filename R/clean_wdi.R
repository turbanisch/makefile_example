# handle inputs from Rscript execution
args = commandArgs(trailingOnly=TRUE)

library(tidyverse)
library(countrycode)

# read data
wdi <- read_csv(args[1])

# Rename variable
wdi <- wdi %>%
  dplyr::rename(fert_consumption = AG.CON.FERT.ZS)

# add iso3 codes
wdi <- wdi %>% 
  mutate(iso3c = countrycode(iso2c, "iso2c", "iso3c"))

# save
write_csv(wdi, args[2])
