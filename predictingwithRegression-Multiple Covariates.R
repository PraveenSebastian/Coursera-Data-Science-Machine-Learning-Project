library(caret)
library(ISLR)
library(ggplot2)
data(Wage)
Wage <- subset(Wage,select=-c(logwage))
summary(Wage)
#Get training/test sets
inTrain <-createDataPartition(y=Wage$wage,p=0.7,list=FALSE)
training <- Wage[inTrain]
testing <-Wage[-inTrain]
dim(training)
dim(testing)
#Feature plot
featurePlot(x=training[,c("age","education","jobclass")],y=training$Wage,plot = "pairs")
#Plot age versus wage
qplot(age,wage,data=training)
#Plot age versus wage colour by jobclass
qplot(age,wage,colour=jobclass,data=training)
#Plot age versus wage colour by education
qplot(age,wage,colour=education,data=training)
#Fit a linear model
modFit <- train(Wage ~ age+jobclass+education,method="lm",data=training)
finMod <- modFit$finalModel
print(modFit)
#Diagnostics
plot(finMod,1,pch=19,cex=0.5,col="#00000010")
#Colour by variables not used in the model
qplot(finMod$fitted,finMod$residuals,colour=race,data=training)
#Plot by index
plot(finMod$residuals,pch=19)
#Predicted versus truth in the test set
pred <- predict(modFit, testing)
qplot(wage,pred,colour=year,data=testing)
#If we want to use all covariates
modFitAll <- train(Wage ~.,data=training,method="lm")
pred <- predict(modFitAll, testing)
qplot(wage,pred,data=testing)





















