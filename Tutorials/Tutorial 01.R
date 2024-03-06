# Load the tidyverse package
# For data manipulation and visualization
library("tidyverse")

# Access documentation for the 'mpg' dataset
?mpg

# Assign the 'mpg' dataset to the variable 'dataset'
dataset <- mpg

# View the dataset using an interactive viewer 
View(dataset)

# Display the first six rows of the dataset
head(dataset)

# Display the last six rows of the dataset
tail(dataset)

# Display summary statistics for the dataset
summary(dataset)

# Create a histogram for the 'cty' variable
hist(dataset$cty)

# Create a customized histogram for the 'cty' variable
hist(dataset$cty, main = "Histogram on fuel consumption in the city area",
     xlab = "Fuel Consumption",
     ylab = "Frequency of cars",
     col = "blue")

# Create a barplot for the counts of car manufacturers
manufacturer_counts <- table(dataset$manufacturer)
barplot(manufacturer_counts,
        main = "Histogram - manufacturer & frequency",
        xlab = "Manufactures",
        ylab = "Frequency",
        col = "skyblue")

# Create a table of car model frequencies
car_model_frequencies <- table(dataset$manufacturer)

# Display the frequencies in a pie chart
pie(car_model_frequencies)

# Create a table of car cylinder frequencies
car_cylinder_frequencies <- table(dataset$cyl)

# Display the frequencies in a pie chart
pie(car_cylinder_frequencies)

# Create a table of car model frequencies
car_model_frequencies <- table(dataset$manufacturer)   

# Display the frequencies in a pie chart with labels and colors
pie(car_model_frequencies,
    label = names(car_model_frequencies),
    main = "Car Manufacturer Distribution",
    col = rainbow(length(car_model_frequencies)),
    init.angle = 90)

# Display a legend for the pie chart
legend("bottomleft", names(car_model_frequencies),
       fill = rainbow(length(car_model_frequencies)))





## Practice Question 

# Load the tidyverse package
# For data manipulation and visualization
library(tidyverse)

# Load the iris data set
data(iris)

# View the dataset using an interactive viewer
View(dataset)

# Display summary statistics for the dataset
summary(dataset)

# Display the structure of the dataset
str(dataset)

# Create customized histograms for Sepal Length, Sepal Width, Petal Length and Petal Width
hist(dataset$Sepal.Length,
     main = "Histogram of Sepal Length",
     xlab = "Sepal Length",
     ylab = "Frequency",
     col = "purple"
)
hist(dataset$Sepal.Width,
     main = "Histogram of Sepal Width",
     xlab = "Sepal Width",
     ylab = "Frequency",
     col = "pink"
)
hist(dataset$Petal.Length,
     main = "Histogram of Petal Length",
     xlab = "Petal Length",
     ylab = "Frequency",
     col = "blue"
)
hist(dataset$Petal.Width,
     main = "Histogram of Petal Width",
     xlab = "Petal Width",
     ylab = "Frequency",
     col = "green"
)


# Filter the dataset for species 'setosa'
setosa_data <- iris[iris$Species == "setosa", ]

# Create a new graphics window
par(mfrow=c(1,3))

# Create histograms for sepal width, petal width, and sepal length
hist(setosa_data$Sepal.Width, main="Sepal Width for Setosa", xlab="Sepal Width", col="lightblue")
hist(setosa_data$Petal.Width, main="Petal Width for Setosa", xlab="Petal Width", col="lightgreen")
hist(setosa_data$Sepal.Length, main="Sepal Length for Setosa", xlab="Sepal Length", col="lightyellow")


# Create bins for sepal width
sepal_width_bins <- cut(iris$Sepal.Width, breaks = 5) 

# Create bins for petal width
petal_width_bins <- cut(iris$Petal.Width, breaks = 5) 

# Create bins for sepal length
sepal_length_bins <- cut(iris$Sepal.Length, breaks = 5)

# Create bins for petal length
petal_length_bins <- cut(iris$Petal.Length, breaks = 5)

# Create pie charts
pie(table(sepal_width_bins), main="Sepal Width")
pie(table(petal_width_bins), main="Petal Width")
pie(table(sepal_length_bins), main="Sepal Length")
pie(table(petal_length_bins), main="Petal Length")




