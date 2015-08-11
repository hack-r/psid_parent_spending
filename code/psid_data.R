## File       : psid_data.R ####
## Description: ETL of Data 


# CSD I, II, and III Variable List ----------------------------------------
# ER30001: 1968 INTERVIEW NUMBER
# ER30002: PERSON NUMBER 68
# ER31996  SAMPLING ERROR STRATUM                  
# ER31997  SAMPLING ERROR CLUSTER     
# ER33401: 1997 INTERVIEW NUMBER
# ER33402: SEQUENCE NUMBER 97
# ER33403: RELATION TO HEAD 97
# ER33601: 2001 INTERVIEW NUMBER
# ER33602: SEQUENCE NUMBER 01
# ER33603: RELATION TO HEAD 01
# ER33901: 2007 INTERVIEW NUMBER
# ER33902: SEQUENCE NUMBER 07
# ER33903: RELATION TO HEAD 07
# Q1A33: AMT-MEDICAL CARE 97
# Q1E12A: HOW MUCH ALLOWANCE 97
# Q1F12A: HOW MUCH ALLOWANCE 97
# Q1G11C: SCH COSTS PREV YR-AMT 97
# Q1K10: NOT EAT FOR A DAY-NO $$ FOR FOOD 97
# Q1K3A: FOOD RUN OUT BEFORE GET $$ 97
# Q1K3B: NOT ENOUGH $$ FOR MORE FOOD 97
# Q1K7: EAT LESS-NO $$ FOR FOOD 97
# Q1K8: HUNGRY DIDN'T EAT-NO $$ FOR FOOD 97
# Q1K9: LOSE WEIGHT-NO $$ FOR FOOD 97
# Q21A19: AMT -DENTAL CARE 02
# Q21A20_2: AMT - OUTSIDE HH PAY DENTAL CARE 02
# Q21A23: AMT -MEDICAL CARE 02
# Q21A24_2: AMT - OUTSIDE HH PAY MEDICAL CARE 02
# Q21B11A1: CURR SCH COSTS - AMT 02
# Q21B12A1: SCH COSTS PREV YR - AMT 02
# Q21C10H: WKDAY:EXTRA-CURRIC ACTIVITIES 02
# Q21C15A: WKDAY: COST OF CARE - AMT 02
# Q21C15B: WKDAY: COST OF CARE - UNIT 02
# Q21C21A: WKDAY 2: COST OF CARE - AMT 02
# Q21C21B: WKDAY 2: COST OF CARE - UNIT 02
# Q21C22H: WKEND:EXT-CURRIC ACTIVITIES 02
# Q21C27A: WKEND: COST OF CARE - AMT 02
# Q21C27B: WKEND: COST OF CARE - UNIT 02
# Q21C28H: SUMMER:EXT-CURRIC ACTIVITIES 02
# Q21C33A: SUMMER: COST OF CARE - AMT 02
# Q21C33B: SUMMER: COST OF CARE - UNIT 02
# Q21C39A: SUMMER 2: COST OF CARE - AMT 02
# Q21C39B: SUMMER 2: COST OF CARE - UNIT 02
# Q21C7A_1: COSTS OF 1ST CARE PRE K - AMT 02
# Q21C7A_2: COSTS OF 2ND CARE PRE K - AMT 02
# Q21C7A_3: COSTS OF 3RD CARE PRE K - AMT 02
# Q21C7A_4: COSTS OF 4TH CARE PRE K - AMT 02
# Q21C7B_1: COSTS OF 1ST CARE PRE K - UNIT 02
# Q21C7B_2: COSTS OF 2ND CARE PRE K - UNIT 02
# Q21C7B_3: COSTS OF 3RD CARE PRE K - UNIT 02
# Q21C7B_4: COSTS OF 4TH CARE PRE K - UNIT 02
# Q21G10C: COST OF COMMUNITY GRPS 6-9 YRS 02
# Q21G21A1: ALLOWANCE - AMT 6-9 YRS 02
# Q21G21A2: ALLOWANCE - PER 6-9 YRS 02
# Q21G5D: COST OF TUTORING 6-9 YRS 02
# Q21H22B: ALLOWANCE - AMT 10+ YRS 02
# Q21H22C: ALLOWANCE - PER 10+ YRS 02
# Q21H23A1: AMT SPENT ON TOYS 02
# Q21H23B1: AMT SPENT OF VACATION 02
# Q21H23C1: AMT SPENT OF SCH SUPPLIES 02
# Q21H23D1: AMT SPENT ON CLOTHES 02
# Q21H23E1: AMT SPENT ON CAR INSUR 02
# Q21H23F1: AMT SPENT ON CAR PAYMTS 02
# Q21H23G1: AMT SPENT ON CAR MAINTENANCE 02
# Q21H23H1: AMT SPENT ON FOOD 02
# Q21H24J: ABSENT DAD SPEND ON ALLOWANCE 02
# Q21H24O: ABSENT DAD SPEND ON EXTRA-CURRICULAR 02 
# Q21H25J: ABSENT MOM SPEND ON ALLOWANCE 02
# Q21H25O: ABSENT DAD SPEND ON EXTRA-CURRICULAR 02 
# Q21H5C: COST OF TUTORING 10+ YRS 02
# Q21H8B: COST OF COMMUNITY GRPS 10+ YRS 02
# Q23L2: ALLOWANCE: AMT 02
# Q23L2A: ALLOWANCE: UNIT 02
# Q23L4A5: PAY CLOTHES 02
# Q2A51: $$ SPENT ON MED CARE & INSUR 97
# Q31B11A1: CURR SCHOOL COSTS - AMT 07
# Q31B11A2: CURR SCHOOL COSTS - PER 07
# Q31B12A1: PREV YR SCHOOL COSTS - AMT 07
# Q31B12A2: PREV YR SCHOOL COSTS - PER 07
# Q31C15A: WKDAY: COST OF CARE - AMT 07
# Q31C15B: WKDAY: COST OF CARE - UNIT 07
# Q31C21A: CWKDAY 2: COST OF CARE - AMT 07
# Q31C21B: WKDAY 2: COST OF CARE - UNIT 07
# Q31C27A: WKEND: COST OF CARE - AMT 07
# Q31C27B: WKEND: COST OF CARE - UNIT 07
# Q31C33A: SUMMER: COST OF CARE - AMT 07
# Q31C33B: SUMMER: COST OF CARE - UNIT 07
# Q31C39A: SUMMER 2: COST OF CARE - AMT 07
# Q31C39B: SUMMER 2: COST OF CARE - UNIT 07
# Q31H22B: ALLOWANCE - AMT 10+ YRS 07
# Q31H22C: ALLOWANCE - PER 10+ YRS 07
# Q31H23A1: AMT SPENT ON TOYS 07
# Q31H23B1: AMT SPENT ON VACATION 07
# Q31H23C1: AMT SPENT ON SCHOOL SUPPLIES 07
# Q31H23D1: AMT SPENT ON CLOTHES 07
# Q31H23E1: AMT SPENT ON CAR INSURANCE 07
# Q31H23F1: AMT SPENT ON CAR PAYMENTS 07
# Q31H23G1: AMT SPENT ON CAR MAINTENANCE 07
# Q31H5C: COST OF TUTORING 10+ YRS 07
# Q31H8B: COST OF COMM GRPS 10+ YRS 07
# Q32JA34: CHILDREN HEALTH OUT OF POCKET COSTS 07
# Q33L2: ALLOWANCE: AMT 07
# Q33L2A: ALLOWANCE: UNIT 07
# Q33L3F: PAST WK $ FOOD/DRINKS AT SCHOOL 07
# Q33L3G: PAST WK $ FAST FOOD/RESTAURANTS 07
# Q33L3H: PAST WK $ ALL OTH FOOD 07


# CDS I, II, and III Data -------------------------------------------------
# Read in custom PSID Excel Spreadsheet
psid.data     <- read.csv("J195269.csv") #CSV saved from Excel version for speed

# Read in corresponding variable labels
#CSV cleaned and saved from .txt version:
psid.labels           <- read.csv("J195269_labels.csv", header = F) 
colnames(psid.labels) <- c("varname", "desc")
psid.labels[, 1]      <- gsub(";", "", psid.labels[, 1])
psid.labels[, 2]      <- gsub(";", "", psid.labels[, 2])
psid.labels[, 2]      <- gsub("“", "", psid.labels[, 2])
psid.labels[, 2]      <- gsub("1968", "1968 ", psid.labels[, 2])
psid.labels[, 2]      <- gsub("1997", "1997 ", psid.labels[, 2])
psid.labels[, 2]      <- gsub("2002", "2002 ", psid.labels[, 2])
psid.labels[, 2]      <- gsub("2007", "2007 ", psid.labels[, 2])
psid.labels[, 2]      <- gsub("68", " 68", psid.labels[, 2])
psid.labels[, 2]      <- gsub("97", " 97", psid.labels[, 2])
psid.labels[, 2]      <- gsub("02", " 02", psid.labels[, 2])
psid.labels[, 2]      <- gsub("07", " 07", psid.labels[, 2])
psid.labels[, 2]      <- gsub("19 68", "1968", psid.labels[, 2])
psid.labels[, 2]      <- gsub("19 97", "1997", psid.labels[, 2])
psid.labels[, 2]      <- gsub("200 2", "2002", psid.labels[, 2])
psid.labels[, 2]      <- gsub("20 07", "2007", psid.labels[, 2])
psid.labels[, 1]      <- trim(psid.labels[, 1])
psid.labels[, 2]      <- trim(psid.labels[, 2])

# Read in CDS Map: Excel Spreadsheet
cdsMap.data   <- read.csv("M195269.csv", header = T) #CSV saved from .xlsx

# Read in CDS Map: Variable Labels
#CSV cleaned and saved from .txt version:
cdsMap.labels <- read.csv("M195269_labels.csv", header = F) 
colnames(cdsMap.labels) <- c("varname", "desc")
cdsMap.labels[, 1]      <- gsub(";", "", cdsMap.labels[, 1])
cdsMap.labels[, 2]      <- gsub(";", "", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("“", "", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("1968", "1968 ", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("1997", "1997 ", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("2002", "2002 ", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("2007", "2007 ", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("68", " 68", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("97", " 97", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("02", " 02", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("07", " 07", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("19 68", "1968", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("19 97", "1997", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("200 2", "2002", cdsMap.labels[, 2])
cdsMap.labels[, 2]      <- gsub("20 07", "2007", cdsMap.labels[, 2])
cdsMap.labels[, 1]      <- trim(cdsMap.labels[, 1])
cdsMap.labels[, 2]      <- trim(cdsMap.labels[, 2])

# PSID Individual and Family Data -----------------------------------------
# Using years 1997, 2003, 2007
# CSD was conducted in 2002, but indiv. and family surveys were not. 2002 and
#  2003 surveys were released jointly.


