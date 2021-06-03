# INSTALL THE DATA 
library(readxl)
Goal4 <- read_excel("Desktop/DataForGood/config_files/Goal4.xlsx")
myData<-Goal4
head(myData)
str(myData)
hist(myData$Age)
unique(myData$Age)
View(myData$Age)
range(myData$Age)
View(myData)
summary(myData)
#install packages
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(dplyr)
library(magrittr)


#unique value of each column.
uniquelength <- function(y)
{
  n <-ncol(y)
  for(i in 1:n)
    print(c(colnames(y)[i], length(unique(y[[i]]))))
}
uniquelength(myData)

# number of NAs of each column.
nalength <- function(y)
{
  n <- ncol(y)
  for(i in 1:n)
    print(c(colnames(y)[i], length(which(is.na(y[, i])=="TRUE"))))
}
nalength(myData)

myNewData<-myData
myNewData<- myNewData[,c(-11,-12,-13,-14,-16,-17,-18,-20,-22,-24,-25)]
View(myNewData)
colnames(myNewData)<-c("Goal","Target","Indicator","seriesCode","seriesDescription", "geoAreaCode","geoAreaName","timePeriod","Value","timeDetail","Source","educationLevel","Nature","reportingtype","Sex","typeofSkill","Units")

#unique value of each column.
uniquelength <- function(y)
{
  n <-ncol(y)
  for(i in 1:n)
    print(c(colnames(y)[i], length(unique(y[[i]]))))
}
uniquelength(myNewData)

str(myNewData)

# number of NAs of each column.
nalength <- function(y)
{
  n <- ncol(y)
  for(i in 1:n)
    print(c(colnames(y)[i], length(which(is.na(y[, i])=="TRUE"))))
}
nalength(myNewData)
myNewData<-na.omit(myNewData)


geoAreaCodelibrary(ggplot2)
### BARPLOT Education Level
summary(myNewData$educationLevel)
Barplot_educationLevel<- ggplot(myNewData, aes(x = educationLevel,fill=educationLevel)) + geom_bar(color = "white")
Barplot_educationLevel<- Barplot_educationLevel+ggtitle("Barplot of Education Level")+xlab("Education Level")
Barplot_educationLevel


### Bar GeoAreaName
#summary(myNewData$geoAreaName)
#Bar_GeoAreaName<- ggplot(myNewData, aes(x = timePeriod, y=geoAreaName, fill=educationLevel))
#Bar_GeoAreaName<- Bar_GeoAreaName+geom_col()
#Bar_GeoAreaName<- Bar_GeoAreaName+ggtitle("Bar of GeoAreaName")+xlab("Time Period")
#Bar_GeoAreaName<- Bar_GeoAreaName+geom_text(aes(label=geoAreaName), size=4)
#Bar_GeoAreaName

### RUN THE LINEAR MODELING WITH SIGNIFICANT ATTRIBUTES
#myNewDatalm1 <- lm(myNewData$educationLevel~myNewData$geoAreaName+myNewData$educationLevel, data=myNewData)
#summary(lm1)

### BARPLOT Indicator
#summary(myNewData$Indicator)
#Barplot_Indicator<- ggplot(myNewData, aes(x = geoAreaName,y=timePeriod)) + geom_col(aes(size=2,color=Indicator))
#Barplot_Indicator<- Barplot_Indicator+ggtitle("Barplot of Indicator")+xlab("Indicator")
#Barplot_Indicator



### MAKE TRAIN AND TEST DATA
#str(myNewData)
#dim(myNewData)
#cutPoint2_3 <- floor(2 * dim(myNewData)[1]/3)
#cutPoint2_3
#randIndex<- sample(1:dim(myNewData)[1])
#length(randIndex)
#trainData <- myNewData[randIndex[1:cutPoint2_3],]
#testData <- myNewData[randIndex[(cutPoint2_3+1):dim(myNewData)[1]],]
#str(testData)


### SVM WITH ALL AVALIABLE VARIABLES
#Figure out education levels?
#svmOutput <- ksvm(EdLevel ~ . , data = trainData, kernel = "rbfdot", kpar = "automatic", C=5, cross=3, prob.model =TRUE)
#hist(alpha(svmOutput)[[1]])
#svmPred <- predict(svmOutput, testData, type = "votes")
#EducatedPred <- ifelse(svmPred == 1, "Educated","Less Educated")
#str(EducatedPred)
#comtable <- data.frame(testData[,26],EducatedPred[2,])
#table(comtable)
