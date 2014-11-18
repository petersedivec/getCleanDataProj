## GetCleanData Project
# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

# Download original UCI_HAR_Dataset from the UCI Machine Learning Repository
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

# load in features list and activity labels
al <- read.table("./UCI_HAR_Dataset/activity_labels.txt")
f <- read.table("./UCI_HAR_Dataset/features.txt", sep=" ")

# identify mean() and std() features as defined in dataset
fmi <- grep("mean()", f[,2], fixed = T) # indicies in feature vector of mean()
fsi <- grep("std()", f[,2], fixed = T) # indicies in feature vector of std()
dim(f) # check the dimensions of f to see how many features we care about
fnames <- f[c(fmi,fsi),2] # store the mean() and std() descriptive names

# load test data set
sub_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt")
y_test <- read.table("./UCI_HAR_Dataset/test/y_test.txt")
x_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt")
dim(x_test) #look at overall dimension of dataset

# load train data set
sub_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt")
y_train <- read.table("./UCI_HAR_Dataset/train/y_train.txt")
x_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt")

# extract mean & std for test & training measurement sets [Step 2]
x_test_msd <- x_test[,c(fmi,fsi)]
x_train_msd <- x_train[,c(fmi,fsi)]

# merge two datasets, first merge individual sets, then merge test & train [Step 1]
test_set <- cbind(sub_test, y_test, x_test_msd)
train_set <- cbind(sub_train, y_train, x_train_msd)
data_set <-rbind(test_set, train_set)

# label columns with descriptive feature names [step 4]
colnames(data_set)<-c("subject", "activity", as.character(fnames))

# label activities with descriptive names
install.packages("Kmisc")
library(Kmisc)
data_set[,2]<-swap(data_set[,2],al[,1],al[,2])

# reshape data into tall skinny set and then use dcast to take the mean across
# subject / activity [Step 5]
install.packages("reshape2")
library(reshape2)
skinny<-melt(data_set, id=c("subject","activity"), measure.vars=as.character(fnames))
tidyset<-dcast(skinny,subject+activity ~ variable, mean)

# write the tidy data set to a file
write.table(tidyset, file = "tidy_dataset.txt", row.names=FALSE)
