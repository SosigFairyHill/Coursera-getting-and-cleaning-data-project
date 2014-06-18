Course project for Coursera Getting and Cleaning Data
======================================================
This repo contains the script "run_analysis.R", which is used to combine the testing and training sets of the Samsung activity dataset, as well as produce a tidy data set, with measurements corresponding to means and standard deviations averaged by subject and activity.

To use this script, download it and place it in the same folder as the unzipped dataset obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (ie. not in the folder "UCI HAR Dataset", but in its parent folder).

Import the script into R, by setting the working directory to the directory of the script, and running

source("run_analysis.R")

Process the dataset by running

outputData <- run_analysis()

This will write the tidy dataset to a file tidyUCIHARData.txt in the same directory as the script. You can access the dataset comprising the combined test and train datasets with

outputData$dataset

and you can access the the tidy dataset with

output$tidy
