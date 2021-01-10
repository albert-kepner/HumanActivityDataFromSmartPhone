## Source File: run_analysis.R
## Getting and Cleaning Data Course Week 4 Project -- by Al Kepner

## This is the data from the course website.
## Download data from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The data set is originally from here: (UCI Machine Learning Repository)
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data set License:
## License:
##  ========
##  Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
##
## [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
## Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
## Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
## Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
##
## This dataset is distributed AS-IS and no responsibility implied or explicit 
## can be addressed to the authors or their institutions for its use or misuse.
## Any commercial use is prohibited.
##
## Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.


## Download the data from the Cousera course website:
dataPath <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destinationPath <- "data/projectFiles.zip"

if(!file.exists("data")) {
  dir.create("data")
}

download.file(url=dataPath,mode="wb", method="auto", destfile=destinationPath)

zipFile <- destinationPath
outDir<-"data"
unzip(zipFile,exdir=outDir)

## Create path variables to locate all the relevant data files...
dataPath <- "data/UCI HAR Dataset/"
activityLabelsPath <- paste(dataPath, "activity_labels.txt", sep="")
featuresPath <- paste(dataPath, "features.txt", sep="")
testPath <- paste(dataPath,"test/",sep="")
trainPath <- paste(dataPath, "train/", sep="")



activityLabels <- read.table(activityLabelsPath, col.names=c("index", "activity"))
featureLabels <- read.table(featuresPath, col.names=c("index", "feature"))


subject_test_path <- paste(testPath, "subject_test.txt", sep="")
X_test_path <- paste(testPath, "X_test.txt", sep="")
Y_test_path <- paste(testPath, "Y_test.txt", sep="")

subject_test <- read.table(subject_test_path)
X_test <- read.table(X_test_path)
Y_test <- read.table(Y_test_path)

subject_train_path <- paste(trainPath, "subject_train.txt", sep="")
X_train_path <- paste(trainPath, "X_train.txt", sep="")
Y_train_path <- paste(trainPath, "Y_train.txt", sep="")

subject_train <- read.table(subject_train_path)
X_train <- read.table(X_train_path)
Y_train <- read.table(Y_train_path)





