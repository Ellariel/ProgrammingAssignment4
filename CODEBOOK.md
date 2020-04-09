## UCI HAR Full Dataset

#The data linked to from that repo represent tidy data set of Samsung Galaxy S smartphone.
#Raw data and other information can be retraive from: 
#http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#That script does merge train and test datasets of raw UCI HAR Data.
#Before download and extract UCI HAR Dataset arcive in the R-project directory, you need to execute script by:

source("run_analysis.R")

#You may change raw dataset directory by correct that line: 
run_analysis <- function(dir = "UCI HAR Dataset") { .....

After excuting that script you can find two data sets in the R-project directory:
1. tidydata.csv
2. avgdata.csv

#The first one is only the measurements on the mean and standard deviation for each measurement extracted from UCI HAR Dataset.

#Both datasets uses descriptive activity names from UCI HAR Dataset to name the activities in the dataset.
#The labels of columns in datasets retreived from original UCI HAR Data.
#The second one is an independent tidy data set with the average of each variable for each activity and each subject.

#You can finde full descriptons in CODEBOOK.md