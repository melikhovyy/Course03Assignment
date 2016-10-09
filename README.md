# Assignemnet for Coursera course: "Getting and Cleaning Data" Week 4
This repo contains two scripts:

<downloadAndUnzipDataset.R>
This script is used to download and unzip the file containing the dataset. Both the archive and the unziped data are stored in the <./data> foler.

<run_analysis.R>
This script uses the data stored in the <./data> folder. The following steps are applied to the data:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
6. Save this data set
