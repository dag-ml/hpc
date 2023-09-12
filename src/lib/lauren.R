laur <- paste0(DATA_PATH, "lauren/clean2_assoc_100.csv")
laurenD <- read.csv(laur, header = TRUE, stringsAsFactors = FALSE)

laurenD$chromosome <- NULL

# laurenD$chromosome <- as.factor(laurenD$chromosome)

# 
# laurenD$chromosome <- as.factor(laurenD$chromosome)
# laurenD <- one_hot(as.data.table(laurenD), cols = "chromosome", sparsifyNAs = TRUE,
#                   naCols = FALSE, dropCols = TRUE, dropUnusedLevels = TRUE)

# 
# laurenD$position.b38. <- as.vector(scale(laurenD$position.b38., center = FALSE, scale = max(laurenD$position.b38.)))

dsub_set <- laurenD
title <- "OSDR-366 (Lauren)- All"