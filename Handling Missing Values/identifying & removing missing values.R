# Load the 'airquality' dataset from R
dataset1 <- airquality

# Display the structure of the dataset
str(dataset1)

# Sum the missing values (NA) in the dataset
sum(is.na(dataset1))

# Count the number of missing values (NA) in each column
colSums(is.na(dataset1))

# Display the dimensions (number of rows and columns) of the dataset
dim(dataset1)

# Create a new dataset (dataset2) by removing rows with missing values
dataset2 <- na.omit(dataset1)

# Display the dimensions of the dataset after removing missing values
dim(dataset2)

# Sum the missing values (NA) in the new dataset (dataset2)
sum(is.na(dataset2))

# Create a new dataframe (df) by excluding the "Wind" column from the original dataset
df <- dataset1[, !(names(dataset1) == "Wind")]

# Display the structure of the new dataframe (df)
str(df)

