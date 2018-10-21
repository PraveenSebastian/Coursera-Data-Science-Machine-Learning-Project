setwd("C:/Users/praveen/Desktop/DataScience/Machine Learning/Week 4")
library(ElemStatLearn)
data(prostate)
str(prostate)
small=prostate[1:5,]
lm(lpsa ~ .,data=small)
#Penalized Regression MOdels -  In caret package the methods are ridge,lasso,relaxo
