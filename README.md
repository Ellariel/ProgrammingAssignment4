## UCI HAR Full Dataset

The data linked to from that repo represent tidy data set of Samsung Galaxy S smartphone.
Raw data and other information can be retraive from: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

That script does merge train and test datasets of raw UCI HAR Data.
After download and extract UCI HAR Dataset arcive in the R-project directory, you need to execute script by:

```
source("run_analysis.R")
```

You may change raw dataset directory by correct that line: 
```
run_analysis <- function(dir = "UCI HAR Dataset") { .....
```

After executing that script you can find two data sets in the R-project directory:
1. tidydata.csv (10299 obs. of 81 var.)
2. avgdata.csv (180 obs. (6 activities * 30 subjects) and 82 var.)

The first one is only the measurements on the mean and standard deviation for each measurement extracted from UCI HAR Dataset.
The second one is an independent tidy data set with the average of each variable for each activity and each subject.

Both datasets uses descriptive activity names from UCI HAR Dataset to name the activities in the dataset.
The labels of columns in datasets retreived from original UCI HAR Data.

You can finde full descriptons in CODEBOOK.md