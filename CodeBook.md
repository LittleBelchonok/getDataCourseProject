# Data

The data collected from the accelerometers from the Samsung Galaxy S smartphone was taken from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

tBodyAcc-XYZ - body acceleration signal

tGravityAcc-XYZ - gravity acceleration signal

tBodyAccJerk-XYZ - Jerk signals

tBodyGyro-XYZ - NA

tBodyGyroJerk-XYZ - Jerk signals

tBodyAccMag - Euclidean norm for tBodyAcc

tGravityAccMag - Euclidean norm for tGravityAcc

tBodyAccJerkMag - Euclidean norm for tBodyAccJerk

tBodyGyroMag - Euclidean norm for tBodyGyro

tBodyGyroJerkMag - Euclidean norm for tBodyGyroJerk

fBodyAcc-XYZ - FFT for tBodyAcc

fBodyAccJerk-XYZ - FFT for tBodyAccJerk

fBodyGyro-XYZ - FFT for tBodyGyro

fBodyAccMag - FFT for tBodyAccMag

fBodyAccJerkMag - FFT for tBodyAccJerkMag

fBodyGyroMag - FFT for tBodyGyroMag

fBodyGyroJerkMag - FFT for tBodyGyroJerkMag

...mean - Mean value

...std - Standard deviation

# Clean up

Each measurement in original data set contained many variables - only mean and std were taken.

Each measurement was also marked by its subject and activity performed in separate tables.

These tables were merged with the original data set, and all measurements were grouped by subject and activity.

Finally, sibject, activity and averaged means and stds for all variables were reported.
