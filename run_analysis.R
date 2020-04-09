##You should create one R script called run_analysis.R that does the following.

##Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement.
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names.
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

run_analysis <- function(dir = "UCI HAR Dataset") {
  
  library(data.table)
  
  ##dir <- ##SET "UCI HAR Dataset" DIR
  
  xtt <- read.table(paste0(dir,"\\test\\X_test.txt")) ##get data X test ~2947 obs
  xtr <- read.table(paste0(dir,"\\train\\X_train.txt")) ##get data X train ~7352 obs
  fs <- read.table(paste0(dir,"\\features.txt")) ##get column names
  setnames(xtt, names(xtt), as.character(fs[,2])) ##change column names to appropriate names
  setnames(xtr, names(xtr), as.character(fs[,2])) ##change column names to appropriate names
  
  dtt <- as.data.table(xtt[,grepl("mean|std", colnames(xtt))])  ##extract mean and std columns only
  dtr <- as.data.table(xtr[,grepl("mean|std", colnames(xtr))])  ##reduce colcount from 561 to 79
  
  ttact <- read.table(paste0(dir,"\\test\\y_test.txt"))  ##get data y test (activity)
  ttsub <- read.table(paste0(dir,"\\test\\subject_test.txt")) ##get subject id test (subject)
  
  tract <- read.table(paste0(dir,"\\train\\y_train.txt")) ##get data y train (activity)
  trsub <- read.table(paste0(dir,"\\train\\subject_train.txt")) ##get subject id train (subject)
  
  dtt <- dtt[,act:=ttact] ##attach activity and subject data
  dtt <- dtt[,sub:=ttsub] ##add 2 col
  
  dtr <- dtr[,act:=tract] ##attach activity and subject data
  dtr <- dtr[,sub:=trsub] ##add 2 col
  
  ##join test and train data
  tidydata <- rbindlist(list(dtt,dtr)) ##~10299 obs of 81 var.
  
  ##name activities
  al <- read.table(paste0(dir,"\\activity_labels.txt")) ##get labels of activities
  tidydata[,act:=al[act,][,2]]  ## change num of activity to name
  
  write.csv(tidydata,"tidydata.csv", row.names = F)  ##save tidy data set
  
  remove(xtt, xtr, fs, dtt, dtr, ttact, ttsub, tract, trsub, al)
  
  ##make average data
  ##creating a second, independent tidy data set with the average of each variable for each activity and each subject
  
  library(dplyr)
  
  avgdata <- tidydata %>%
    group_by(sub, act) %>%
      summarise_all(mean)
  
  write.csv(avgdata,"avgdata.csv", row.names = F) ## save average data of activities and subjects ~ 180 obs (6 act * 30 sub) and 82 vars
  
  write.table(avgdata,"avgdata.txt",row.names = F) ##just for coursera work

  remove(avgdata, tidydata)
  
}

run_analysis()
