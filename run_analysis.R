## Functions and script to import the "Human Activity Recognition Using Smartphones" dataset
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## Loads the data then outputs a table which contains tidy data around average std dev and mean
##     for each subject and activity

## requires dplyr
library(dplyr)

## pull_dataset loads in the data from a directory and the subdirectory set
## assumes that directory will contain X, y and subject data text files

function(directory, set) {
  ## directory is a string of the folder containing the dataset information
  ## set is the subdirectory of folder containing the variable observations
  
  ## pull in X data (variable observatons)
  
  x_data <- read.table(paste0(directory, '/', set, '/X_', set, '.txt'), quote="\"")
  
  ## pull in y data (activity type)
  
  y_data <- read.table(paste0(directory, '/', set, '/y_', set, '.txt'), quote="\"")
  
  ## pull in subject data (performing subject)
  
  subject_data <- read.table(paste0(directory, '/', set, '/subject_', set, '.txt'), quote="\"")
  
  ## Join all data together and return
  
  cbind(subject_data, y_data, x_data)
}

## run_analysis does the following:
## 1. imports the data and combines test and training into one set 
## 2. extracts only the measurements on the mean and standard deviation for each measurement
## 3. Labels the activities
## 4. Labels the variables
## 5. Creates a tidy dataset with the average of each variable for each activity and each subject

function(directory) {
  
  ## pull in the test dataset
  testdata <- pull_dataset(directory, 'test')
  
  ## pull in the train dataset
  traindata <- pull_dataset(directory, 'train')
  
  ## join data together
  fulldata <- rbind(testdata, traindata)
  
  ## pull in the features information for column labels from 'features.txt' in directory
  ## assumes that the column names will be in the second column of the file
  
  features <- read.table(paste0(directory,'/features.txt'))
  
  ## convert names to characters
  colnames <- make.names(as.character(features$V2))
  
  ## determine indices of mean and std dev columns
  ## ignoring the meanFreq column
  meanstdevcolnums <- setdiff(grep("mean|std", colnames), grep("meanFreq", colnames))
  
  ## calculate subset columns taking the subject, activity and the indices (offset by 2)
  subsetcolnums <- c(1, 2, meanstdevcolnums+2)
  
  ## subset the data
  meanstdevdata <- fulldata[,subsetcolnums]
  
  ## add names to all columns, knowing SubjectID is first and ActivityID is second
  ## with names loaded from features as the rest of the names
  names(meanstdevdata) <- c('SubjectID', 'ActivityID', colnames[meanstdevcolnums])
  
  ## load in activity labels
  activitylabels <- read.table(paste0(directory, '/activity_labels.txt'), quote="\"")
  names(activitylabels) <- c("ActivityID","ActivityName")
  
  ## Join activity information to main dataset
  meanstdevdata <- join(meanstdevdata, activitylabels)
  
  ## reorder to replace ID with Name (last column replaces col 2)
  meanstdevdata <- meanstdevdata[, c(1, length(meanstdevdata), 3:(length(meanstdevdata)-1))]
  
  ## group by SubjectID and ActivityName, then summarize each column using mean
  summary_data <- meanstdevdata %>% group_by(SubjectID, ActivityName) %>% summarise_each(funs(mean))
  
  ##
  names(summary_data)[3:length(summary_data)] <- sapply(names(summary_data)[3:length(summary_data)],
                                                        function(z) paste0('mean.', gsub("..","", z, fixed=T)))
  
  summary_data
  
}