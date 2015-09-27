# getDataCourseProject
Course project for "Getting and Cleaning Data" course

## What the project contains

This project contains one script that prepares tidy data set for "Getting and Cleaning Data" course project
Project also has two files: README.md, that describes the script, and CodeBook.md with variables description


## How does the script work

Make sure you've placed source data (/test, /traind dirs and other files) to the working directory before running the script

I would happily use "read.fwf" to read the data set, but I didn't manage to make it work for big files
Instead I read character strings from source files and then manipulate them to obtain the data on means and stdevs

1. Read data on measurements, test and train data separaely

2. Merge the training and the test sets to create united data sets:
- main data set (with measurements),
- labels (what kind of activity was measured),
- subjects (whose activity was measured)

3. Add data on labels and subjects to the main data set

4. Read data on variables measured and labels, name it properly

5. Add label names (i.e. activity names) to the main data set

6. Extract only the measurements on the mean and standard deviation for each measurement:
- decide which variables we need (only means and stdevs) and
- remove all other variables from the list

7. For each variable add variable values to main data set and name them properly

8. Create a tidy data set with the average of each variable for each activity and each subject by summarizing main data set

9. Show the resulting tidy data set (or write it in a file)
