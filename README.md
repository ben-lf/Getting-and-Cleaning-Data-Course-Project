# Getting-and-Cleaning-Data-Course-Project
Week 4 assignment repo

## Getting and Cleaning Data Course Project

### Purpose

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.
Review criterialess 
* the submitted data set is tidy.
* The Github repo contains the required scripts.
* GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
* The README that explains the analysis files is clear and understandable.
* The work submitted for this project is the work of the student who submitted it.

### Objectives

`run_analysis.R` does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis.R
-----------------

1. The **UCI HAR Dataset** data folder set should be unziped in the working directrory. 
2. Reshape2 package will be installed. All the datasets **activities labels**, **train** , **test** , **features** are loaded
3. A logical vector is created to get where the **mean** and **standard deviation** features are by using grepl  
4. Those wanted features are extracted from the datasets  
5. Y and X Datasets are combined using cbind
6. Steps 4 and 5 are done first for the **test** datasets then for the **train** datasets, creating **test_data** and **train_data** sets
7. Both datasets are combined
8. Data is melted (i-e the results columns are concatenated with one varable column for the features and a value column for the data itself)
9. The cast funtion is used to calculate the mean by Activity_Label and subject
10. The tidy_data.txt file is written used semicolon as separator
