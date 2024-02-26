# Create dataset named data1
data1 <- data.frame(
  x = c(1,2,3,4),
  y = c(51.2,42.3,1.4,6.3),
  z = c("true","false","false","tree")
)

# Create dataset named data2
data2 <- data.frame(
  x = c(1,12,32,4),
  k = c(152.1,42.1,11.4,6.3),
  j = c("Tom","Smith","Jack","Tim")
)

# Print data1 and data2
data1
data2

# Inner join: merge data1 and data2 based on matching values of 'x'
join_data1 <- merge(data1, data2, by = "x")
join_data1

# Left join: merge data1 and data2, keeping all rows from data1
join_data2 <- merge(data1, data2, by = "x", all.y = TRUE)
join_data2

# Right join: merge data1 and data2, keeping all rows from data2
join_data3 <- merge(data1, data2, by = "x", all.x = TRUE)
join_data3

# Full join: merge data1 and data2, keeping all rows from both datasets
join_data4 <- merge(data1, data2, by = "x", all = TRUE)
join_data4

# Create dataset named data3
data3 <- data.frame(
  x = c(100,200,300,400),
  y = c(51.2,5.1,5.2,0.3),
  z = c("true","false","false","tree")
)

# Print data3
data3

# Combine data1 and data3 by rows
merge_data1 <- rbind(data1, data3)
merge_data1

# Combine data1 and data2 by columns
merge_data2 <- cbind(data1, data2)
merge_data2

# Create a new dataset named df
df <- data.frame(
  height = c(160,170,155,180,175),
  weight = c(60,75,55,85,80),
  age = c(25,30,22,35,28)  
)

# Standardization: Add new columns for standardized height and weight
df$weight_st <- scale(df$weight)  # Standardize weight using scale() function
df$height_st <- scale(df$height)  # Standardize height using scale() function
df  # Print the updated dataframe
