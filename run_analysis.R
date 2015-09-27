# Merges the training and the test sets to create one data set.

setwd("c:/users/alexey/desktop/r/getclean")

## I would happily use "read.fwf" to read the data set, but I didn't manage to make it work for big files
dataTest <- read.csv("test/x_test.txt",header=FALSE)
dataTrain <- read.csv("train/x_train.txt",header=FALSE)
labelsTest <- read.csv("test/y_test.txt", header=FALSE)
labelsTrain <- read.csv("train/y_train.txt", header=FALSE)
subjectsTest <- read.csv("test/subject_test.txt", header=FALSE)
subjectsTrain <- read.csv("train/subject_train.txt", header=FALSE)

dataSet <- rbind(dataTest, dataTrain)
labels <- rbind(labelsTest, labelsTrain)
subjects <- rbind(subjectsTest, subjectsTrain)
dataSet <- cbind(dataSet, labels)
dataSet <- cbind(dataSet, subjects)
names(dataSet) <- c("text","label","subject")

features <- read.csv("features.txt", header=FALSE, sep=" ")
names(features) = c("featureOrder","featureName")
activityLabels <- read.csv("activity_labels.txt", header=FALSE, sep=" ")
names(activityLabels) = c("label","activityName")

dataSet <- merge(dataSet, activityLabels, by.x="label", by.y="label" )

# Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
isMeanStd <- grepl("(-mean\\(\\))|(-std\\(\\))", features[,2])
features <- features[isMeanStd,]
features <- mutate(features, start=(featureOrder-1)*16+1, stop=start+16)
for (i in 1:nrow(features)) {
	start <- features[i, "start"]
	stop <- features[i, "stop"]
	dataSet <- mutate(dataSet, sapply(substr(text, start, stop),as.numeric))
	names(dataSet)[i+4] = as.character(features[i,"featureName"])
}

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
activitySubject <- group_by(dataSet, subject, activityName)
tidySet <- data.frame(summarise_each(activitySubject, funs(mean), -text, -label))
tidySet <- arrange(tidySet, subject, activityName)
# write.table(tidySet,"tidySet.txt",row.names=FALSE)
tidySet
