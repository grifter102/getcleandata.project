# getcleandata.project Readme
Course Project files for the Getting and Cleaning Data Coursera course

## Description

The run_analysis.R script reads the [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) dataset contained in the 'UCI HAR Dataset' subdirectory.
 
###run_analysis() function
The run_analysis() function does the following:

1. imports the data and combines test and training into one set 
2. extracts only the measurements on the mean and standard deviation for each measurement
3. Labels the activities
4. Labels the variables
5. Returns a wide, tidy dataset (data.frame) with the average of each variable for each activity and each subject
   - wide dataset complies with tidy dataset standard of one row per observation
   - in this case, observation is one subject and one activity

###Codebook
The Codebook.txt file included contains a description of each of the columns in the resulting data.frame returned by run_analysis().
