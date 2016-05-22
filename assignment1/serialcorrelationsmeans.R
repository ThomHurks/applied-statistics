library(sas7bdat)
library(outliers)
library(plyr)
library(nortest)
library(goftest)
library(e1071)
library(EnvStats)

dataset <- read.sas7bdat("/Users/puckmulders/Documents/Studie/Statistics for Big Data - poging 2/assignment1.sas7bdat")

data$OUTCOME <- log(data$OUTCOME)

batch_0 <- dataset[which(dataset$BATCH=="B0"),]
data <- dataset[-c(91),]

batches = unique(data$BATCH);

kstestvalues = list();
means = list()
vartestvalues = list()

for (batch in batches) {
  Bi = data[data$BATCH == batch,]$OUTCOME
  means[batch] <- mean(Bi)
  
}

means <- as.numeric(means)
plot(means)
serialCorrelationTest(means)
