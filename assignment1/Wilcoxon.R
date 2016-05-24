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

wctestvalues = list();
cvmtestvalues = list()
vartestvalues = list()

for (batch in batches) {
  Bi = data[data$BATCH == batch,]$OUTCOME
  wctestvalues[batch] <- wilcox.test(batch_0$OUTCOME,Bi,paired=FALSE,exact=FALSE)$p.value;
  
}



