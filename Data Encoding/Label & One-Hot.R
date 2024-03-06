## Label Encoding

# Create a data frame with two columns: 'city' and 'salary'
df <- data.frame(
  city = c('Colombo','Kandy','Galle','Kandy','Colombo','Kandy'),
  salary = c(1000,2000,3000,2000,1000,2000)
)

# Display the data frame
df

# Add a new column 'city_e' to the data frame 
# Converting the 'city' column into numeric using label encoding with factor and as.numeric
df$city_e <- as.numeric(factor(df$city))

# Display the updated data frame
df


## One-Hot Encoding

# Create a data frame with two columns: 'city' and 'salary'
df <- data.frame(
  city = c('Colombo','Kandy','Galle','Kandy','Colombo','Kandy'),
  salary = c(1000,2000,3000,2000,1000,2000)
)

# Display the data frame
df

# Create a new column 'city_e' in the data frame using one-hot encoding with model.matrix
df$city_e <- model.matrix(~df$city -1, df)

# Display the updated data frame
df

