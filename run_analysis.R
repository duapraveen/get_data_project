require(dplyr)

featurenames <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
activitynames <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

testsubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
testactivities <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
testfeatures <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
colnames(testfeatures) <- featurenames$V2
testfeatures$subject <- testsubjects$V1
testfeatures$activity <- testactivities$V1

trainsubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
trainactivities <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
trainfeatures <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
colnames(trainfeatures) <- featurenames$V2
trainfeatures$subject <- trainsubjects$V1
trainfeatures$activity <- trainactivities$V1

# Step 1 : Combine the test and train dataframes
comboDF <- rbind(testfeatures, trainfeatures)

# Step 2 : keep only the mean and std  columns (and subject and activity record identifiers)
mn <- grep("mean",names(comboDF))
std <- grep("std",names(comboDF))
subsetDF[,c(std, mn, 562, 563)] 

# Step 3 : Use descriptive activity names (add a column "activitydescr" which is descriptive activity name)
subsetDF <- mutate(subsetDF, activitydescr = factor(activity, labels = activitynames$V2))

# Step 4 : label the dataset with descriptive cariable names
# already done above with colnames(trainfeatures) and colnames(testfeatures) <- featurenames$V2 prior to merge




