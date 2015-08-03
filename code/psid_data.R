## File       : psid_data.R ####
## Description: ETL of Data -- PSID main file, child supplement, and other

# PSID --------------------------------------------------------------------
# Rectangular ASCII Text Data from Data Center ####
# To do: move data file to public Dropbox or Github repo and provide link
l <- list.files(getwd())
if (length(l)==0) stop('there is something wrong with the data directory. please check path')
for (i in 1:length(l)) {
  if (tail(strsplit(l[i],"\\.")[[1]],1) == "dta") {ftype   <- "stata"; break}
  if (tail(strsplit(l[i],"\\.")[[1]],1) == "rda") {ftype   <- "Rdata"; break}
  if (tail(strsplit(l[i],"\\.")[[1]],1) == "RData") {ftype <- "Rdata"; break}
  if (tail(strsplit(l[i],"\\.")[[1]],1) == "csv") {ftype   <- "csv"; break}
}
if (!(exists("ftype"))) stop("No .dta, .rda, .RData or .csv files found in directory")
psid.data <- read.csv("C:\\Users\\jmiller\\Downloads\\J194959.txt")

# CDS Map for Rectangular ASCII Text Data ####
cds.map   <- read.csv("C:\\Users\\jmiller\\Downloads\\M194959.txt")

# psidR ####
fam.vars <- c("")
ind.vars <- 
  
build.panel(datadir = NULL, fam.vars = fam.vars, ind.vars = ind.vars, SAScii = FALSE,
            heads.only = FALSE, sample = NULL, design = "balanced",
            verbose = T)





