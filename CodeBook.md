# Data

The data collected from the accelerometers from the Samsung Galaxy S smartphone was taken from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Variables

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

t... - time
f... - Fast Fourier Transform

...XYZ... - 3-dimensional axes

...mean - Mean value
...std - Standard deviation

# Clean up

Each measurement in original data set contained many variables - only mean and std were taken.
Each measurement was also marked by its subject and activity performed in separate tables.
These tables were merged with the original data set, and all measurements were grouped by subject and activity.
Finally, sibject, activity and averaged means and stds for all variables were reported.
