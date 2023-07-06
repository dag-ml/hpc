
library(readr)
library(bnlearn)


dubee <- read_csv("DAG_ML/hpc/data/Dubee.csv")

View(dubee)

path_lsds_15 <- file.choose()
data_lsds_15 <- read.csv(path_lsds_15, header = FALSE)


