# Install necessary packages for data visualization and time series forecasting
install.packages("ggplot2") # For creating graphs and visualizations
install.packages("forecast") # For time series forecasting models

# Load the installed libraries
library(ggplot2) # Load ggplot2 for plotting
library(forecast) # Load forecast for time series analysis

# Read the dataset from the specified file path
data <- read.csv("C://Users//Minusha Attygala//Downloads//Week 1//Coconut_Price_SriLanka_2005_2025.csv")

# Display the structure of the dataset to understand its contents
str(data)

# Convert the 'Month' column to a Date format for proper time series handling
data$Month <- as.Date(data$Month)

# Create a histogram to visualize the distribution of coconut prices
ggplot(data, aes(x= Coconut_Price))+
  geom_histogram(binwidth = 8, fill = "red", color = "black")+ # Set binwidth, fill color, and border color
  labs(title = "Coconut Price Distribution", # Add title and axis labels
       x = "Rs", 
       y = "Frequency")+
  theme_minimal() # Use a minimal theme for the plot

# Convert the coconut price data into a time series object
# 'start' specifies the starting year and month, and 'frequency' indicates monthly data (12)
coco_t_s <- ts(data$Coconut_Price, start = c(2005,1), frequency = 12)

# Plot the time series data
plot(coco_t_s, 
     main = "Coconut Price Time Series", # Title of the plot
     xlab ="Year", # X-axis label
     ylab="Price", # Y-axis label
     col= "darkblue") # Color of the plot line

# Fit an ARIMA model to the time series data automatically
model <- auto.arima(coco_t_s)

# Generate forecasts for the next 24 months (2 years) using the fitted ARIMA model
predict <- forecast(model, h = 24)

# Plot the forecasted values along with confidence intervals
plot(predict)
