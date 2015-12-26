# Getting-and-Cleaning-Data (Course Project)
This course project is completed as partial requirement of the Course entered "Getting and Cleaning Data" offered by Coursera.

## This script does below main tasks:
*  Downloads and unzips the zipped data source from the given URL if dataset does not exist in working directory.
*  Reads required csv files into R environment.
*  Merges the training and the test sets to create one data set.
*  Extracts only the measurements on the mean and standard deviation for each measurement.
*  Uses descriptive activity names to name the activities in the data set
*  Appropriately labels the data set with descriptive variable names.
*  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
*  Stores the tidy datasrt in a file called "tidy.txt".

* Code Book
The tidy.txt containst 10299 observations each with 88 variables. The observations are read from X_test.txt and X_train.txt and merged into a single dataset called "Tidy_Data". Also Y_test.txt and Y_train.txt are being read and merged into the database. Detail description of the 88 variables are provided below

 [1] "Subject": Is the ID of the 30 subjects participating in the study whose data reflected in this dataset. The input for this colum is read from 'subject_test.txt' and 'subject_train.txt'.
 
 [2] "Activity": There are 6 main activities in this study that represents the subject's activity under study.
 
 * 'WALKING'
 * 'WALKING_UPSTAIRS'
 * 'WALKING_DOWNSTAIRS'
 * 'SITTING'
 * 'STANDING'
 * 'LAYING'.
 
 Name of these activities and their corresponding IDs are stored in 'activity_labels.tx' file. In order to attach this column to the observation data, we use their corresponding IDs field and merge them with the main dataset stored in 'tidy_data'. SubjectID was merged by Tidy_Data in the first step when creating tidy_data (IDs read from y_test.txt and y_train.txt).
 
 # Name of features (only those with 'mean' and 'std' in their name)
*  Activity
*  Subject
*  tBodyAcc-mean-X
*  tBodyAcc-mean-Y
*  tBodyAcc-mean-Z
*  tBodyAcc-std-X
*  tBodyAcc-std-Y
*  tBodyAcc-std-Z
*  tGravityAcc-mean-X
*  tGravityAcc-mean-Y
*  tGravityAcc-mean-Z
*  tGravityAcc-std-X
*  tGravityAcc-std-Y
*  tGravityAcc-std-Z
*  tBodyAccJerk-mean-X
*  tBodyAccJerk-mean-Y
*  tBodyAccJerk-mean-Z
*  tBodyAccJerk-std-X
*  tBodyAccJerk-std-Y
*  tBodyAccJerk-std-Z
*  tBodyGyro-mean-X
*  tBodyGyro-mean-Y
*  tBodyGyro-mean-Z
*  tBodyGyro-std-X
*  tBodyGyro-std-Y
*  tBodyGyro-std-Z
*  tBodyGyroJerk-mean-X
*  tBodyGyroJerk-mean-Y
*  tBodyGyroJerk-mean-Z
*  tBodyGyroJerk-std-X
*  tBodyGyroJerk-std-Y
*  tBodyGyroJerk-std-Z
*  tBodyAccMag-mean
*  tBodyAccMag-std
*  tGravityAccMag-mean
*  tGravityAccMag-std
*  tBodyAccJerkMag-mean
*  tBodyAccJerkMag-std
*  tBodyGyroMag-mean
*  tBodyGyroMag-std
*  tBodyGyroJerkMag-mean
*  tBodyGyroJerkMag-std
*  fBodyAcc-mean-X
*  fBodyAcc-mean-Y
*  fBodyAcc-mean-Z
*  fBodyAcc-std-X
*  fBodyAcc-std-Y
*  fBodyAcc-std-Z
*  fBodyAcc-meanFreq-X
*  fBodyAcc-meanFreq-Y
*  fBodyAcc-meanFreq-Z
*  fBodyAccJerk-mean-X
*  fBodyAccJerk-mean-Y
*  fBodyAccJerk-mean-Z
*  fBodyAccJerk-std-X
*  fBodyAccJerk-std-Y
*  fBodyAccJerk-std-Z
*  fBodyAccJerk-meanFreq-X
*  fBodyAccJerk-meanFreq-Y
*  fBodyAccJerk-meanFreq-Z
*  fBodyGyro-mean-X
*  fBodyGyro-mean-Y
*  fBodyGyro-mean-Z
*  fBodyGyro-std-X
*  fBodyGyro-std-Y
*  fBodyGyro-std-Z
*  fBodyGyro-meanFreq-X
*  fBodyGyro-meanFreq-Y
*  fBodyGyro-meanFreq-Z
*  fBodyAccMag-mean
*  fBodyAccMag-std
*  fBodyAccMag-meanFreq
*  fBodyBodyAccJerkMag-mean
*  fBodyBodyAccJerkMag-std
*  fBodyBodyAccJerkMag-meanFreq
*  fBodyBodyGyroMag-mean
*  fBodyBodyGyroMag-std
*  fBodyBodyGyroMag-meanFreq
*  fBodyBodyGyroJerkMag-mean
*  fBodyBodyGyroJerkMag-std
*  fBodyBodyGyroJerkMag-meanFreq