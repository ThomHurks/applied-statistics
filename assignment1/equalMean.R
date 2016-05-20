# T-test

# Most batches do not have equal variances with B0,
# so the T-test with unequal variances is used

dataset = read.sas7bdat("assignment1.sas7bdat");
batches = unique(dataset$BATCH);

# R t-test assumes unequal variance by default (http://www.statmethods.net/stats/ttest.html)
B0 = dataset[dataset$BATCH == "B0",]$OUTCOME;
meanEqualityPValues = list();
for (batch in batches) {
  Bi = dataset[dataset$BATCH == batch,]$OUTCOME;
  meanEqualityPValues[batch] <- t.test(B0, Bi)$p.value;
}
