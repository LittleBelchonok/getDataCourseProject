# This script prepares tidy data set for "Getting and Cleaning Data" course project
# Make sure you've placed source data (/test, /traind dirs and other files) to the working directory before running the script

# I would happily use "read.fwf" to read the data set, but I didn't manage to make it work for big files
# Instead I read character strings from source files and then manipulate them to obtain the data on means and stdevs

# Read data on measurements
dataTest <- read.csv("test/x_test.txt",header=FALSE)
dataTrain <- read.csv("train/x_train.txt",header=FALSE)
labelsTest <- read.csv("test/y_test.txt", header=FALSE)
labelsTrain <- read.csv("train/y_train.txt", header=FALSE)
subjectsTest <- read.csv("test/subject_test.txt", header=FALSE)
subjectsTrain <- read.csv("train/subject_train.txt", header=FALSE)

# Merge the training and the test sets to create one data set
dataSet <- rbind(dataTest, dataTrain)
labels <- rbind(labelsTest, labelsTrain)
subjects <- rbind(subjectsTest, subjectsTrain)

# Add labels and subjects to the main data set
dataSet <- cbind(dataSet, labels)
dataSet <- cbind(dataSet, subjects)

# Properly name main data set columns
names(dataSet) <- c("text","label","subject")

# Read data on variables and labels, name it properly
features <- read.csv("features.txt", header=FALSE, sep=" ")
names(features) = c("featureOrder","featureName")
activityLabels <- read.csv("activity_labels.txt", header=FALSE, sep=" ")
names(activityLabels) = c("label","activityName")

# Add label names to the main data set
dataSet <- merge(dataSet, activityLabels, by.x="label", by.y="label" )

# Extract only the measurements on the mean and standard deviation for each measurement
library(dplyr)
## Decide which variables we need (only means and stdevs)
isMeanStd <- grepl("(-mean\\(\\))|(-std\\(\\))", features[,2])
## Remove all other variables from the list
features <- features[isMeanStd,]
## For each variable calculate its position in the main data set character strings
features <- mutate(features, start=(featureOrder-1)*16+1, stop=start+16)
## For each variable...
for (i in 1:nrow(features)) {
	start <- features[i, "start"]
	stop <- features[i, "stop"]
	##...add variable values to main data set...
	dataSet <- mutate(dataSet, sapply(substr(text, start, stop),as.numeric))
	##...and name them properly
	names(dataSet)[i+4] = as.character(features[i,"featureName"])
}

# Create a tidy data set with the average of each variable for each activity and each subject
## Group measurements by activity and subject
activitySubject <- group_by(dataSet, subject, activityName)
## Create tidy data set from main data set - summarizing by subject and activity
tidySet <- data.frame(summarise_each(activitySubject, funs(mean), -text, -label))
tidySet <- arrange(tidySet, subject, activityName)

# Show the resulting tidy data set (or write it in a file - commented)
tidySet
# write.table(tidySet,"tidySet.txt",row.names=FALSE)
