# Ko

# Load Dataset
pko1 <- paste0(DATA_PATH, "ko/LSDS-40_Bone_Biomechanical_LDSD-40_biomechanical_KoTRANSFORMED.csv")
pko3 <- paste0(DATA_PATH, "ko/LSDS-40_microCT_LSDS-40_microCT_KoTRANSFORMED.csv")
pko4 <- paste0(DATA_PATH, "ko/LSDS-41_peripheral_quantitative_computed_tomography_pQCT_LSDS-41_pQCT_KoTRANSFORMED.csv")

nastring <- c("           *","epiphysis broken")    # Things we want R to read as NA
ko1 <- read.csv(pko1, header=T, stringsAsFactors=F, na.strings=nastring)
ko3 <- read.csv(pko3, header=T, stringsAsFactors=F, na.strings=nastring)
ko4 <- read.csv(pko4, header=T, stringsAsFactors=F, skip=1)

# Subest to needed columns/rows
ko1 <- ko1[,c(1,3:4,8:10)]
ko3 <- ko3[,c(1,10,13:17)]
ko4 <- ko4[,c(1,4:7)]

# Rename columns
names(ko1) <- c("ID","PWB","duration","stiffness","load.max","load.fail")
names(ko3) <- c("ID","BVTV","trab.num","trab.thick","trab.sep","BMD","cort.thick")
names(ko4) <- c("ID","BMD0","BMD1","BMD2","BMD4")

# create indicators of source file
ko1$k1 <- 1
ko3$k3 <- 1
ko4$k4 <- 1

# Merge files
ko13 <- merge(ko1,ko3,by="ID",all=T)
ko134 <- merge(ko13,ko4,by="ID",all=T) 

# Fill in missing indicators with 0
ko134$k1[is.na(ko134$k1)] <-0
ko134$k3[is.na(ko134$k3)] <-0
ko134$k4[is.na(ko134$k4)] <-0
#-------------------------------------------------------------------------------

# Keep only needed rows
ko <- ko134[!(is.na(ko134$stiffness)),]
ko$unload <- 0*(ko$PWB=='PWB100')+30*(ko$PWB=="PWB70")+60*(ko$PWB=="PWB40")+80*(ko$PWB =="PWB20")
ko$dur <- 7*(ko$duration=='1wk')+14*(ko$duration=='2wk')+28*(ko$duration=='4wk')
ko <- ko[,c('BVTV','BMD','trab.sep','trab.num','load.max','load.fail','unload','dur')]


# Transform to numeric
ko$BVTV <- as.numeric(as.character(ko$BVTV))
ko$BMD <- as.numeric(as.character(ko$BMD))
ko$trab.sep <- as.numeric(as.character(ko$trab.sep))
ko$trab.num <- as.numeric(as.character(ko$trab.num))

#-------------------------------------------------------------------------------

# Keep only 2week or 4week duration animals
ko <- ko[ko$dur == 14 | ko$dur == 28, ]

# Keep only 0%, 60%, and 80% unloaded animals
ko <- ko[ko$unload %in% c(0, 80), ]

#-------------------------------------------------------------------------------
# Rename columns and remove dur
ko$dur <- NULL
names(ko) <- c("BVTV","BMD","TbSp","TbN","MaxLoad","FailLoad","unload")

# Color Nodes
mass <- c("BVTV","BMD")
trab <- c("TbSp","TbN")
stren<- c("FailLoad","MaxLoad")


# Global Variable declarations
ColoredNodes <- buildColorDict(mass,trab,stren)
dsub_set <- ko
title <- "Ko - Au naturel"

# Clean up unused variables
rm(list=c("ko1","ko13","ko134","ko3","ko4","pko1","pko3","pko4","nastring","mass","trab","stren"))
