# Data cleaning project for Coursera

In this code book you find the following information:
* used data
* transformation steps (with reference to run_analysis.R)
* stored variables

## used data

For this project I used the provided data about gyroscope data in mobile devices during activities (found in ```UCI HAR Dataset```). About the content of the original data please refer to the provided sources in the mentioned directory.

## transformation steps

* ```The first 12 lines``` of code read the test and train datasets. For each dataset the measurements (X), the activities (Y) and the test subjects (subject) are read from the files and afterwards concatenated to one single dataset containing the test subject, the activity and the measurements.
* ```Line 14``` merges the train and test datasets to one big dataset as **required in task 1**.
* ```Lines 16 and 17``` read the headers of the data and assign it to the data names as **required in task 4**.
* ```Line 19``` changes the entry for activity name to a more descriptive name as **required in task 3**. Unfortunately I couldn't find out which activity number belongs to which activity of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. These names could be easily exchanged in ```activity_names.R```.
* ```Line 21``` extracts only the mean and standard deviation for each measurement from the original data as **required in task 2**.
* ```Line 23``` groups the data by test subject and activity, calculates the mean for every group and stores this in a new data object as **required in task 5**.
* ```Line 25``` stores the tidy data using the ```write.table``` command as **required by the exercise**.

## stored variables

* ```test_data_X``` Measurements of the test dataset
* ```test_data_Y``` Activities of the test dataset
* ```test_subject``` Test subjects to the test dataset
* ```test_data``` Combined test dataset with test subject, activity and measurements
* ```train_data_X``` Measurements of the train dataset
* ```train_data_Y``` Activities of the train dataset
* ```train_subject``` Test subjects to the train dataset
* ```train_data``` Combined train dataset with test subject, activity and measurements
* ```data``` Merged dataset of train and test data
* ```data_lables``` Lables of the data variables extracted from the file ```features.txt```
* ```data_mean_sdt``` Cleaned dataset with only mean and standard deviation of every measurement
* ```tidy_data``` Tidy dataset with a mean value for every variable for every combination of test subject and activity.
