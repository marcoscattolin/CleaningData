#Getting tidy dataset from Samsung Galaxy S accelerometers data


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

