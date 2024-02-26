# Load the 'airquality' dataset
dataset <- airquality

# View the dataset 
View(dataset)

# Display the first six rows of the dataset
head(dataset)

# Display the last six rows of the dataset
tail(dataset)

# Display summary statistics for the dataset
summary(dataset)

# Open the documentation for the 'airquality' dataset
?airquality

# Create a boxplot for the 'Ozone' variable
boxplot(airquality$Ozone)

# Create a customized boxplot for the 'Ozone' variable
boxplot(airquality$Ozone,
        main = "Mean Ozone in parts per billion at Roosevelt Island",
        xlab = "Parts per billion",
        ylab = "Ozone",
        col = "red",
        border = "black",
        horizontal = TRUE,
        notch = TRUE
)

# Create boxplots for 'Temp' variable grouped by 'Month'
boxplot(Temp ~ Month,
        data = airquality,
        main = "Different boxplots for each month",
        xlab = "Month Number",
        ylab = "Degree Fahrenheit",
        col = "brown",
        border = "black"
)




## Practice question

# Considered numbers
numbers <- c(11, 22, 20, 4, 29, 8, 35, 27, 13, 49, 10, 24, 17)

# a) Find the Median
median_value[is.na(median_value)] <- median(median_value, na.rm = TRUE)
median_value

# b) Find the Q1, Q2 (Median), and Q3 Quartiles
Q1 <- quantile(numbers, probs = 0.25)
Q2 <- quantile(numbers, probs = 0.5)  # Also the median
Q3 <- quantile(numbers, probs = 0.75)

# Display the quartiles
Q1
Q2
Q3

# c) Construct a Box Plot
boxplot(numbers, 
        main = "Box Plot", 
        col = "lightblue", 
        border = "black", 
        horizontal = TRUE)

