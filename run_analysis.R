
## Create one R script called run_analysis.R that does the following:

## 1. Merges the training and the test sets to create one data set.

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## 3. Uses descriptive activity names to name the activities in the data set

## 4. Appropriately labels the data set with descriptive activity names.

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#load zip
filename<-"test.zip"
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(fileurl,filename,method = "curl")

if(!file.exists("UCI HAR Dataset")){
  unzip("test.zip")
}

#library.package
library(reshape2)

#read activity_labels & features
activity_labels<-read.table("./activity_labels.txt")[,2]

features<-read.table("./features.txt")[,2]


#read, rename colname and extracts "mean" & "standard deviation" for each measurement from x_test & x_train

x_test<-read.table("./test/X_test.txt")
x_test<-x_test[colnames(x_test)%in%paste0("V",grep("mean[()]+|std",features)) ] 
colnames(x_test)<-c(grep("mean[()]+|std",features,value = T))

x_train<-read.table("./train/X_train.txt")
x_train<-x_train[colnames(x_train)%in%paste0("V",grep("mean[()]+|std",features)) ] 
colnames(x_train)<-c(grep("mean[()]+|std",features,value = T))

#read and rename colname for y_test & y_train
y_test<-read.table("./test/Y_test.txt")
y_train<-read.table("./train/Y_train.txt")

names(y_test)<-c("activity_labels")
names(y_train)<-c("activity_labels")

#read and rename colname for subject_test & subject_train
subject_test<-read.table("./test/subject_test.txt") 
subject_train<-read.table("./train/subject_train.txt")

names(subject_test)<-c("subject")
names(subject_train)<-c("subject")

#combine dataset
test<-cbind(subject_test,y_test,x_test)
train<-cbind(subject_train,y_train,x_train)

output<-rbind(test,train)

#replace level with activity_labels
output[,2]<-as.factor(output[,2])
levels(output[,2])<-activity_labels
output[,2]<-tolower(output[,2])


id_labels   = c("subject", "activity_labels")
output_labels = setdiff(colnames(output),id_labels)
melt_output<-melt(output,id.vars=id_labels,measure.vars = output_labels )

#second dataset using dcast
tidy_output<-dcast(melt_output,subject+activity_labels~variable,mean)

#write text
write.table(tidy_output,"./tidy_data.txt")







