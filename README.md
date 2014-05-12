#Getting dataset from Samsung Galaxy S accelerometers data


Script **run_analyisis.r** has been deevloped for the course project **"Getting and Cleaning Data"** available on coursera.org.

**Pre-requisites** to succesfully launch the script are:
<ol>
<li>Download data at this link: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)</li>
<li>Save zip file in the working directory, together with **run_analyisis.r**</li>
<li>Unzip the file so that directory **"UNCI HAR Dataset"**, containing the data, is created under the working directory</li>
</ol>


Script **run_analyisis.r** does the following. 
<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set.</li>
<li>Appropriately labels the data set with descriptive activity names.</li>
<li>Creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>

##Description of the script 

Script **run_analyisis.r** has a main section at its bottom:

```
#Generate dataset
data <- generate_dataset()

#Generate and save tidy dataset
tidy_dataset <- generate_tidy_dataset(data)
write.csv(tidy_dataset,"tidy_dataset.csv")
```

This section generates of code generates two dataset:
<ul>
<li>**data** dataframe, cotaining observations for different observations for subjects performing different activities</li>
<li>**tidy_dataset** dataframe, cotaining average values of measures for each subject and each activity</li>
</ul>

Script **run_analyisis.r** includes functions whose structure in call order is:
<ul>
<li>**generate_dataset**: calls functions here below in approrpiate order and returns **data**. Before returning the dataframe, the function re-orders the columns in a meaningful order.</li>
<ul>
<li>**read_set**: loads the data from the source files and generates a single dataframe</li>
<li>**select_meanstd**: selects only measurements on the mean and standard deviation.</li>
<li>**name_activities**: updates activities in the data set with descriptive names</li>
<li>**update_levels**: redefines factor levels for the activity names so that the underlying numeric class of factors is consistent with labelling as defined in the input file **activity_labels.txt**</li>
</ul>
<li>**generate_tidy_dataset**: Creates a second, independent tidy data set with the average of each variable for each activity and each subject</li>
</ul>

#Level1

The main code calls 







