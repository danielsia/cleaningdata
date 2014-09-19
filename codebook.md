
Codebook of the variables in the dataset

There are 81 variables and 180 observations.

The first variable is the subject. Since there are 30 subjects, we number them 1 to 30. Each subject is given a different number.
The second variable is activity. There are six activities that each subject does, namely walking, walking upstairs, walking downstairs, sitting, standing and laying.
These are all labelled clearly in the dataset. Since each subject does all six activities and there are 30 subjects, it explains why there are 180 observations. 
The other 79 variables are all labelled in the form "-A- -B- -C-", where A, B, C are different things. A could be tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro,
tBodyGyroJerk, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag,
fBodyBodyGyroMag, fBodyBodyGyroJerkMag, and are all representing the measurement of something on the body, which is specified in the name itself.
 B could either be mean, mean freq, or std of the measurement. C is either x, y, z, representing the axial signal in that particular direction.

In particular, it should be noted that all the values in these 79 variables are the averages of the variables for each subject and each activity, since 
a subject could have done a particular activity more than once. We are only interested in the average of each variable for each subject and activity.