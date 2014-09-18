This R script submitted here basically does the following steps in order:

1) It accesses the working directory where the UCI HAR dataset on the wearable computing data has been downloaded to. 

2) It reads the data from the working directory into R, so that we can explore it. The read.table function is used here.

3) It merges the data into one data frame.
To merge the data, I had to look at the dimensions of each individual dataset, to try and figure out how the data could be merged together nicely. 
Since there were 2947 observations in each of the X_test, subject_test, y_test datasets, it suggested to me that they should column-binded together, calling it "test".
This also applied to the X_train, subject_train, y_train datasets, which had 7352 observations each, so I columnbinded it together, calling it "train".
Since there were now 563 variables in the test and train datasets that I had just merged, I figured that these two datasets should rowbinded together.
This formed the one large dataset comprising 10299 variables and 563 variables. 

4) Now I had to extract only measurements on the mean and standard deviation of each measurement.
This was slightly more challenging, but it made sense to first label each of the first 561 variables, by assigning the names in the second row of transposed features dataset
to the column names of the one large dataset, named data. The last two variables were labelled "subject" and "activity" respectively.
Thereafter I could match the variables with mean and std in their names using the grep function and assign it a letter. 
I subsetted the large dataset, keeping all these variables with mean and std, bearing in mind to keep the subject and activity columns too.

5) I labelled all the values of activity by creating a factor variable for 1 to 6, and labelling each of these numbers with the corresponding activity.

6) As done in part 4, I had already appropriately labeled all the variable names using the transposed features dataset, so this remained even after subsetting.

7) I split the dataset by subject and activity and calculated the mean/average of each variable.
For this, I used the ddply function, which splits the dataframe by the variables I inputed, performs the function on each of the split dataframes, and then forms
a dataframe as an output. For the function, I used numcolwise(mean), which performs the function mean on all numeric values in each column, therefore calculating
the average of each variable in the split dataframe (ie for each subject and each activity)

The above is basically an explanation of why the script works.


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