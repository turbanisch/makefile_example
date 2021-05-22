# handle inputs from Rscript execution
args = commandArgs(trailingOnly=TRUE)

library(tidyverse)
library(countrycode)

# read data
oecd <- read_csv(args[1])

# add iso3 codes
oecd <- oecd %>% 
  mutate(iso3c = countrycode(oecd_name, "country.name.en", "iso3c"))

# save
write_csv(oecd, args[2])
