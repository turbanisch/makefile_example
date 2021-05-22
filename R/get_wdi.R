# handle inputs from Rscript execution
args = commandArgs(trailingOnly=TRUE)

library(tidyverse)

# Gather agricultural methane emissions data from WDI
wdi <- WDI::WDI(indicator = "AG.CON.FERT.ZS") %>% as_tibble()

# save
write_csv(wdi, args[1])

