library(sas7bdat)
library(outliers)
library(plyr)

data <- read.sas7bdat("/Users/puckmulders/Documents/Studie/Statistics for Big Data - poging 2/assignment1.sas7bdat")

data$OUTCOME <- log(data$OUTCOME)

batch_0 <- data[which(data$BATCH=="B0"),]
data <- data[-which(data$BATCH=="B0"),]


batches = unique(data$BATCH);

ttestvalues = list();
for (batch in batches) {
  Bi = data[data$BATCH == batch,]$OUTCOME
  ttestvalues[batch] <- t.test(batch_0$OUTCOME,Bi)$p.value;
}



