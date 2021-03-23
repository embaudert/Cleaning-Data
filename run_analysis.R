library(stringr)
library(dplyr)
source("activity_name.R")

test_data_X <- read.fwf("UCI HAR Dataset/test/X_test.txt", rep(16, 561), header = FALSE)
test_data_Y <- read.csv("UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_subject <- read.csv("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_data <- cbind(test_subject, test_data_Y, test_data_X)

train_data_X <- read.fwf("UCI HAR Dataset/train/X_train.txt", rep(16, 561), header = FALSE)
train_data_Y <- read.csv("UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_subject <- read.csv("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train_data <- cbind(train_subject, train_data_Y, train_data_X)

data <- rbind(train_data, test_data)

data_lables <- read.csv("UCI HAR Dataset/features.txt", sep = " ", header = FALSE)[,2]
names(data) <- c("subject", "activity", data_lables)

data[,2] <- sapply(data[,2], activity_name)

data_mean_sdt <- cbind(data[,1:2], data[,str_detect(names(data), "mean()|std()")])

tidy_data <- data_mean_sdt %>% group_by(subject, activity) %>% summarize_all(mean)

names(tidy_data) <- gsub("-", ".", names(tidy_data))
names(tidy_data) <- gsub("()", "", names(tidy_data))
names(tidy_data) <- gsub("^t", "Time", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("f", "Frequency", names(tidy_data))

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
