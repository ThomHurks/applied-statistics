library(sas7bdat)
library(outliers)
library(plyr)

data <- read.sas7bdat("/Users/puckmulders/Documents/Studie/Statistics for Big Data - poging 2/assignment1.sas7bdat")

data$OUTCOME <- log(data$OUTCOME)
data <- data[-91,]

batches = unique(data$BATCH);
skewness = list();
kurtosis = list();

for(batch in batches) {
  Bi = data[data$BATCH == batch,]$OUTCOME
  print(Bi)
  skewness[batch] <-skewness(Bi);
  kurtosis[batch] <-kurtosis(Bi);
}

print(kurtosis)
print(skewness)