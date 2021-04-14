**Project Description - Week 4 - Getting and Cleaning Data using R

This is Coursera Course project to implement R knowledge in fetching, extracting, and generating dity dataset from given UCI HAR Dataset. 
The repository comprised of R script (run_analysis.R), output resulted tidy data (tidy_data.txt) and instruction file (operation_manuel.md). 

R script peforms the following steps:
  1- Load R libraries. 
  2- Load the dataset from UCI HAR Dataset. 
    * load features names and activity labels 
    * load training and test dataset regarding subject, activity and features
    * Merge training and test dataset to build a single dataset into x(measurements, y(activity) and subject
  3- Read both the train and test datasets and merge them
  4- Extracts only the measurements on the mean and standard deviation for each measurement.
  5- Appropriately labels the data set with descriptive activity names as follows: 
    * "Acc", "Accelerometer"
    * "Gyro", "Gyroscope"
    * "BodyBody", "Body"
    * "Mag", "Magnitude"
    * "^t", "Time"
    * "^f", "Frequency"
    * "tBody", "TimeBody"
    * "-mean()", "Mean"
    * "-std()", "STD"
    * "-freq()", "Frequency"
    * "angle", "Angle"
    * "gravity", "Gravity"
   6- Extract data by selected columns(from step 4).
   7- Generate tidy dataset that consists of the average of each variable for each subject and activity. The result is saved in text format file (tidy_data.txt).
