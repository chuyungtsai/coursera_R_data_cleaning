# Download dataset
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile= 'dataset.zip')
unzip('./dataset.zip')
setwd("./UCI HAR Dataset")

# Input training and testing file
X_train <- read.delim('train/X_train.txt', sep ='', header=FALSE)
X_test <- read.delim('test/X_test.txt', sep ='', header=FALSE)

# Input features, extract second column and rename
features <- read.delim('features.txt', header=FALSE, sep='')
colnames(X_train)<- features$V2
colnames(X_test)<- features$V2

# extract the mean and standard deviation for each measurement using regular expression
names(X_train) # take a look at the name, extract only 'mean()', 'std()'
mean_names <-grep('mean()', names(X_train), fixed=TRUE, value=TRUE)
std_names <-grep('std()', names(X_train), fixed=TRUE, value=TRUE)
train_extract <- X_train[, c(mean_names, std_names)]
test_extract <- X_test[, c(mean_names, std_names)]

# Add subject and y_train(activity) to train data
subject_train <- read.table('train/subject_train.txt')
train_extract$subject <- subject_train$V1
activity <- read.table('train/y_train.txt')
train_extract$activity <- activity$V1

# Add subject and y_test(activity) to test data
subject_test <- read.table('test/subject_test.txt')
test_extract$subject <- subject_test$V1
activity <- read.table('test/y_test.txt')
test_extract$activity <- activity$V1

# Merge data
merge_data <- rbind(train_extract, test_extract)

# Step 3. convert activity to descriptive name
activity_labels <- read.table('activity_labels.txt', sep='', header=FALSE)
for (i in seq(nrow(merge_data))){
  num <- merge_data[i, 'activity']
  merge_data[i,'activity'] <- tolower(activity_labels[num, 'V2'])
}

# Step 4. edit the variable names
variables <- names(merge_data)
variables <- gsub('^t', 'timeof', variables)
variables <- gsub('^f', 'frequencyof', variables)
variables <- gsub('\\(\\)', '', variables)
variables <- gsub('\\-', '', variables)
names(merge_data) <-variables
write.csv(merge_data, 'cleaned_data_1.csv')

# secondary tidy data
library(dplyr)
summary <- merge_data %>% group_by(subject, activity) %>% summarise(across(everything(), list(mean)))
write.table(summary, 'cleaned_data_average.txt', row.names = FALSE)                                                                 
