


## Needs to be changed to run for someone else
filesPath <- "C:/Users/kiera/Documents/R/course/cleaning/project"
setwd(filesPath)
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

###Unzip it into a data directory
unzip(zipfile="./data/Dataset.zip",exdir="./data")


setwd("data/UCI HAR Dataset")

features <- read.csv('./features.txt', header = FALSE, sep = ' ')
## Make a vector of strings from the dataframe
features <- as.character(features[,2])

## Could use read.csv rather than read.table, but this file is rather big
df_train_X <- read.table('./train/X_train.txt')
df_train_Y <- read.csv('./train/y_train.txt', header = FALSE, sep = ' ')
df_train_subject <- read.csv('./train/subject_train.txt',header = FALSE, sep = ' ')

df_train <-  data.frame(df_train_subject, df_train_Y, df_train_X)
start_of_vector <- c('subject', 'activity')
names(df_train) <- append ( start_of_vector,  features)

## Could use read.csv rather than read.table, but this file is rather big
df_test_X <- read.table('./test/X_test.txt')
df_test_Y <- read.csv('./test/y_test.txt', header = FALSE, sep = ' ')
df_test_subject <- read.csv('./test/subject_test.txt', header = FALSE, sep = ' ')

df_test <-  data.frame(df_test_subject, df_test_Y, df_test_X)
names(df_test) <- append ( start_of_vector,  features)

df_all <- rbind(df_train, df_test)


## Do a grep from the features vector, then we know the positions to pull from, but add 2 as 
## Subject and activity is prepended at the begining

col_select <- grep('mean|std', features)
data_sub <- df_all[,c(1,2,col_select + 2)]


activity_labels <- read.csv('./activity_labels.txt', header = FALSE, sep = ' ')
activity_labels <- as.character(activity_labels[,2])
data_sub$activity <- activity_labels[data_sub$activity]

descriptive_name <- names(data_sub)
descriptive_name <- gsub("[(][)]", "", descriptive_name)
## change the pattern "Acc" to "Accelerometer"
descriptive_name <- gsub("Acc", "Accelerometer", descriptive_name)
## change the patterm "Gyro" to "Gyroscope"
descriptive_name <- gsub("Gyro", "Gyroscope", descriptive_name)
## change the pattern "Mag" to "Magnitude"
descriptive_name <- gsub("Mag", "Magnitude", descriptive_name)
## t at the begining is TimeDomain so replace
descriptive_name <- gsub("^t", "TimeDomain_", descriptive_name)
## f at the begining is FrequencyDomain_ so replace
descriptive_name <- gsub("^f", "FrequencyDomain_", descriptive_name)
## all underscores now and "-mean-" is "_Mean_" for readability, the _ is needed to avoid other matches
descriptive_name <- gsub("-mean-", "_Mean_", descriptive_name)
## -std- becomes _StandardDeviation_
descriptive_name <- gsub("-std-", "_StandardDeviation_", descriptive_name)
## All underscores now
descriptive_name <- gsub("-", "_", descriptive_name)
names(data_sub) <- descriptive_name


tidy_data <- aggregate(data_sub[,3:81], by = list(activity = data_sub$activity, subject = data_sub$subject),FUN = mean)
write.table(x = tidy_data, file = "tidy_data.txt", row.names = FALSE)
