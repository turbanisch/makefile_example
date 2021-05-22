# handle inputs from Rscript execution
args = commandArgs(trailingOnly=TRUE)

library(tidyverse)
library(rvest)

url <- "https://web.archive.org/web/20201127165619/https://www.oecd.org/about/document/list-oecd-member-countries.htm"

# download
oecd <- read_html(url) %>% 
  html_node(xpath = "//*[@id=\"webEditContent\"]/table[2]") %>% 
  html_table(fill = TRUE) %>% 
  as_tibble() %>% 
  select(oecd_name = X2, oecd_date = X3) %>% 
  filter(str_detect(oecd_date, "[0-9]"))

# save
write_csv(oecd, args[1])