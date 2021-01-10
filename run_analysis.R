## Source File: run_analysis.R
## Getting and Cleaning Data Course Week 4 Project -- by Al Kepner

## This is the data from the course website.
## Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The data set is originally from here: (UCI Machine Learning Repository)
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

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