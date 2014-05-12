##Getting dataset from Samsung Galaxy S accelerometers data

**run_analysis.R** generates two datasets: **data** and **tidy_dataset**

###Dataset **"data"**

First column fo the dataset **subject** contains numeric identifier of the subject for which the measures where taken.
Second column fo the dataset **activity** contains the name of the activity during witch measures were taken. Column is a factor whose levels are defined as:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


This dataset contains mean (ie. **-mean()-**) and standard deviation (ie. **-std()-**) measures for the following measures:

- tBodyAcc-XYZ (3 measures for x,y,z axes)
- tGravityAcc-XYZ (3 measures for x,y,z axes)
- tBodyAccJerk-XYZ (3 measures for x,y,z axes)
- tBodyGyro-XYZ (3 measures for x,y,z axes)
- tBodyGyroJerk-XYZ (3 measures for x,y,z axes)
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ (3 measures for x,y,z axes)
- fBodyAccJerk-XYZ (3 measures for x,y,z axes)
- fBodyGyro-XYZ (3 measures for x,y,z axes)
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

**Total variables are therefore 66**:
- 33 measures *em* times *em* 2 figures: mean and std

###Dataset **"tidy_dataset"**
Columns haev the same meaning as above. In this dataser though observations (ie. rows) contains the average of the measures that were taken for each subject.

For example row 1 defines for **subject = 1** and **activity = WALKING**
- tBodyAcc-mean()-X: the mean of al the body acceleration means over axis X measured when subject 1 was walking
- tBodyAcc-std()-X: the mean of al the body acceleration standard deviations over axis X measured when subject 1 was walking
- ...(and so on)



