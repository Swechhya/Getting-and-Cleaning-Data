####################################################################################################################
# Set the working directory
setwd("D:\\Coursera\\Project\\getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset")
####################################################################################################################
#Include the library needed
library("dplyr")
library("tidyr")
library("plyr")
library("gdata")

#Import all the files and save it in data frame.
TrainigSet<-read.table("./train/X_train.txt")
TrainingLabel<-read.table("./train/y_train.txt")
TestSet<-read.table("./test/X_test.txt")
TestLabel<-read.table("./test/y_test.txt")
features<-read.table("./features.txt")
SubjectTrain<-read.table("./train/subject_train.txt")
SubjectTest<-read.table("./test/subject_test.txt")
ActivityLabels<-read.table("./activity_labels.txt")

####################################################################################################################
####################################################################################################################
#Merging the Test and training data sets to get one data set
####################################################################################################################

DataSet<-rbind(TrainigSet,TestSet)

####################################################################################################################
####################################################################################################################
#Extracts only the measurements on the mean and standard deviation for each measurement. 
####################################################################################################################

DataSet_Names<-DataSet
colnames(DataSet_Names)<-features[,2]

MeanStd<-DataSet_Names[,(grepl("mean", colnames(DataSet))|grepl("Mean", colnames(DataSet))|grepl("Std", colnames(DataSet))
                         |grepl("std", colnames(DataSet)))]

####################################################################################################################
####################################################################################################################
#Use descriptive activity names to name the activities in the data set
####################################################################################################################

Label<-rbind(TrainingLabel,TestLabel)
DesLabel<-data.frame();#Data frame to store the activity name as per the activity label.

for(i in 1:10299)
  
{
  k=Label[i,1]
  DesLabel[i,1]=ActivityLabels[k,2]
}

Data_Act<-cbind(DesLabel,MeanStd)
names(Data_Act)[1]<-"ActivityLabel"

####################################################################################################################
####################################################################################################################
#Create independent tidy data set with the average of each variable for each activity and each subject.
####################################################################################################################

Subject<-rbind(SubjectTrain,SubjectTest)
Data_Sub<-cbind(Subject,Data_Act)

names(Data_Sub)[1]<-"SubjectID"

Group<-group_by(Data_Sub,SubjectID,ActivityLabel)
Average_Table<-summarise_each(Group,funs(mean))


write.table(Average_Table,"Analysis.txt" ,row.name=FALSE)


####################################################################################################################
