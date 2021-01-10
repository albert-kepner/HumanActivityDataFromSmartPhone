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