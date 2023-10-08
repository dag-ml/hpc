laur <- paste0(DATA_PATH, "lauren/drop_38b_chr_col_assoc_500.csv")
laurenD <- read.csv(laur, header = TRUE, stringsAsFactors = FALSE)

# Color Nodes
fe <- names(laurenD)[grep("Fe", names(laurenD))]
si <- names(laurenD)[grep("Si", names(laurenD))]
ar <- names(laurenD)[grep("Ar", names(laurenD))]
xray <- names(laurenD)[grep("X.ray", names(laurenD))]


ColoredNodes <- buildColorDict(si,ar,fe,xray)
dsub_set <- laurenD
title <- "OSD-366 (Lauren)"

