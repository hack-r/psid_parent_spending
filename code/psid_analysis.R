## File       : psid_analysis.R ####
## Description: Master analysis file

# Descriptive Statistics --------------------------------------------------
# Q: How many unique family units are in the data?
# A: 1409
length(unique(psid.data$ER30001))   # 1409
length(unique(cdsMap.data$ER30001)) # 1407

# Q: What is the average number of children born to a PSID adult?
# A: 1.488
mean(psid.data$ER32022[!(psid.data$ER32022 %in% c(98,99))]) # 1.488

# Q: What is the most common year of birth for 1st born children in the data?
# A: 1990
mean(psid.data$ER32024[!(psid.data$ER32024 %in% c(9999))])   # 1990
median(psid.data$ER32024[!(psid.data$ER32024 %in% c(9999))]) # 1990

# Q: What is the most common year of birth for last born children in the data?
# A: 1995
mean(psid.data$ER32026[!(psid.data$ER32026 %in% c(9999))])   # 1995
median(psid.data$ER32026[!(psid.data$ER32026 %in% c(9999))]) # 1995
