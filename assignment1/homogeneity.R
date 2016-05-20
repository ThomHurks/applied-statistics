# Homogeneity test

dataset = read.sas7bdat("assignment1.sas7bdat");
batches = unique(dataset$BATCH);

# For each group $i \in [1, 8)$
# Null hypothesis: \sigma_0 = \sigma_i

# F-test: $F = \frac{s_1^2}{s_i^2}$
B0 = dataset[dataset$BATCH == "B0",]$OUTCOME;
varianceEqualityPValues = list();
for (batch in batches) {
  Bi = dataset[dataset$BATCH == batch,]$OUTCOME;
  varianceEqualityPValues[batch] <- var.test(B0, Bi)$p.value
}

