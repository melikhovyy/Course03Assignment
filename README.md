# Assignemnet for Coursera course: "Getting and Cleaning Data" Week 4
This repo contains two scripts, a CodeBook, a resultant tidy data set, and a file containg a list of columns:

**downloadAndUnzipDataset.R**
This script is used to download and unzip the file containing the dataset. Both the archive and the unziped data are stored in the **./data** folder.

**run_analysis.R**
This script uses the data stored in the **./data** folder. The following steps are applied to the data:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Save this data set

**CodeBook.md**
This file contains code book to describes the variables, the data, and any transformations or work that were performed to clean up the data.

**ATidyDataset.csv**
This file contains a resultant tidy data set.

**columnNames.txt**
This file containg a list of columns to be used with the resultant tidy data set.
