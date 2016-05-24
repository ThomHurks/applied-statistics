library(sas7bdat)
library(outliers)
library(plyr)

dataset <- read.sas7bdat("/Users/puckmulders/Documents/Studie/Statistics for Big Data - poging 2/assignment1.sas7bdat")

data$OUTCOME <- log(data$OUTCOME)

batch_0 <- dataset[which(dataset$BATCH=="B0"),]
data <- dataset[-c(91),]
data <- dataset[-which(data$BATCH=="B0"),]

batches = unique(data$BATCH);

ttestvalues = list();
variance = list()
vartestvalues = list()

for (batch in batches) {
  variance[batch] <- var(data[data$BATCH==batch,]$OUTCOME)
  Bi = data[data$BATCH == batch,]$OUTCOME
  ttestvalues[batch] <- t.test(batch_0$OUTCOME,Bi,var.equal = FALSE, c("less") )$p.value;
  vartestvalues[batch] <- var.test(batch_0$OUTCOME,Bi)$p.value
}

variance_batch_0 <- var(batch_0$OUTCOME)

qqnorm(batch_0$OUTCOME)
qqline(batch_0$OUTCOME)



bartlett.test(dataset$OUTCOME~dataset$BATCH, data = dataset)

