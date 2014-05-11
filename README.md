Getting tidy dataset from Samsung Galaxy S accelerometers data
==============================================================

Script **run_analyisis.r** has been deevloped for the course project **"Getting and Cleaning Data"** available on coursera.org.

**Pre-requisites** to succesfully launch the script are:
1. Download data at this link: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Save zip file in the working directory, together with **run_analyisis.r**
3. Unzip the file so that directory **"UNCI HAR Dataset"**, containing the data, is created under the working directory


Script **run_analyisis.r** does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.




```r
summary(cars)
```

```
##      speed           dist    
##  Min.   : 4.0   Min.   :  2  
##  1st Qu.:12.0   1st Qu.: 26  
##  Median :15.0   Median : 36  
##  Mean   :15.4   Mean   : 43  
##  3rd Qu.:19.0   3rd Qu.: 56  
##  Max.   :25.0   Max.   :120
```


