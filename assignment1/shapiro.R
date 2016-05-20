# Shapiro test per batch (log normality)

dataset = read.sas7bdat("assignment1.sas7bdat");
dataset$LOGOUTCOME = log(dataset$OUTCOME)
batches = unique(dataset$BATCH);

normalityPValues = list();
for (batch in batches) {
  Bi = dataset[dataset$BATCH == batch,]$LOGOUTCOME;
  normalityPValues[batch] <- shapiro.test(Bi)$p.value;
  qqnorm(Bi)
  qqline(Bi)
}