## File       : psid_data.R ####
## Description: ETL of Data -- PSID main file, child supplement, and other

# PSID --------------------------------------------------------------------
# Rectangular ASCII Text Data from Data Center ####
psid.data <- read.csv("C:\\Users\\jmiller\\Downloads\\J194959.txt")

# CDS Map for Rectangular ASCII Text Data ####
cds.map   <- read.csv("C:\\Users\\jmiller\\Downloads\\M194959.txt")

# psidR ####
fam.vars <- c("")
ind.vars <- 
  
build.panel(datadir = NULL, fam.vars = fam.vars, ind.vars = ind.vars, SAScii = FALSE,
            heads.only = FALSE, sample = NULL, design = "balanced",
            verbose = T)





