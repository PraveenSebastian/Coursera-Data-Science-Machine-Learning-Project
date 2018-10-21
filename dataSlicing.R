library(caret)
library(kernlab)
data(spam)
inTrain <- createDataPartition(y=spam$type, p=0.75, list = FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)
#K Fold return the Train Set
set.seed(32323)
folds <- createFolds(y=spam$type,k=10,list=TRUE,returnTrain = TRUE)
sapply(folds, length)
folds[[1]][1:10]
#K Fold return the Test Set
set.seed(32323)
folds <- createFolds(y=spam$type,k=10,list=TRUE,returnTrain  = FALSE)
sapply(folds,length)
folds[[1]][1:10]
#Resampling
set.seed(32323)
folds <- createResample(y=spam$type, times=10,list=TRUE)
sapply(folds,length)
folds[[1]][1:10]
#TiemSlices
set.seed(32323)
tme <- 1:1000
folds <- createTimeSlices(y=tme, initialWindow=20,horizon=10)
names(folds)
folds$train[[1]]
folds$test[[1]]





