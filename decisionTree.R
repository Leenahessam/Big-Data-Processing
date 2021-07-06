library(rpart)
library(party)
library(rpart.plot)
#read file in df
df <- read.csv("car-dataset.csv", header=TRUE)
#head(df)
#counts number of rows to split (80% of rows for training, 20% for testing)
n = nrow(df)
split = sample(c(TRUE, FALSE), n, replace=FALSE, prob=c(0.8, 0.2))
#takes 80% for training
training_set = df[split, ]
#20% for testing
testing_set= df[!split, ]
#create the training decision tree based on the 6 features
tree <- rpart(Label ~ Feature1 + Feature2 + Feature3 + Feature4 + Feature5 + Feature6, method="class", data = training_set)
#plot the tree
plot(tree, compress=TRUE)
#based on tree predict the testing set label
p <- predict(tree, testing_set, type = 'class')
#create accuracy table based on p
accmat <- table(testing_set$Label,p)
#count accuracy
accuracy <- sum(diag(accmat)) / sum(accmat) * 100
print(paste('Accuracy for test ', accuracy, ' %'))
#accuracy = 95.275%