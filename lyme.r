# Testing file paths
data = read.csv("C:/Users/19796/Documents/Git/leeasahanders/lyme/datases/LD-Case-Counts-by-County-00-19.csv")
data = read.csv("~/datases/LD-Case-Counts-by-County-00-19.csv")
data = read.csv("LD-Case-Counts-by-County-00-19.csv")

folder <- "C:/Users/19796/Documents/Git/leeasahanders/lyme/datasets"  
file_list <- list.files(path=folder, pattern="*.csv")
print(file_list)