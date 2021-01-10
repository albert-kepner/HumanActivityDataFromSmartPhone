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

## Load required R packages 
library(dplyr)

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

subject_train_path <- paste(trainPath, "subject_train.txt", sep="")
X_train_path <- paste(trainPath, "X_train.txt", sep="")
Y_train_path <- paste(trainPath, "Y_train.txt", sep="")

subject_test_path <- paste(testPath, "subject_test.txt", sep="")
X_test_path <- paste(testPath, "X_test.txt", sep="")
Y_test_path <- paste(testPath, "Y_test.txt", sep="")



## Read the training data from 3 files, 
## which (1) identify subject (or person),
## (2) all of the measurement data (X_train), and 
## (3) identify the human activity (Y_train)
subject_train <- read.table(subject_train_path)
X_train <- read.table(X_train_path)
Y_train <- read.table(Y_train_path)

## Read the test data from 3 files, 
## which (1) identify subject (or person),
## (2) all of the measurement data (X_test), and 
## (3) identify the human activity (Y_test)
subject_test <- read.table(subject_test_path)
X_test <- read.table(X_test_path)
Y_test <- read.table(Y_test_path)

## Add the column name "subject" to the subject data.
names(subject_train) = "subject"
names(subject_test) = "subject"

## Add a data_source variable to the subject_train and subject_test
## data frames, to track where the data came from.
subject_train <- mutate(subject_train, data_source="TRAIN")
subject_test <- mutate(subject_test, data_source="TEST")

## Combine the TRAIN and TEST data, so that all the observations
## can end up in one data set.
measurements_combined <- rbind(X_train, X_test)
activity_combined <- rbind(Y_train, Y_test)
subject_combined <- rbind(subject_train, subject_test)

combined_data <- measurements_combined

## Function to simplify the feature names by
## replacing most special characters with underscore (_)
## and eliminating () .
fixFeatureName <- function(name) {
  s1 <- sub("\\(\\)","", name)
  s2 <- gsub(",","_", s1)
  s3 <- gsub("-", "_", s2)
  s4 <- sub("\\)$","", s3)
  s5 <- sub("\\)","_",s4)
  s6 <- sub("\\(","_", s5)
  s6
}

## Add variable names (column names) for all the measurements
## with the special characters from the features eliminated.
feature_names <- featureLabels$feature %>% fixFeatureName
names(combined_data) <- feature_names

## Create a factor out of the activity names in activityLabels
activityLabels <- mutate(activityLabels, human_activity = factor(activity))

## From the original list of features, determine the
## indicies of data showing mean and standard deviation measurments.
mean_and_std_indicies <- grep("-mean|-std", featureLabels$feature)

## subset the combined data to only show measurements for mean and standard deviation.
## We use the indexes of the selected features, to select a subset of columns from
## the combined data set.
mean_and_std <- combined_data[,mean_and_std_indicies]


names(mean_and_std)









