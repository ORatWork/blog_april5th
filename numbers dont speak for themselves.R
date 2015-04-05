###############################################
# Workshop Prediction
#
# Example of the cost of poorly measuring Error
#
# Freedman, L. S., & Pee, D. (1989). The American Statistician, 43(4), 279-282
# a note on screening regression equations
#
# Versie 1.0
#
# Date : 2015 - 03- 30
#
###############################################

#empty R - workspace

rm(list=ls())

# generate random vaiables
# 50 explanatroy variabels
# One value to predict
# sample of 100

set.seed(1234)

N<-100
M<-50

predictors<-as.data.frame(matrix( runif(N*M, min=0, max=1), N, M))
str(predictors)
dependend<-as.data.frame(runif(N, min=0, max=1))
colnames(dependend)<-c("Y")
str(dependend)
mydata<-cbind(dependend, predictors)
str(mydata)

fit <- lm(Y ~., data=mydata)
adj_fit<-step(fit)

summary(fit)
summary(adj_fit)

