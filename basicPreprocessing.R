library(caret)
library(kernlab)
data(spam)
inTrain <- createDataPartition(y=spam$type,p=0.75, list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
hist(training$capitalAve,main="",xlab = "ave.capital run length")
sd(training$capitalAve)
#Standardising train set
trainCapAve <- training$capitalAve
trainCapAves <- (trainCapAve - mean(trainCapAve))/sd(trainCapAve)
mean(trainCapAves)
sd(trainCapAves)
#Standardising test set
testCapAve <- testing$capitalAve
testCapAves <- (testCapAve-mean(trainCapAve))/sd(trainCapAve)
mean(testCapAves)
#Standardising preProcess function
preObj <- preProcess(training[,-58], method=c("center","scale"))
trainCapAves <- predict(preObj,training[,-58])$capitalAve
mean(trainCapAves)
sd(trainCapAves)

testCapAves <- predict(preObj,training[,-58])$capitalAve
mean(testCapAves)
sd(testCapAves)

#Standardizing - preProcess argument
set.seed(32343)
modelFit <- train(type~.,data = training,preProcess=c("center","scale"),method = "glm")
modelFit

#Standardizing - Box-Cox transforms
preObj <- preProcess(training[,-58],method = c("BoxCox"))
trainCapAves <- predict(preObj, training[,-58])$capitalAve
par(mfrow=c(1,2));hist(trainCapAves);qqnorm(trainCapAves)
#Standardizing - Imputing data
set.seed(13343)
#Make some values NA
training$capAve <- training$capitalAve
selectNA <- rbinom(dim(training)[1],size=1,prob = 0.05)==1
training$capAve[selectNA] <- NA
#Impute and Standardize
preObj <- preProcess(training[,-58],method = "knnImpute")
capAve <- predict(preObj,training[,-58])$capAve
#Standardize true values
capAveTruth <- training$capitalAve
capAveTruth <- (capAveTruth-mean(capAveTruth))/sd(capAveTruth)

quantile(capAve - capAveTruth)

quantile((capAve - capAveTruth)[SelectNA])

quantile((capAve - capAveTruth)[!SelectNA])





















