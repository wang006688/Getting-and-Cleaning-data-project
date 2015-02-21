#This is the program for Coursera Getting and Cleaning data,JHU
#Firstly, load the packages we need
library(dplyr)
library(plyr)
# 1, get the data from different files and store them properly
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# merge the data and give the data to different names respectively
xdata <- rbind(x_train, x_test)
ydata <- rbind(y_train, y_test)
subjectdata <- rbind(subject_train,subject_test)

# 2, exract only the measurement on the mean and standard deviation for each measure
# firstly ,read the feature data we need 
features <- read.table("./UCI HAR Dataset/features.txt")
#use function grep get the columns of mean and std
mean_std <- grep("-(mean|std)\\(\\)",features[,2])
# get the data of x with the columns we want
xdata <- xdata[,mean_std]
#use the names in feature to name the names in xdata accordingly 
names(xdata) <- features[mean_std,2]

# 3, Use descriptive activity names to name the activities in the data set
#get the data in the activity labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
#rename the names of ydata from the activity names we get above
ydata[,1] <- activities[ydata[,1],2]

# 4, Appropriately label the data set with descriptive variable names

names(ydata) <- "activity"

names(subjectdata) <- "subject"

# 5, From the data set in step 4, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject

#combine the different data we get together to become tidy
fdata <- cbind(xdata,ydata,subjectdata)
# get the mean of the columns we need
meandata <- ddply(fdata,.(subject,activity),function(x) colMeans(x[,1:66]))

write.table(meandata,"all_data_averages.txt",row.name=FALSE)
