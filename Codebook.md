# getcleandata.project Codebook

## Description
This codebook gives column descriptions for the data.frame returned by run_analysis.R

## Variable Columns

1. SubjectID - the ID of the subject participating
	- Possible Values: Numbers 1 through 30
2. ActivityName - the name of the activity performed by the subject for which readings were taken
    - Possible Values: 
		1. WALKING
		2. WALKING_UPSTAIRS
		3. WALKING_DOWNSTAIRS
		4. SITTING
		5. STANDING
		6. LAYING

## Summary Observation Columns

Columns 3 through 68 are the means of all observations of the subjects performing each activity. Detailed descriptions of the methods used to collect these observations can be found in UCI HAR Dataset/features_info.txt. This dataset contains only the mean and standard deviation calculations of each feature, and then averages those calculations over the Subject and Activity.

Each column is of the form "mean._feature type_._function_._direction_".

_feature type_ - This refers to the feature that performed the measurement
_function_ - This refers to the calculation function used, either mean or std (for standard deviation)
_direction_ - This refers to the direction (if applicable) and will be the X, Y, or Z axis
