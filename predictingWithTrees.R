data(iris)
library(ggplot2)
names(iris)
table(iris$Species)
inTrain <- createDataPartition(y=iris$Species,p=0.7, list =FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
dim(training)
dim(testing)
qplot(Petal.Width,Sepal.Width,colour=Species,data=training)
# Here ~. means Predicting with all the variables ~. means
library(caret)
modFit <- train(Species ~ .,method="rpart",data=training)
print(modFit$finalModel)
plot(modFit$finalModel, uniform=TRUE,main="Classification Tree")
text(modFit$finalModel, use.n=TRUE, all=TRUE, cex=0.8)
#Prettier plots
library(rattle)
fancyRpartPlot(modFit$finalModel)
#Predicting new values
predict(modFit, data=testing)












