#Transforming tidy covraites
library(kernlab)
library(caret)
data(spam)
spam$capitalAveSq <- spam$capitalAve^2
#Load Example Data
library(ISLR)
data(Wage)
InTrain <- createDataPartition(y=Wage$wage, p=0.7, list=FALSE)
training <- Wage[InTrain]
testing <- Wage[-InTrain]
#Common covariates to add,dummy variables
table(training$jobclass)
dummies <- dummyVars(Wage ~ jobclass, data=training)
head(predict(dummies,newdata=training))
nsv <- nearZeroVar(training,saveMetrics = TRUE)
nsv
#Spline basics
library(splines)
bsBasis<- bs(training$age,df=3)
bsBasis
#Fitting Curves with splines
lm1 <- lm(wage ~ bsBasis,data=training)
plot(training$age,training$wage,pch=19,cex=0.5)
points(training$age,predict(lm1,newdata=training),col="red",pch=19,cex=0.5)
#spline on the test set
predict(bsBasis,age=testing$age)



















