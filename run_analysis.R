##Set working directory where the UCI HAR dataset has been unzipped into.
setwd("C:/Users/Daniel/Desktop/Data Science/R Programming")

##reading the data. 
xtest <- read.table("./data/test/X_test.txt")
ytest <- read.table("./data/test/y_test.txt")
subjecttest <- read.table("./data/test/subject_test.txt")
xtrain <- read.table("./data/train/X_train.txt")
ytrain <- read.table("./data/train/y_train.txt")
subjecttrain <- read.table("./data/train/subject_train.txt")
labels <- read.table("./data/activity_labels.txt")
features <- read.table("./data/features.txt")

##part 1: merging the data
test <- cbind(xtest, subjecttest, ytest)
train <- cbind(xtrain, subjecttrain, ytrain)
data <- rbind(test, train)
featurelabels <- t(features)
colnames(data)[1:561] <- featurelabels[2,]
colnames(data)[562] <- "subject"
colnames(data)[563] <- "activity"

##part 2: extracting only measurements with mean and standard deviation
#Note that I extracted the mean and std values, and also included mean frequency.
s <-grep("mean", features[,2])
t <- grep("std", features[,2])
df <- cbind (data[s], data[t], data[,562], data[,563])
colnames(df)[80] <- "subject"
colnames(df)[81] <- "activity"

##part 3: label activities with descriptive activity names
df$activity <- factor(df$activity, levels = c(1, 2, 3, 4, 5, 6), labels = c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying"))

##part 4: I had already labelled the variables in part 2 using the features.txt
#For example, in the first column with name "tBodyAcc-mean()-X" would refer to the mean of the acceleration of the body on the x-axis of the phone.

##part 5: creating a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
avg_values <- ddply(df, c("subject", "activity"), numcolwise(mean))
##Note that the value for each variable is the average for that variable for that particular subject and activity.

write.table(avg_values, file="./data/averages.txt", row.names = FALSE)

