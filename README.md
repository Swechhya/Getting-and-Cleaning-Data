===============================================================================================================================
Getting and cleaning Data-Course Project
===============================================================================================================================

The R code(run_analysis.R) is created for analysing the data set downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The R code is used for find the avearge of measurements on the mean and standard deviation for each measurement. 
The output of the R code is saved in the working directory as a text file with the name "Analysis.txt"

Different text files are imported in R from the downloaded data and saved in different data frames. The text files imported contain data collected from the accelerometers from Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

R code description:
=====================
1.The test and training data files imported in R from files x_train and x_test is first merged using rbind.

2.Then the column names for the variables of the merged table is obtained from file features. From this table only the mean and   standard deviation measurements are retained.

3.Then the descriptive activity names are added in the file using cbind

4.The variables are then grouped for each subject and each activity.

5.The independent tidy data set withaverage of each variable for each activity and each subject is computed. 

6. Then independent tidy data is saved in a txt file using write.table(). 

