laur <- paste0(DATA_PATH, "lauren/drop_38b_chr_col_assoc_500.csv")
laurenD <- read.csv(laur, header = TRUE, stringsAsFactors = FALSE)


# graph@nodes # Use not graph@nodes
fe <- names(laurenD)[grep("Fe", names(laurenD))]
si <- names(laurenD)[grep("Si", names(laurenD))]
ar <- names(laurenD)[grep("Ar", names(laurenD))]
xray <- names(laurenD)[grep("X.ray", names(laurenD))]


# Testing out PCA multi nodes
# si <- pca(laurenD[,si], nfactors = 1, scale. = TRUE)
# ar <- pca(laurenD[,ar], nfactors = 1, scale. = TRUE)
# fe <- pca(laurenD[,fe], nfactors = 1, scale. = TRUE)
# xray <- pca(laurenD[,xray], nfactors = 1, scale. = TRUE)
# 
# laurenD$si <- as.vector(si$scores)
# laurenD$ar <- as.vector(ar$scores)
# laurenD$fe <- as.vector(fe$scores)
# laurenD$xray <- as.vector(xray$scores)
# remaining_vars <- length(graph@nodes)-(length(fe_col)+ length(si_col) + length(ar_col) + length(xray_col))

ColoredNodes <- buildColorDict(si,ar,fe,xray)




dsub_set <- laurenD
title <- "OSDR-366 (Lauren)- All"

