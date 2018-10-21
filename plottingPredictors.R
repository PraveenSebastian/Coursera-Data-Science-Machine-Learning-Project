#Note : Always make the plots in training set only
library(ISLR)
library(ggplot2)
library(caret)
data(Wage)
summary(Wage)
inTrain <- createDataPartition(y=Wage$wage,p = 0.7, list = FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training)
dim(testing)
#Using Feature Plot
featurePlot(x=training[,c("age","education","jobclass")],y=training$wage,plot = "pairs")
#Using qplot from ggplot2 package
qplot(age,wage,data=training)
qplot(age,wage,colour=jobclass,data = training)
#add regression smoothers
qq <- qplot(age,wage,colour=education,data = training)
#geom_smooth function is from ggplot2 package
qq + geom_smooth(method = 'lm',formula=y~x)
#cut2 making factors from Hmisc package.g parameter breaks data it into grroups
cutWage <- cut2(training$wage,g=3)
table(cutWage)
#Boxplots with cut2
p1 <- qplot(cutWage,age, data = training,fill=cutWage,geom=c("boxplot"))
p1
#Boxplots with points overlayed
p2 <- qplot(cutWage,age,data=training,fill=cutWage,geom = c("boxplot","jitter"))
grid.arrange(p1,p2,ncol=1)
t1 <- table(cutWage,training$jobClass)
t1
prop.table(t1,1)
#density plots
qplot(wage,colour=education,data=training,geom ="density")











