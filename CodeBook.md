# Code Book

The original data were downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 
For more details see:
1. The website where the data were obtained:
   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. The desctiption located with the data (either in the folder **./data** or from the website):
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. The instructions from the Coursera course: "Getting and Cleaning Data" Week 4

The following steps were applied to the data to clean and extract the only required information:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The intermediate (complete) data set is named
**mergedCompleteDataSet**

The final data set with the average of each variable for each activity and each subject is named **mergedSummarizedDataSet**.
It is saved in a file named **ATidyDataset.csv** and it contains:
180 observations and 68 columns.

The columns are listed below and in the file **columnNames.txt**


-----------------
activitylabels
subject
tbodyaccmeanx
tbodyaccmeany
tbodyaccmeanz
tbodyaccstdx
tbodyaccstdy
tbodyaccstdz
tgravityaccmeanx
tgravityaccmeany
tgravityaccmeanz
tgravityaccstdx
tgravityaccstdy
tgravityaccstdz
tbodyaccjerkmeanx
tbodyaccjerkmeany
tbodyaccjerkmeanz
tbodyaccjerkstdx
tbodyaccjerkstdy
tbodyaccjerkstdz
tbodygyromeanx
tbodygyromeany
tbodygyromeanz
tbodygyrostdx
tbodygyrostdy
tbodygyrostdz
tbodygyrojerkmeanx
tbodygyrojerkmeany
tbodygyrojerkmeanz
tbodygyrojerkstdx
tbodygyrojerkstdy
tbodygyrojerkstdz
tbodyaccmagmean
tbodyaccmagstd
tgravityaccmagmean
tgravityaccmagstd
tbodyaccjerkmagmean
tbodyaccjerkmagstd
tbodygyromagmean
tbodygyromagstd
tbodygyrojerkmagmean
tbodygyrojerkmagstd
fbodyaccmeanx
fbodyaccmeany
fbodyaccmeanz
fbodyaccstdx
fbodyaccstdy
fbodyaccstdz
fbodyaccjerkmeanx
fbodyaccjerkmeany
fbodyaccjerkmeanz
fbodyaccjerkstdx
fbodyaccjerkstdy
fbodyaccjerkstdz
fbodygyromeanx
fbodygyromeany
fbodygyromeanz
fbodygyrostdx
fbodygyrostdy
fbodygyrostdz
fbodyaccmagmean
fbodyaccmagstd
fbodybodyaccjerkmagmean
fbodybodyaccjerkmagstd
fbodybodygyromagmean
fbodybodygyromagstd
fbodybodygyrojerkmagmean
fbodybodygyrojerkmagstd

