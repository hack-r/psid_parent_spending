## File       : psid_functions.R ####
## Description: Functions, libraries, and options 

# Set Options -------------------------------------------------------------
options("scipen"=100, "digits"=4)
setwd("data")

# Load Libraries ----------------------------------------------------------
if (!require("pacman")) install.packages("pacman")
pacman::p_load(AER, bestglm, caret, devtools, faraway, ggplot2, 
               gridExtra, Matching, plyr, pls, psidR, quantreg, rattle,
               RDSTK, reshape, ROCR, RODBC, RRF, sqldf, xlsx, xtable)


# HPC ---------------------------------------------------------------------
hpc <- T # True if you wish to invoke High Performance Computing
if (hpc){
  require(parallel)
  require(doParallel)
  cores_2_use <- detectCores() / 2
  cl          <- makeCluster(cores_2_use)
  clusterSetRNGStream(cl, 9956)
  registerDoParallel(cl, cores_2_use)
}

# Custom Functions --------------------------------------------------------
predictMNL <- function(model, newdata) { 
  # Probabilistic predictions for neural net models
  if (is.element("nnet",class(model))) {
    # Calculate the individual and cumulative probabilities
    probs <- predict(model,newdata,"probs")
    cum.probs <- t(apply(probs,1,cumsum))
    
    # Draw random values
    vals <- runif(nrow(newdata))
    
    # Join cumulative probabilities and random draws
    tmp <- cbind(cum.probs,vals)
    
    # For each row, get choice index.
    k <- ncol(probs)
    ids <- 1 + apply(tmp,1,function(x) length(which(x[1:k] < x[k+1])))
    
    # Return the values
    return(ids)
  }
}
random.imp <- function (a){
  # Simple random replacement for development use only
  missing          <- is.na(a)
  n.missing        <- sum(missing)
  a.obs            <- a[!missing]
  imputed          <- a
  imputed[missing] <- sample (a.obs, n.missing, replace=TRUE)
  return (imputed)
}
sat<-function(x,y,ll=0,imp=y){ 
  # Saturation function
  x[is.na(x)]<-imp
  x[x>y]<-y
  x[x<ll]<-ll
  return(x)
}
trim <- function(x) {
  gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)
}
equivScale <- function(adults, children){
  ## Family-shared Spending Equivalence Scale for 1 Person 
  ## Recommended by Citro and Michael (1995)
  # adult = # adults, children = # children
  es <- (adults + (children * .7))^.7
  return(es)
}