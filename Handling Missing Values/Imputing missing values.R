# Mean imputation
data <- c(100, 200, 300, 300, NA)
data[is.na(data)] <- mean(data, na.rm = TRUE)
data

# Median imputation
data <- c(100, 200, 300, 300, NA)
data[is.na(data)] <- median(data, na.rm = TRUE)
data

# Mode imputation
data <- c(100, 200, 300, 300, NA)
data[is.na(data)] <- as.numeric(names(which.max(table(data))))
data



# Creating a dataframe 'df'
df <- data.frame(
  col1 = c(100, 200, 300, 300, NA),
  col2 = c(100, 200, 300, 300, NA),
  col3 = c(100, 200, 300, 300, NA)
)

# Displaying the dataframe 'df'
df

# Imputing missing values in 'col1' with the mean of 'col1'
df$col1[is.na(df$col1)] <- mean(df$col1, na.rm = TRUE)

# Displaying the dataframe 'df' after imputing missing values in 'col1'
df

# Imputing missing values in 'col2' with the median of 'col2'
df$col2[is.na(df$col2)] <- median(df$col2, na.rm = TRUE)

# Displaying the dataframe 'df' after imputing missing values in 'col2'
df

# Imputing missing values in 'col3' with the mode of 'col3'
df$col3[is.na(df$col3)] <- as.numeric(names(which.max(table(df$col3))))

# Displaying the dataframe 'df' after imputing missing values in 'col3'
df


# Creating another dataframe 'data'
data <- data.frame(
  col1 = c(41, 36, 12, 18, NA, 28, 23, 19, 8, NA),
  col2 = c(190, 118, 149, 313, NA, NA, 299, 99, 19, 194)
)

# Displaying the dataframe 'data'
data

# Imputing missing values in 'col1' with the mean of 'col1' 
data$col1[is.na(data$col1)] <- mean(data$col1, na.rm = TRUE)

# Displaying the dataframe 'data' after imputing missing values in 'col1'
data




