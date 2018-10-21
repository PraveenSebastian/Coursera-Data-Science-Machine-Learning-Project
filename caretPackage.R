setwd("C:/Users/praveen/Desktop/DataScience/Machine Learning/Week 2")
library(caret)
library(kernlab)
data(spam)
inTrain <- createDataPartition(spam$type, p=0.75, list = FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)
set.seed(32343)
library(e1071)
modelFit <- train(type ~.,data=training, method="glm")
modelFit
modelFit$finalModel
predictions <- predict(modelFit,newdata=testing)
predictions

confusionMatrix(predictions,testing$type)