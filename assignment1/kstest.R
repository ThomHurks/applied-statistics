library(sas7bdat)
library(outliers)
library(plyr)
library(nortest)
library(goftest)
library(e1071)

dataset <- read.sas7bdat("/Users/puckmulders/Documents/Studie/Statistics for Big Data - poging 2/assignment1.sas7bdat")


batch_0 <- dataset[which(dataset$BATCH=="B0"),]
data <- dataset[-c(91),]
data <- dataset[-which(data$BATCH=="B0"),]

batches = unique(data$BATCH);

kstestvalues = list();
cvmtestvalues = list()
vartestvalues = list()

for (batch in batches) {
  Bi = data[data$BATCH == batch,]$OUTCOME
  kstestvalues[batch] <- ks.test(batch_0$OUTCOME,Bi,var.equal = FALSE)$p.value;
  
}

