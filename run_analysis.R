library(data.table)
library(reshape2)

# Download and unzip file

#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url,destfile = "data.zip")
#unzip(zipfile = "data.zip")

# Activity labels and features 

activitylabels <- fread(file.path(getwd(), "UCI HAR Dataset/activity_labels.txt"), col.names = c("number", "activityname"))

features <- fread(file.path(getwd(), "UCI HAR Dataset/features.txt"), col.names = c("number", "featurename"))
featuresfilter <- grep("(mean|std)\\(\\)", features[, featurename])
keyfigures <- features[featuresfilter, featurename]
keyfigures <- gsub('\\(', '', gsub('\\)', '', keyfigures))

# Train data

traindata <- fread(file.path(getwd(), "UCI HAR Dataset/train/X_train.txt"))[, featuresfilter, with = FALSE]
setnames(traindata, colnames(traindata), keyfigures)

activitytrain <- fread(file.path(getwd(), "UCI HAR Dataset/train/Y_train.txt"), col.names = c("activity"))
subjecttrain <- fread(file.path(getwd(), "UCI HAR Dataset/train/subject_train.txt"), col.names = c("subject"))
train <- cbind(subjecttrain, activitytrain, traindata)

# Test data

testdata <- fread(file.path(getwd(), "UCI HAR Dataset/test/X_test.txt"))[, featuresfilter, with = FALSE]
setnames(testdata, colnames(testdata), keyfigures)
activitytest <- fread(file.path(getwd(), "UCI HAR Dataset/test/Y_test.txt"), col.names = c("activity"))
subjecttest <- fread(file.path(getwd(), "UCI HAR Dataset/test/subject_test.txt"), col.names = c("subject"))
test <- cbind(subjecttest, activitytest, testdata)

# Train and test data together

tidydata <- rbind(train, test)
tidydata$activity <- factor(tidydata$activity, levels = activitylabels$number, labels = activitylabels$activityname)
tidydata$subject <- factor(tidydata$subject)


write.table(tidydata, file = "tidydata.txt", row.names = FALSE, col.names = TRUE, sep = '\t', quote = FALSE)

tidydata_average <- melt(tidydata,id = c("subject", "activity"))
tidydata_average <- dcast(tidydata_average, subject + activity ~ variable, mean)
write.table(tidydata_average, file = "tidydata_average.txt", row.names = FALSE, col.names = TRUE, sep = '\t', quote = FALSE)