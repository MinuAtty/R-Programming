#install.packages("ggplot2") 
# Load the ggplot2 library for creating visualizations
library(ggplot2)

# Read the CSV file into a data frame named 'data'
data <- read.csv("C:\\Users\\Minusha Attygala\\OneDrive\\Documents\\R\\Plots\\Longevity\\longevity.csv")

# Display the contents of the data frame
data

# Display summary statistics of the data frame
summary(data)

# Create a density plot using ggplot2
ggplot(data, aes(x = AgeAtDeath, fill = factor(Smokes))) +
  geom_density() +
  facet_grid(Smokes ~ .)

