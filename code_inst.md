**Getting and Cleaning data code instructions**
**Data**
Download data from UCI HAR Dataset Machine learning repository. 
**Load R Libraries**
Load R libraries such as library(data.table) & library(dplyr) to extract, clean and organize data 
**Data loading and processing**
Load the desired data and merge the training and test datasets to build a complete single dataset. Use the complete dataset to extract the variables with mean and standard deviation. 
**Label the Dataset with Descriptive Variable Names**
By examining the extracted dataset, we can change the abbreviations as follows: 
    Acc to Accelerometer
    Gyro to Gyroscope
    BodyBody to Body
    Mag to Magnitude
    Character f to Frequency
    Character t to Time
**Save tidy dataset**
Save tidy dataset with average of each variable, by activity and subject
