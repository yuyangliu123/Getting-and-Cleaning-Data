
# Introduction
The script `run_analysis.R` performs the 5 steps described in the course project's definition.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data source: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

#Step to work on this project.
1. Download file by url `fileurl` given in `run_analysis.R` and store it in your computer, unzip and get new folder `UCI HAR Dataset`.
2. Put `run_analysis.R` into folder `UCI HAR Dataset`.
3. use `source("run_analysis.R")` function and get the output `tidy_data.txt` in `UCI HAR Dataset`.

#Require package
You should install package `reshape2` in advance.
