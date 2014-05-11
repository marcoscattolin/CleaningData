read_set <- function(set_type){
        set_path <- paste0("./UCI HAR Dataset/",set_type,"/")
        inertial_subdir <- "Inertial Signals/"
        
        #define set filenames
        subjects <- paste0(set_path,"subject_",set_type,".txt")
        X <- paste0(set_path,"X_",set_type,".txt")
        y <- paste0(set_path,"y_",set_type,".txt")
        
        axes <- c("x","y","z")
        inertial <- c("body_acc_","body_gyro_","total_acc_")
        inertial_signals <- integer(0)
        for(i in 1:3){
          for (j in 1:3){
            inertial_signals[3*(i-1)+j] <- paste0(set_path,inertial_subdir,inertial[i],axes[j],"_",set_type,".txt")
          }
        }
        
        #readtables
        subject <- read.table(subjects)
        X <- read.table(X)
        y <- read.table(y)
        #readtables with inertial signals
        inertial_signals_table <- read.table(inertial_signals[1])
        for(i in 2:9){
          inertial_signals_table <- cbind(inertial_signals_table,read.table(inertial_signals[i]))
        }
        #merge in single dataframe
        set_type <- gl(1,1,length(subjects),set_type)   #add column defining type of set
        data.frame(set_type,subject,y,X,inertial_signals_table)
}


train_set <- read_set("train")
test_set <- read_set("test")
data <- rbind(train_set,test_set)



