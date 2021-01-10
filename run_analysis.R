## Source File: run_analysis.R

## Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

dataPath <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destinationPath <- "data/projectFiles.zip"

if(!file.exists("data")) {
  create.dir("data")
}

download.file(url=dataPath,mode="auto", method="wb", destfile=destinationPath)