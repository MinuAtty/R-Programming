# Load the mtcars dataset
data <- mtcars

# Open a viewer to display the data in a tabular format
View(data)

# Display the dimensions (number of rows and columns) of the dataset
dim(data)

# Display the variable names in the dataset
names(data)

# Display the row names of the dataset
rownames(data)

# Access the 'mpg' variable in the dataset
data$mpg

# Access other variables in the dataset
data$cyl
data$disp
data$hp
data$gear
data$vs

# Sort the 'cyl' and 'vs' variables in ascending order
sort(data$cyl)
sort(data$vs)

# Find the maximum and minimum values of the 'cyl' variable
max(data$cyl)
min(data$cyl)

# Find the index of the maximum and minimum values of the 'hp' variable
which.max(data$hp)
which.min(data$hp)

# Find the row name associated with the maximum and minimum values of the 'hp' variable
rownames(data)[which.max(data$hp)]
rownames(data)[which.min(data$hp)]

# Calculate the mean and median of the 'wt' variable
mean(data$wt)
median(data$wt)

# Find the name of the car with the highest frequency in terms of 'wt'
names(sort(-table(data$wt)))[1]

# Calculate quantiles of the 'wt' variable
quantile(data$wt)
quantile(data$wt, c(0.5))
quantile(data$wt, c(0.43))

# Assign the 'disp' column of the 'mtcars' dataset to a variable 'data$disp'

# For values in 'disp' greater than 420, multiply them by 2
mtcars$disp[which(mtcars$disp > 420)] <- c(mtcars$disp[which(mtcars$disp > 420)] * 2)

# Display the 'disp' column of the 'mtcars' dataset
mtcars$disp

# Create a boxplot of the 'disp' column
boxplot(mtcars$disp)

# Find outliers in the 'disp' column using boxplot statistics, without plotting
outliers <- boxplot(mtcars$disp, plot = FALSE)$out

# Display the outliers found
outliers

# Subset 'mtcars' dataset to extract rows where 'disp' values are outliers
mtcars[which(mtcars$disp %in% outliers),]

# Create a new 'mtcars' dataset without the rows containing outliers
newMtcars <- mtcars[-which(mtcars$disp %in% outliers),]

# Create a boxplot of the 'disp' column in the new dataset
boxplot(newMtcars$disp)
