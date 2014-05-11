library(reshape2)

read_set <- function(set_type){
        set_path <- paste0("./UCI HAR Dataset/",set_type,"/")
        inertial_subdir <- "Inertial Signals/"
        
        #define filenames for set_type: "train" or "test"
        subjects <- paste0(set_path,"subject_",set_type,".txt")
        X <- paste0(set_path,"X_",set_type,".txt")
        y <- paste0(set_path,"y_",set_type,".txt")
        #recursively define filenames for body_acc, body_gyro, total_acc inertial data over x,y,z axes
        axes <- c("x","y","z")
        inertial <- c("body_acc_","body_gyro_","total_acc_")
        inertial_signals <- integer(0)
        for(i in 1:3){
          for (j in 1:3){
            inertial_signals[3*(i-1)+j] <- paste0(set_path,inertial_subdir,inertial[i],axes[j],"_",set_type,".txt")
          }
        }
        
        #readfiles into tables
        subject <- read.table(subjects)
        X <- read.table(X)
        y <- read.table(y)
        #readtables containing inertial signals
        inertial_signals_table <- read.table(inertial_signals[1])
        for(i in 2:9){
          inertial_signals_table <- cbind(inertial_signals_table,read.table(inertial_signals[i]))
        }
        
        #merge tables into dataframe, add column defining set_type: "train" or "test"
        
        #---Column order
        #   1:561 -> X features
        #   562:1713 -> inertial_signals
        #   1714 -> set_type
        #   1715 -> subject
        #   1716 -> activity
        data.frame(X,inertial_signals_table,subject,y)
}

select_meanstd <- function(dataset){
      #load features names
      file <- "./UCI HAR Dataset/features.txt"
      features <- read.table(file)
      
      #extract features containing mean() or std() measures
      feat_vec <- features[grep("mean\\(\\)|std\\(\\)",features$V2),1]
      feat_names <- features[grep("mean\\(\\)|std\\(\\)",features$V2),2]
      
      #select for X features only columns of interest, preserve cols for subject,activity,set_type
      dataset <- dataset[,c(feat_vec,c(1714:1715))]
      n <- c(as.character(feat_names),"subject","activity")
      colnames(dataset) <- n
      dataset
}

name_activities <-function(dataset){
      #load activity labels
      file <- "./UCI HAR Dataset/activity_labels.txt"
      activities_labels <- read.table(file)
      
      #merge id with labels table
      dataset <- merge(activities_labels,data, by.x="V1", by.y="activity")
      
      #set column names
      colnames(dataset)[1:2] <- c("activity_id","activity")
      dataset
}

update_levels <- function(dataset){
      #load activity labels
      file <- "./UCI HAR Dataset/activity_labels.txt"
      activities_labels <- read.table(file)     
      lev <- as.character(activities_labels$V2[order(activities_labels$V1)])
      
      dataset$activity <- factor(dataset$activity, levels=lev)
      #drop unnencessary activity_id column
      dataset[,-1]
  
}

reshape_dataset <- function(dataset){
      melted <- melt(dataset, id=c("subject","activity"))
      dcast(melted, subject+activity ~ variable,mean)
}



#Step 1
train_set <- read_set("train")      #load training set
test_set <- read_set("test")        #load test set
data <- rbind(train_set,test_set)   #append training and test set into single data set

#Step 2
data <- select_meanstd(data)        #select mean and std columns, keep subject,activity,assign column names

#Step 3
data <- name_activities(data)       #import activity labels

#Step 4
data <- update_levels(data)         #redefine levels for activities coeherently with activity_labels.txt

#Step 5
average_data <- reshape_dataset(data)    #average of features per each subject and activity


