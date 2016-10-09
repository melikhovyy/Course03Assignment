# This script uses the data stored in the <./data> folder 
# The following steps are applied to the data:
#    1) Merges the training and the test sets to create one data set.
#    2) Extracts only the measurements on the mean and standard deviation for each measurement.
#    3) Uses descriptive activity names to name the activities in the data set
#    4) Appropriately labels the data set with descriptive variable names.
#    5) From the data set in step 4, creates a second, independent tidy data set with the
#       average of each variable for each activity and each subject.
#    6) Save this data set
#
# For more details see:
#    1) The website where the data were obtained:
#       http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#    2) The desctiption located with the data (either in the folder <./data> or 
#       from the website):
#       https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#    3) The instructions from the Coursera course: "Getting and Cleaning Data" Week 4
#

# dplyr library will be used
library(dplyr)

# store the list of the zipped files with path; to be used later
listOfZippedFiles <- unzip("./data/DataSet.zip", list=TRUE)
print(listOfZippedFiles[[1]])

# load file to be used for column names in Xtrain
featuresNames <- read.csv(
  file=paste("./data/",listOfZippedFiles[[2,1]], sep=""), 
  header=0,
  sep=" "
)

# identify columns numbers which have -mean() and -std() in their names
posFeaturesWithMeanAndStd <- grep("-mean\\(\\)|-std\\(\\)",featuresNames[[2]])

# load file to be used for activity names instead of numbers
activityNames <- read.csv(
  file=paste("./data/",listOfZippedFiles[[1,1]], sep=""), 
  header=0,
  sep=" "
)

# load three files related to the training dataset
# read.table is used as read.fwf (fixed width column) is too slow to read 63Mb
trainDataSetSubject <- read.csv(
  file=paste("./data/",listOfZippedFiles[[30,1]], sep=""),
  header=FALSE,
  skip=0,
  col.names="subject"
)
trainDataSetXtrain <- read.table(
  file=paste("./data/",listOfZippedFiles[[31,1]], sep=""),
  header=FALSE,
  skip=0,
  col.names=featuresNames[[2]]
)
trainDataSetYtrain <- read.csv(
  file=paste("./data/",listOfZippedFiles[[32,1]], sep=""),
  header=FALSE,
  skip=0,
  col.names="activitylabels"
)


# load three files related to the test dataset
# read.table is used as read.fwf (fixed width column) is too slow to read 25Mb
testDataSetSubject <- read.csv(
  file=paste("./data/",listOfZippedFiles[[16,1]], sep=""),
  header=FALSE,
  skip=0,
  col.names="subject"
)
testDataSetXtrain <- read.table(
  file=paste("./data/",listOfZippedFiles[[17,1]], sep=""),
  header=FALSE,
  skip=0,
  col.names=featuresNames[[2]]
)
testDataSetYtrain <- read.csv(
  file=paste("./data/",listOfZippedFiles[[18,1]], sep=""),
  header=FALSE,
  skip=0,
  col.names="activitylabels"
)

# several steps combined here to avoid unnecessary creation of temporal variables: 
# 1) merge training and test datasets and at the same time extract only
#    the measurements on the mean and standard deviation for each measurement,
#    i.e. use posFeaturesWithMeanAndStd created earlier
#    (by the way, merge in this case is a simple append)
# 2) arrange by activitylabels and subject
# 3) convert number for activitylabels into descriptiove names from the earlier
#    created variable activityNames
mergedCompleteDataSet <- 
  rbind(
    cbind(
      cbind(trainDataSetSubject,trainDataSetYtrain),
      # here only selected columns are extracted 
      trainDataSetXtrain[posFeaturesWithMeanAndStd]
    ),
    cbind(
      cbind(testDataSetSubject,testDataSetYtrain),
      # here only selected columns are extracted
      testDataSetXtrain[posFeaturesWithMeanAndStd]
    ) ) %>%
  arrange(activitylabels, subject) %>%
  mutate(activitylabels = factor(
    activitylabels,
    labels=as.vector(activityNames[[2]])) )

# tidy column names:
# 1) remove "." in the column names
# 2) convert everything into lower case 
#    personally, not sure that I like this way of tidiness
colnames(mergedCompleteDataSet) <- tolower(gsub("\\.","",colnames(mergedCompleteDataSet)))

# using the mergedCompleteDataSet, new data set is created:
# with the average of each variable for each activity and each subject
mergedSummarizedDataSet <- 
  mergedCompleteDataSet %>%
  group_by(activitylabels, subject) %>%
  summarise_each(funs(mean(., na.rm=TRUE)), -activitylabels)

# save the obtained mergedSummarizedDataSet as CSV-file
write.table(mergedSummarizedDataSet, file="ATidyDataset.csv", quote=FALSE, row.names = FALSE)

# save column names of the obtained mergedSummarizedDataSet as TXT-file
write.table(colnames(mergedSummarizedDataSet), file="columnNames.txt", quote=FALSE, row.names = FALSE, col.names = FALSE)
