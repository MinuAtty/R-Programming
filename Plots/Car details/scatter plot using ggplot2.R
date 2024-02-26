# Load the ggplot2 library for creating visualizations
library(ggplot2)

# Read the CSV file into a data frame named 'data'
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Plots\\Car details\\cardetails v4.csv")

# Display the structure of the data frame
str(data)

# Create a scatter plot with 'Year' on the x-axis and 'Price' on the y-axis
ggplot(data = data, aes(x = data$Year, y = data$Price)) + geom_point()

# Create a scatter plot with 'Kilometer' on the x-axis and 'Price' on the y-axis
ggplot(data = data, aes(x = data$Kilometer, y = data$Price)) + geom_point()

