
# Load necessary packages. 
packages <- c("dplyr","reshape2")

# Check and install the package if it is not installed.
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

# Now load all the packages listed in 'packages' variable. One by one.
sapply(packages, require, character.only= TRUE)

#-----------
# Step 1, 

## Download and unzip the dataset:
filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Read each of the x_test, y_test, x_train, and y_train.
x_test <- read.delim("UCI HAR Dataset/test/x_test.txt", sep="", header = FALSE, as.is = TRUE, skipNul = TRUE)
y_test <- read.delim("UCI HAR Dataset/test/y_test.txt", sep="", header = FALSE)
subject_test <- read.delim("UCI HAR Dataset/test/subject_test.txt", sep="", header = FALSE)

x_train <- read.delim("UCI HAR Dataset/train/x_train.txt", sep="", header = FALSE, as.is = TRUE, skipNul = TRUE)
y_train <- read.delim("UCI HAR Dataset/train/y_train.txt", sep="", header = FALSE)
subject_train <- read.delim("UCI HAR Dataset/train/subject_train.txt", sep="", header = FALSE)

#Now, we can append x_train to the x_test to make a 'x' dataset including all test + train data
x <- rbind(x_test,x_train)

# similarly, append y_train to y_test to make a 'y' dataset including all test + train data
y <- rbind(y_test,y_train)

# And finally append the subject from test to the train to make a 'subject' variable
subject <- rbind(subject_test, subject_train)

# Now, we can bind x and y columnwise to make a single dataset.
tidy_data <- cbind(subject, y, x)

remove("filename","packages","subject","subject_test" , "subject_train" ,"x","x_test","x_train","y", "y_test","y_train")
#-----------
# For step 2, we first put proper name for each column in our dataset.
# Once they have name, we select those columns with 'mean' or 'std' in their name
#-----------
# Read feature names from respective file
# Note: The first part of this task is respond to the part of 4 of this assignment.
featureNames <- read.delim("UCI HAR Dataset/features.txt", header = FALSE,sep = " ",colClasses = c("NULL",NA))
labels <- matrix(unlist(featureNames), ncol = 1)
valid_labels <- make.names(labels, unique = TRUE, allow_ = TRUE)

# Adding label for "Y" data which is the indicator for the respected activity
names(tidy_data) <- c("Subject","Activity",valid_labels)

# Now, we can select only those features with mean or std.
tidy_data <- tidy_data %>% select(Subject, Activity, matches("mean()|std()", ignore.case=TRUE))

#-----------
# For step 3, we read descriptive activity names from 'activity_labels.txt' file
#-----------
descriptiveActivityNames <- read.delim("UCI HAR Dataset/activity_labels.txt", sep="", header = FALSE)

tidy_data <- merge(descriptiveActivityNames, tidy_data,by.y = "Activity",by.x = "V1")

#Removing activitycode from dataset
tidy_data$V1 <- NULL

tidy_data <- rename(tidy_data, Activity= V2)

#-----------
# For step 4,
#-----------
# We have already done this part in 2. Below 4 lines are response to this section. In part 2, for selecting features of
# 'mean' and 'std', we use their name.

# featureNames <- read.delim("UCI HAR Dataset/features.txt", header = FALSE,sep = " ",colClasses = c("NULL",NA))
# labels <- matrix(unlist(featureNames), ncol = 1)
# valid_labels <- make.names(labels, unique = TRUE, allow_ = TRUE)
# names(tidy_data) <- c("Subject","Activity",valid_labels)

#-----------
# For step 5,
#-----------

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.\
tidyData.melted <- melt(tidy_data, id = c("Subject", "Activity"))
tidyData.mean <- dcast(tidyData.melted, Subject + Activity ~ variable, mean)

write.table(tidyData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

# Clean up the memory
rm(list = ls(all.names = TRUE))
