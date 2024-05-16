# read_in.R

# This script is for reading in the data to be accessible as an R dataset
library(readr)
library(tidyverse)

data <- readr::read_csv("call_center_analysis/data/call_center_data.csv", 
                        col_names = TRUE,
                        col_types = "ictiiiiiiciiddd") %>% 
  filter(!is.na(weekday))

save(data, file = "call_center_analysis/data/the_data.RData")
