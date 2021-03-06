# getcleandata.project Codebook

## Description
This codebook gives column descriptions for the data.frame returned by run_analysis.R

## Variable Columns

1. SubjectID - the ID of the subject participating
	- Possible Values: Numbers 1 through 30
2. ActivityName - the name of the activity performed by the subject for which readings were taken
    - Possible Values: 
		- WALKING
		- WALKING_UPSTAIRS
		- WALKING_DOWNSTAIRS
		- SITTING
		- STANDING
		- LAYING

## Summary Observation Columns

Columns 3 through 68 are the means of all observations of the subjects performing each activity. Detailed descriptions of the methods used to collect these observations can be found in UCI HAR Dataset/features_info.txt. This dataset contains only the mean and standard deviation calculations of each feature, and then averages those calculations over the Subject and Activity.

Each column is of the form "mean._feature type_._function_._direction_".

- _feature type_ - This refers to the feature that performed the measurement
- _function_ - This refers to the calculation function used, either mean or std (for standard deviation)
- _direction_ - This refers to the direction (if applicable) and will be the X, Y, or Z axis

For example: "mean.fBodyGyro.mean.X" refers to the mean of the means of fBodyGyro calculations on the X axis.
