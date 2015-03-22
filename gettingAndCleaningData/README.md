# Readme.md
####This readme provides information about run_Analysis.R


The script "run_Analysis.R" was created to fulfill the course project requirements of Johns Hopkins' Getting and Cleaning Data course.  The code is broken down into four distinct sections.  An overview of each section is provided below:
<br />

1. OPEN FILES - opens all of the necessary files from the UCI HAR Dataset (listed below) and assigns them to distinct dataframes
  * "test/subject_test.txt"
  * "test/X_test.txt"
  * "test/y_test.txt"
  * "train/subject_train.txt"
  * "train/X_train.txt"
  * "train/y_train.txt"
  * "features.txt"
  * "activity_labels.txt"
2. MERGING - merges Activity and Subject data to the test and training datasets and then merges the two datasets together.  The result is a single dataframe comprising test and training data
3. RESHAPING - creates new dataframe comprising only mean and standard deviation related variables from the merged dataset 
4. CREATE TIDY - creates independent tidy dataset ("tidyData.txt") which comprises the average of each variable for each activity and each subject.


