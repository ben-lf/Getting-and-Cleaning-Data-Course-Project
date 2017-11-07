#rInstall required package("data.table")
require("reshape2")

# Load activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Load X_test & y_test data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(X_test) <- features

# Create a logical vector to eExtract only the measurements on the mean and standard deviation for each measurement.
extracted_features <- grepl("mean|std", features)

# Extract only the measurements on the mean and standard deviation for each measurement.
X_test <- X_test[,extracted_features]

# Load activity labels
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("Activity_ID", "Activity_Label")
names(subject_test) <- "subject"

# Combine data
test_data <- cbind((subject_test), y_test, X_test)

# Load and process X_train & y_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) <- features

# Extract only the measurements on the mean and standard deviation for each measurement using logical vector.
X_train <- X_train[,extract_features]

# Load activity data
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("Activity_ID", "Activity_Label")
names(subject_train) <- "subject"

# Combine data
train_data <- cbind((subject_train), y_train, X_train)

# Merge test and train data
dataset <- rbind(test_data, train_data)

# Melt data for easy casting
id_names   <- c("subject", "Activity_ID", "Activity_Label")
data_labels <- setdiff(colnames(dataset), id_names)
all_data      <- melt(dataset, id = id_names, measure.vars = data_labels)

# Use dcast to apply mean function to the melted dataset
tidy_data   <- dcast(all_data, Activity_Label + subject ~ variable, mean)

# Create txt file use semicolon as separator
write.table(tidy_data, "./tidy_data.txt", sep=";", row.names = FALSE)
