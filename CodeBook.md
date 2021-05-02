---
title: "CodeBook to course project Getting and Cleaning Data"
author: "Anna Karaseva"
date: "02 05 2021"
output: html_document
---

***
# Source Data

The source data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Source data link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description taken from 'README.txt' of source data set:

*The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.*

*The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.*

*- 'features_info.txt': Shows information about the variables used on the feature vector.*

*- 'features.txt': List of all features.*

*- 'activity_labels.txt': Links the class labels with their activity name.*

*- 'train/X_train.txt': Training set.*

*- 'train/y_train.txt': Training labels.*

*- 'test/X_test.txt': Test set.*

*- 'test/y_test.txt': Test labels.*

*The following files are available for the train and test data. Their descriptions are equivalent. *

*- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. *

*- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. *

*- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. *

*- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. *

*Notes:*
======

*- Features are normalized and bounded within [-1,1].*

*- Each feature vector is a row on the text file.*

***
# Algorithm of data transformation.

1. variable 'keyfigures' contains the filtered list of features ("features.txt" from source data set) by mean and std measurements
2. variable 'traindata' contains data from the source data set file '/train/X_train.txt', filtered by selected in step 1 measurements (columns)
3. variable 'activitytrain' contains data from the source data set file '/train/Y_train.txt'
4. variable 'subjecttrain' contains data from the source data set file '/train/subject_train.txt'
5. variable 'train' merges 'traindata', 'activitytrain' and 'subjecttrain'
6. variable 'testdata' contains data from the source data set file '/test/X_train.txt', filtered by selected in step 1 measurements (columns)
7. variable 'activitytest' contains data from the source data set file '/test/Y_train.txt'
8. variable 'subjecttest' contains data from the source data set file '/test/subject_train.txt'
9. variable 'test' merges 'testdata', 'activitytest' and 'subjecttest'
10. variable 'tidydata' merges 'train' and 'test' data sets, with transform of activity and subject columns to factors
11. 'tidydata' is written to file 'tidydata.txt' in working directory

***
# Format of 'tidydata' dataset

|column name|type|levels|values|
|:-----|:-----:|:-----:|:-----:|:-----:|
|subject|Factor|30|"1",...,"30"|
|activity|Factor|6|"WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"|
|	tBodyAcc-mean-X	|	num	|	|	|
|	tBodyAcc-mean-Y	|	num	|	|	|
|	tBodyAcc-mean-Z	|	num	|	|	|
|	tBodyAcc-std-X	|	num	|	|	|
|	tBodyAcc-std-Y	|	num	|	|	|
|	tBodyAcc-std-Z	|	num	|	|	|
|	tGravityAcc-mean-X	|	num	|	|	|
|	tGravityAcc-mean-Y	|	num	|	|	|
|	tGravityAcc-mean-Z	|	num	|	|	|
|	tGravityAcc-std-X	|	num	|	|	|
|	tGravityAcc-std-Y	|	num	|	|	|
|	tGravityAcc-std-Z	|	num	|	|	|
|	tBodyAccJerk-mean-X	|	num	|	|	|
|	tBodyAccJerk-mean-Y	|	num	|	|	|
|	tBodyAccJerk-mean-Z	|	num	|	|	|
|	tBodyAccJerk-std-X	|	num	|	|	|
|	tBodyAccJerk-std-Y	|	num	|	|	|
|	tBodyAccJerk-std-Z	|	num	|	|	|
|	tBodyGyro-mean-X	|	num	|	|	|
|	tBodyGyro-mean-Y	|	num	|	|	|
|	tBodyGyro-mean-Z	|	num	|	|	|
|	tBodyGyro-std-X	|	num	|	|	|
|	tBodyGyro-std-Y	|	num	|	|	|
|	tBodyGyro-std-Z	|	num	|	|	|
|	tBodyGyroJerk-mean-X	|	num	|	|	|
|	tBodyGyroJerk-mean-Y	|	num	|	|	|
|	tBodyGyroJerk-mean-Z	|	num	|	|	|
|	tBodyGyroJerk-std-X	|	num	|	|	|
|	tBodyGyroJerk-std-Y	|	num	|	|	|
|	tBodyGyroJerk-std-Z	|	num	|	|	|
|	tBodyAccMag-mean	|	num	|	|	|
|	tBodyAccMag-std	|	num	|	|	|
|	tGravityAccMag-mean	|	num	|	|	|
|	tGravityAccMag-std	|	num	|	|	|
|	tBodyAccJerkMag-mean	|	num	|	|	|
|	tBodyAccJerkMag-std	|	num	|	|	|
|	tBodyGyroMag-mean	|	num	|	|	|
|	tBodyGyroMag-std	|	num	|	|	|
|	tBodyGyroJerkMag-mean	|	num	|	|	|
|	tBodyGyroJerkMag-std	|	num	|	|	|
|	fBodyAcc-mean-X	|	num	|	|	|
|	fBodyAcc-mean-Y	|	num	|	|	|
|	fBodyAcc-mean-Z	|	num	|	|	|
|	fBodyAcc-std-X	|	num	|	|	|
|	fBodyAcc-std-Y	|	num	|	|	|
|	fBodyAcc-std-Z	|	num	|	|	|
|	fBodyAccJerk-mean-X	|	num	|	|	|
|	fBodyAccJerk-mean-Y	|	num	|	|	|
|	fBodyAccJerk-mean-Z	|	num	|	|	|
|	fBodyAccJerk-std-X	|	num	|	|	|
|	fBodyAccJerk-std-Y	|	num	|	|	|
|	fBodyAccJerk-std-Z	|	num	|	|	|
|	fBodyGyro-mean-X	|	num	|	|	|
|	fBodyGyro-mean-Y	|	num	|	|	|
|	fBodyGyro-mean-Z	|	num	|	|	|
|	fBodyGyro-std-X	|	num	|	|	|
|	fBodyGyro-std-Y	|	num	|	|	|
|	fBodyGyro-std-Z	|	num	|	|	|
|	fBodyAccMag-mean	|	num	|	|	|
|	fBodyAccMag-std	|	num	|	|	|
|	fBodyBodyAccJerkMag-mean	|	num	|	|	|
|	fBodyBodyAccJerkMag-std	|	num	|	|	|
|	fBodyBodyGyroMag-mean	|	num	|	|	|
|	fBodyBodyGyroMag-std	|	num	|	|	|
|	fBodyBodyGyroJerkMag-mean	|	num	|	|	|
|	fBodyBodyGyroJerkMag-std	|	num	|	|	|
	
***
# Building data set with average measures by each subject and activity

1. apply functions melt and dcast to tidydata variable received on the previous step.
2. write result to the file 'tidydata_average.txt'
