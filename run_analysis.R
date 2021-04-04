## load libraries 

library(data.table)
library(dplyr)

## retrieve Names and labels 

feature_Names <- read.table("UCI HAR Dataset/features.txt")
activity_Labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

## retrieve training data e.g. subject, activity, and features 

subject_Train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activity_Train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
features_Train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

## retrieve test  data e.g. subject, activity, and features 

subject_Test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activity_Test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
features_Test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

## collect data by binding train and test data

subject <- rbind(subject_Train, subject_Test)
activity <- rbind(activity_Train, activity_Test)
features <- rbind(features_Train, features_Test)

colnames(features) <- t(feature_Names[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

## complete data set
## 1. Merges the training and the test sets to create one data set.
complete_Data <- cbind(features,activity,subject)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

MeanSTD <- grep(".*Mean.*|.*Std.*", names(complete_Data), ignore.case=TRUE)
required_Data <- c(MeanSTD, 562, 563)
dim(complete_Data)

## 4. Appropriately labels the data set with descriptive activity names.
## Extract desired data set 
data_Set <- complete_Data[,required_Data]
dim(data_Set)

data_Set$Activity <- as.character(data_Set$Activity)
for (i in 1:6){
  data_Set$Activity[data_Set$Activity == i] <- as.character(activityLabels[i,2])
}

data_Set$Activity <- as.factor(data_Set$Activity)

names(data_Set)

names(data_Set)<-gsub("Acc", "Accelerometer", names(data_Set))
names(data_Set)<-gsub("Gyro", "Gyroscope", names(data_Set))
names(data_Set)<-gsub("BodyBody", "Body", names(data_Set))
names(data_Set)<-gsub("Mag", "Magnitude", names(data_Set))
names(data_Set)<-gsub("^t", "Time", names(data_Set))
names(data_Set)<-gsub("^f", "Frequency", names(data_Set))
names(data_Set)<-gsub("tBody", "TimeBody", names(data_Set))
names(data_Set)<-gsub("-mean()", "Mean", names(data_Set), ignore.case = TRUE)
names(data_Set)<-gsub("-std()", "STD", names(data_Set), ignore.case = TRUE)
names(data_Set)<-gsub("-freq()", "Frequency", names(data_Set), ignore.case = TRUE)
names(data_Set)<-gsub("angle", "Angle", names(data_Set))
names(data_Set)<-gsub("gravity", "Gravity", names(data_Set))

# 3. Uses descriptive activity names to name the activities in the data set
names(data_Set)

data_Set$Subject <- as.factor(data_Set$Subject)
data_Set <- data.table(data_Set)
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_Data <- aggregate(. ~Subject + Activity, data_Set, mean)
tidy_Data <- tidy_Data[order(tidy_Data$Subject,tidy_Data$Activity),]
write.table(tidy_Data, file = "tidy_Data.txt", row.names = FALSE)

