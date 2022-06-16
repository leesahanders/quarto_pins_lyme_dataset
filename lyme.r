# Testing file paths
data = read.csv("C:/Users/19796/Documents/Git/leeasahanders/lyme/datases/LD-Case-Counts-by-County-00-19.csv")
data = read.csv("~/datases/LD-Case-Counts-by-County-00-19.csv")
data = read.csv("LD-Case-Counts-by-County-00-19.csv")

folder <- "C:/Users/19796/Documents/Git/leeasahanders/lyme/datasets"  
file_list <- list.files(path=folder, pattern="*.csv")
print(file_list)



if(0){ # we only need to do this once
  library(dplyr)
  library(tidyverse)
  library(stringr)
  library(readr)
  library(pins)
  library(rsconnect)
  # What do I need for ojs_define to work? 
  
  # Pull in the data
  lyme_raw = read.csv("LD-Case-Counts-by-County-00-19.csv")
  
  # Aggregate 
  lyme = lyme_raw %>% 
    pivot_longer(cols = starts_with("Cases"), names_to = "Name", values_to = "Values") %>%
    mutate(date = as.Date(str_replace(Name, "Cases", ""))) %>% 
    group_by(Stname, date) %>% 
    summarize(n = n(), total_cases = sum(Values))
    
    #write.csv(lyme, "lyme_data.csv")
    
    #lyme = read.csv("lyme_data.csv")
  
  # Not sure why this function doesn't work for me and I don't find any documentation
  #ojs_define(data = lyme)
  
  # Let's pin it to our server at 3.132.233.58
  Sys.setenv(CONNECT_SERVER="http://3.132.233.58/")
  Sys.setenv(CONNECT_API_KEY="qGKRdyGTNdHjYMUJVd17uWwVHVde55q9")
  
  board <- board_rsconnect(auth = "envvar")
  board %>% pin_write(lyme, "lyme_dataset", type = "rds")
  
  # Let's read it back 
  Sys.setenv(CONNECT_SERVER="http://3.132.233.58/")
  Sys.setenv(CONNECT_API_KEY="qGKRdyGTNdHjYMUJVd17uWwVHVde55q9")
  board <- board_rsconnect(auth = "envvar")
  board %>% pin_read("testadmin/lyme_dataset")
  
}

